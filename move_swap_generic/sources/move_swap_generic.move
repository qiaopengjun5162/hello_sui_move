/// Module: move_swap_generic
module move_swap_generic::move_swap_generic;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::transfer::{public_transfer, share_object, transfer};

public struct AdminCap has key {
    id: UID
}

public struct Pool<phantom CoinA, phantom CoinB> has key {
    id: UID,
    a: Balance<CoinA>,
    b: Balance<CoinB>,
    x: u64,
    y: u64,
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap {
        id: object::new(ctx)
    };

    transfer(adminCap, ctx.sender());
}

public entry fun create_pool<CoinA, CoinB>(x: u64, y: u64, _: &AdminCap, ctx: &mut TxContext) {
    let pool = Pool<CoinA, CoinB> {
        id: object::new(ctx),
        a: balance::zero<CoinA>(),
        b: balance::zero<CoinB>(),
        x,
        y
    };
    share_object(pool);
}

// deposit
public entry fun deposit_a<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin: Coin<CoinA>, _: &mut TxContext) {
    pool.a.join(coin::into_balance(coin));
}

public entry fun deposit_b<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin: Coin<CoinB>, _: &mut TxContext) {
    pool.b.join(coin::into_balance(coin));
}

// withdraw
public entry fun withdraw_a<CoinA, CoinB>(_: &AdminCap, pool: &mut Pool<CoinA, CoinB>, amount: u64, ctx: &mut TxContext) {
    let withdrawBalance = pool.a.split(amount);
    public_transfer(coin::from_balance(withdrawBalance, ctx), ctx.sender());
}

public entry fun withdraw_b<CoinA, CoinB>(_: &AdminCap, pool: &mut Pool<CoinA, CoinB>, amount: u64, ctx: &mut TxContext) {
    let withdrawBalance = pool.b.split(amount);
    public_transfer(coin::from_balance(withdrawBalance, ctx), ctx.sender());
}

// swap
public entry fun a_to_b<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin: Coin<CoinA>, ctx: &mut TxContext) {
    let a_amt = coin.value();
    let b_amt = a_amt * pool.x / pool.y;

    pool.a.join(coin::into_balance(coin));
    let b_balance = pool.b.split(b_amt);
    public_transfer(coin::from_balance(b_balance, ctx), ctx.sender());
}

public entry fun b_to_a<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin: Coin<CoinB>, ctx: &mut TxContext) {
    let b_amt = coin.value();
    let a_amt = b_amt * pool.y / pool.x;

    pool.b.join(coin::into_balance(coin));
    let a_balance = pool.a.split(a_amt);
    public_transfer(coin::from_balance(a_balance, ctx), ctx.sender());
}
