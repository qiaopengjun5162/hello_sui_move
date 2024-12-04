/// Module: hello_sui
module hello_sui::hello_sui {
    use std::string::{String, utf8};

    public fun hello_world_bytes(): vector<u8> {
        b"hello world"
    }

    // public functions
    public fun hello_world(): String {
        utf8(hello_world_bytes())
    }

    public fun hello_sui(): String {
        utf8(b"hello sui")
    }

    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    public fun try_borrow(vec: &vector<u64>, i: u64): Option<u64> {
        let vec_len: u64 = vec.length();
        if (vec_len > i) {
            option::some(*vec.borrow(i))
        } else {
            option::none()
        }
    }

    #[test_only]
    public fun numbers(): vector<u64> { vector[1, 2, 3] }
}

