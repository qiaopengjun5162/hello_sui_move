module mycoin::MyUSDT_2 {
    use sui::object::UID;
    use sui::object;
    use sui::coin;
    use sui::transfer;
    use sui::balance;
    use sui::tx_context::{TxContext, sender};

    struct MyUSDT_2 has drop {}

    struct MySupply has key, store {
        id: UID,
        supply: balance::Supply<MyUSDT_2>
    }

    fun init(witness: MyUSDT_2, ctx: &mut TxContext) {
        let supply = balance::create_supply(witness);
        transfer::public_transfer(MySupply {
            id: object::new(ctx),
            supply
        }, sender(ctx));
    }

    public entry fun mint(supply: &mut MySupply, value: u64, ctx: &mut TxContext) {
        let balance = balance::increase_supply(&mut supply.supply, value);
        let coin = coin::from_balance(balance, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MyUSDT_2{}, ctx);
    }
}
