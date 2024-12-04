module mycoin::SHARED_MYUSDT {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context;

    // witness
    struct SHARED_MYUSDT has drop {}

    fun init(witness: SHARED_MYUSDT, ctx: &mut tx_context::TxContext) {
        let (cap, metadata) = coin::create_currency(
            witness,
            8,
            b"sHyUSDT",
            b"SHYUSDT",
            b"This is My shared USDT",
            option::none(),
            ctx,
        );
        transfer::public_share_object(metadata);
        transfer::public_share_object(cap);
    }

    #[test_only]
    public fun test_init(ctx: &mut tx_context::TxContext) {
        init(SHARED_MYUSDT{}, ctx);
    }
}
