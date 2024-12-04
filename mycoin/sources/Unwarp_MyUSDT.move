module mycoin::UNYUSDT {
    use sui::tx_context;
    use sui::balance;
    use sui::tx_context::sender;
    use sui::transfer;
    use sui::coin;
    use std::option;
    use sui::object::UID;
    use sui::object;

    struct UNYUSDT has drop {}

    struct MySupply has key, store {
        id: UID,
        supply: balance::Supply<UNYUSDT>
    }

    fun init(witness: UNYUSDT, ctx: &mut tx_context::TxContext) {
        let (cap, metadata) = coin::create_currency(
            witness,
            8,
            b"UNYUSDT",
            b"UNYUSDT",
            b"This is My Unwarp USDT",
            option::none(),
            ctx
        );
        transfer::public_share_object(metadata);
        let supply = coin::treasury_into_supply(cap);
        transfer::public_transfer(MySupply {
            id: object::new(ctx),
            supply
        }, sender(ctx));
    }

    public entry fun mint(supply: &mut MySupply, value: u64, ctx: &mut tx_context::TxContext) {
        let balance = balance::increase_supply(&mut supply.supply, value);
        let coin = coin::from_balance(balance, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }

    #[test_only]
    public fun test_init(ctx: &mut tx_context::TxContext) {
        init(UNYUSDT{}, ctx);
    }
}
