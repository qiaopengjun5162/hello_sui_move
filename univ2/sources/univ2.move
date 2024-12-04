/// Module: univ2
module univ2::univ2;
use std::u64;
use sui::balance::{Self, Supply, Balance};
use sui::coin::{Self, Coin};
use sui::transfer::{public_transfer, share_object, transfer};

public struct AdminCap has key {
    id: UID
}

public struct Pool<phantom CoinA, phantom CoinB> has key {
    id: UID,
    a: Balance<CoinA>,
    b: Balance<CoinB>,
    lp: Supply<LPCoin<CoinA, CoinB>>,
    scalar: u64,
}

// deposit token
public struct LPCoin<phantom CoinA, phantom CoinB> has drop {}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap {
        id: object::new(ctx)
    };

    transfer(adminCap, ctx.sender());
}

public entry fun create_pool<CoinA, CoinB>(_: &AdminCap, ctx: &mut TxContext) {
    let lp = balance::create_supply(LPCoin<CoinA, CoinB> {});
    let pool = Pool<CoinA, CoinB> {
        id: object::new(ctx),
        a: balance::zero<CoinA>(),
        b: balance::zero<CoinB>(),
        lp,
        scalar: 100000000,
    };
    share_object(pool);
}

// deposit
public entry fun deposit_pool<CoinA, CoinB>(
    pool: &mut Pool<CoinA, CoinB>,
    coin_a: Coin<CoinA>,
    coin_b: Coin<CoinB>,
    ctx: &mut TxContext
) {
    let a_value = pool.a.value();
    let b_value = pool.b.value();

    let coin_a_value = coin_a.value();
    let coin_b_value = coin_b.value();

    assert!(a_value / b_value == coin_a_value / coin_b_value, 0x000222);

    pool.a.join(coin::into_balance(coin_a));
    pool.b.join(coin::into_balance(coin_b));

    let lp_coin_amt = u64::sqrt(coin_a_value * coin_b_value);
    let lp_balance = pool.lp.increase_supply(lp_coin_amt);
    public_transfer(coin::from_balance(lp_balance, ctx), ctx.sender());
}

// withdraw
public entry fun withdraw<CoinA, CoinB>(
    pool: &mut Pool<CoinA, CoinB>,
    // coin: Coin<LPCoin<CoinA, CoinB>>,
    amount: u64,
    ctx: &mut TxContext
) {
    let withdrawBalance = pool.a.split(amount);
    public_transfer(coin::from_balance(withdrawBalance, ctx), ctx.sender());
}


// swap
public entry fun a_to_b<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin: Coin<CoinA>, ctx: &mut TxContext) {
    let a_value = pool.a.value();
    let b_value = pool.b.value();

    let const_value = a_value * b_value;

    let a_swap_amt = coin.value();
    let total_pool_a = a_value + a_swap_amt;

    // total_pool_a * total_pool_b = const_value;
    let total_pool_b = const_value / total_pool_a;
    let b_swap_amt = b_value - total_pool_b;

    pool.a.join(coin::into_balance(coin));
    let b_balance = pool.b.split(b_swap_amt);
    public_transfer(coin::from_balance(b_balance, ctx), ctx.sender());
}

public entry fun b_to_a<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin: Coin<CoinB>, ctx: &mut TxContext) {
    let a_value = pool.a.value();
    let b_value = pool.b.value();

    let const_value = a_value * b_value;

    let b_swap_amt = coin.value();
    let total_pool_b = b_value + b_swap_amt;

    // total_pool_a * total_pool_b = const_value;
    let total_pool_a = const_value / total_pool_b;
    let a_swap_amt = a_value - total_pool_a;

    pool.b.join(coin::into_balance(coin));
    let a_balance = pool.a.split(a_swap_amt);
    public_transfer(coin::from_balance(a_balance, ctx), ctx.sender());
}