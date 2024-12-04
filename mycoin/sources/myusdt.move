module mycoin::MyUSDT {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext, sender};

    // witness
    struct MyUSDT has drop {}

    fun init(witness: MyUSDT, ctx: &mut TxContext) {
        let (cap, metadata) = coin::create_currency(
            witness, 8, b"MyUSDT", b"MyUSDT", b"This is My USDT", option::none(), ctx 
        );
        transfer::public_share_object(metadata);
        transfer::public_transfer(cap, sender(ctx));
    }

    #[test_only]
    public fun test_init(ctx: &mut tx_context::TxContext) {
        init(MyUSDT{}, ctx);
    }
}
