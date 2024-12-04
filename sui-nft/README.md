# sui-nft

## 实操

```shell
sui move new sui-nft

ls

cd sui-nft/

c

Code/sui/sui-nft via 🅒 base took 2.3s 
➜ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui-nft
Total number of linter warnings suppressed: 1 (filtered categories: 1)

Code/sui/sui-nft via 🅒 base took 2.3s 
➜ sui client gas                                                        
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.2
╭────────────────────────────────────────────────────────────────────┬────────────╮
│ gasCoinId                                                          │ gasBalance │
├────────────────────────────────────────────────────────────────────┼────────────┤
│ 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74 │ 1000000000 │
│ 0x3fb5d73b96a9fcdfd9c30e952e1413e9615b76a9cfe9fa0d65d30e0289488f59 │ 987559720  │
│ 0x403b24a043814c15a6a0352ebc408c247b99b68b22f00e0b7964588d88f82c40 │ 1000000000 │
│ 0x7044b5d86863ae20d497e4f0e256ab693550804f2d77d50f6498dd0ee7c1cb01 │ 1000000000 │
│ 0x8abfdeeaf650a4d5600076a5f6f3a60a3fd62ed058972588b1f6adff8969ffec │ 1000000000 │
│ 0xabe40928fcb9a8254fa68668e37435e3af92d16c531f3a422878ad142ca0ed4a │ 1000000000 │
╰────────────────────────────────────────────────────────────────────┴────────────╯

Code/sui/sui-nft via 🅒 base took 2.9s 
➜ sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.2
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui-nft
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
FpT3Z17zRhEP7K8nC6PsSqjcQdgp4uuy5SoR6PB3WAin
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                                                  │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                                                                                   │
│  │ Version: 12675216                                                                                                                                        │
│  │ Digest: 6XwVXr1CMQEjWP7SUXnEkxcaXfxnZUDkwnYYUFBLSDMk                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    AKBhARP7KlaB2M4l8Mxq6fuHJQMWjAYyo8dyE09gYVBRSWzvc3zd3Ohd4wRQEcA63OHSs+QfVu1an9mhSaEwBA==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FpT3Z17zRhEP7K8nC6PsSqjcQdgp4uuy5SoR6PB3WAin                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 197                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2833ecba998c8bafd65bf68ea892b7a92f342e2e7d026489388d7b69b64553ab                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675217                                                                              │
│  │ Digest: GuBZaeMm6tQve96KBUbgtiQztZRJQgv4EK8B9v23qQUL                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5b9b522def4878d8f53e7ba76687d03cadb49a67329f1349df109fed0b50cf33                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675217                                                                              │
│  │ Digest: CiKcXoWNGmP2nNGo9vhpuoN9NnvhSbkCBuPupr4jujag                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: ChEoXDeirt6tLcc7eaBqGeCFHqBkjfMViErV2AVQnkyR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9231db1356e00b045d8bac55ab0c77d6cf81e9307ae62684184dd8cc02f91762                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675217                                                                              │
│  │ Digest: D66h9VMyVRhkbS5NzqDJPQarkzWMrhufheJerdwCxjv2                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675217                                                                              │
│  │ Digest: 8Zn3u387fRrXrG4Akm4nT7FDfkkH9Pr87SJvta8Qc3Uw                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675217                                                                              │
│  │ Digest: 8Zn3u387fRrXrG4Akm4nT7FDfkkH9Pr87SJvta8Qc3Uw                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15116400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3pcBpJcaTZJstk5Ssu13zXjSaNQX2Xw1U2F66C9dajq5                                                   │
│    8bXruRDKz5XA5geF5k6cVyqQVgis8j4rRQA3ztoehc9N                                                   │
│    Bkvb1fhqAgtZFiV16EweRNXFgutju5LV87tVA8W6c7za                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array [
    Object {
        "id": Object {
            "txDigest": String("FpT3Z17zRhEP7K8nC6PsSqjcQdgp4uuy5SoR6PB3WAin"),
            "eventSeq": String("0"),
        },
        "packageId": String("0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e"),
        "transactionModule": String("my_nft"),
        "sender": String("0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73"),
        "type": String("0x2::display::DisplayCreated<0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e::my_nft::MyNFT>"),
        "parsedJson": Object {
            "id": String("0x2833ecba998c8bafd65bf68ea892b7a92f342e2e7d026489388d7b69b64553ab"),
        },
        "bcs": String("3hwEN4RoQhzWjuRKhJ1NGywrjx9P892qevJRJnGVh2LS"),
    },
    Object {
        "id": Object {
            "txDigest": String("FpT3Z17zRhEP7K8nC6PsSqjcQdgp4uuy5SoR6PB3WAin"),
            "eventSeq": String("1"),
        },
        "packageId": String("0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e"),
        "transactionModule": String("my_nft"),
        "sender": String("0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73"),
        "type": String("0x2::display::VersionUpdated<0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e::my_nft::MyNFT>"),
        "parsedJson": Object {
            "fields": Object {
                "contents": Array [
                    Object {
                        "key": String("name"),
                        "value": String("{name}"),
                    },
                    Object {
                        "key": String("image_url"),
                        "value": String("{image_url}"),
                    },
                ],
            },
            "id": String("0x2833ecba998c8bafd65bf68ea892b7a92f342e2e7d026489388d7b69b64553ab"),
            "version": Number(1),
        },
        "bcs": String("QDUetw1ZzJrBx9AvTojfUo4zAMiGiaBbQXFMY4o5MoZY7LSPnQz7BkBKgVszUY9jciXHJdxyN1yAGJNphtuDMs6C3KmtSg"),
    },
]
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x2833ecba998c8bafd65bf68ea892b7a92f342e2e7d026489388d7b69b64553ab
 │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )
 │ ObjectType: 0x2::display::Display<0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e::my_nft::MyNFT> 
 │ Version: 12675217
 │ Digest: GuBZaeMm6tQve96KBUbgtiQztZRJQgv4EK8B9v23qQUL
 └──
 ┌──
 │ ObjectID: 0x5b9b522def4878d8f53e7ba76687d03cadb49a67329f1349df109fed0b50cf33
 │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 12675217
 │ Digest: CiKcXoWNGmP2nNGo9vhpuoN9NnvhSbkCBuPupr4jujag
 └──
 ┌──
 │ ObjectID: 0x9231db1356e00b045d8bac55ab0c77d6cf81e9307ae62684184dd8cc02f91762
 │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )
 │ ObjectType: 0x2::package::Publisher 
 │ Version: 12675217
 │ Digest: D66h9VMyVRhkbS5NzqDJPQarkzWMrhufheJerdwCxjv2
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74
 │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 12675217
 │ Digest: 8Zn3u387fRrXrG4Akm4nT7FDfkkH9Pr87SJvta8Qc3Uw
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e 
 │ Version: 1 
 │ Digest: ChEoXDeirt6tLcc7eaBqGeCFHqBkjfMViErV2AVQnkyR
 | Modules: my_nft
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -15138280
 └──

Code/sui/sui-nft via 🅒 base took 4.9s 
➜ sui client call --package 0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e --module my_nft --function mint --gas-budget 10000000                         
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.2
----- Transaction Digest ----
ETuykynuY7PKuYHBokGpfyn5Ec8ujLzWcqtXhqztD9to
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000                                                                            │
│ Gas Price: 1000                                                                                 │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                       │
│  │ Version: 12675217                                                                            │
│  │ Digest: 8Zn3u387fRrXrG4Akm4nT7FDfkkH9Pr87SJvta8Qc3Uw                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind : Programmable                                                                 │
│ Inputs: []                                                                                      │
│ Commands: [                                                                                     │
│   MoveCall(0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e::my_nft::mint()), │
│ ]                                                                                               │
│                                                                                                 │
│                                                                                                 │
│ Signatures:                                                                                     │
│    lAgEw6D6P0R9pAAJIROkgRZHY3xSIwoYM4Jko/jWTJ95AdSOPOHy2h9lcA6KEJSOw3j/tUu9F+TP0Wj5DGDVCg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: ETuykynuY7PKuYHBokGpfyn5Ec8ujLzWcqtXhqztD9to                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 197                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x620ebcad42f04a4cbb313ad61d189517dbfc92c5f3190ee66e818ef9dcc46006                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675218                                                                              │
│  │ Digest: BxeaWdydHmZUjeVoiVUkh4mgArDjw9k5fs7CUx9qA2za                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675218                                                                              │
│  │ Digest: 529XAx4BBUZ6id9ygg2bioTCXQ9ApTzfLdkPQ3LWhoQp                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 12675218                                                                              │
│  │ Digest: 529XAx4BBUZ6id9ygg2bioTCXQ9ApTzfLdkPQ3LWhoQp                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2751200                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    FpT3Z17zRhEP7K8nC6PsSqjcQdgp4uuy5SoR6PB3WAin                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x620ebcad42f04a4cbb313ad61d189517dbfc92c5f3190ee66e818ef9dcc46006
 │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )
 │ ObjectType: 0x6201d43bdd556076288ce5be061f187c8fe060d1b8dd5d8edfd4e83990a92f2e::my_nft::MyNFT 
 │ Version: 12675218
 │ Digest: BxeaWdydHmZUjeVoiVUkh4mgArDjw9k5fs7CUx9qA2za
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74
 │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 12675218
 │ Digest: 529XAx4BBUZ6id9ygg2bioTCXQ9ApTzfLdkPQ3LWhoQp
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -2773080
 └──

Code/sui/sui-nft via 🅒 base took 3.5s
```

- <https://suiexplorer.com/object/0x620ebcad42f04a4cbb313ad61d189517dbfc92c5f3190ee66e818ef9dcc46006?network=testnet>
