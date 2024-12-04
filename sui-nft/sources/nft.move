#[lint_allow(self_transfer)]
module nft::my_nft {
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8, String};
    use sui::transfer::{Self, public_transfer};
    use sui::object::{Self, UID};
    use sui::package;
    use sui::display;

    struct MyNFT has key, store {
        id: UID,
        name: String,
        image_url: String
    }

    struct MY_NFT has drop {}

    fun init(otw: MY_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{image_url}")
        ];

        let publisher = package::claim(otw, ctx);

        let display = display::new_with_fields<MyNFT>(
            &publisher,
            keys,
            values,
            ctx
        );

        display::update_version(&mut display);
        
        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
    }


    public entry fun mint(ctx: &mut TxContext) {
        let name = utf8(b"my_nft");
        let image_url = utf8(b"https://rustacean.net/assets/rustacean-orig-noshadow.png");
        let nft = MyNFT {
            id: object::new(ctx),
            name,
            image_url
        };
        public_transfer(nft, sender(ctx));
    }

}
