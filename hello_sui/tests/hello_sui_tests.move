#[test_only]
module hello_sui::hello_sui_tests {
    use std::debug;
    use std::type_name;
    use hello_sui::hello_sui;

    #[test]
    fun test_hello_sui() {
        debug::print(&hello_sui::hello_sui());
    }

    #[test]
    fun test_hello_world() {
        debug::print(&hello_sui::hello_world());
    }

    #[test]
    fun test_hello_world_bytes() {
        debug::print(&hello_sui::hello_world_bytes());
    }

    #[test]
    fun test_sum() {
        let sum_result = hello_sui::sum(1, 2);
        debug::print(&sum_result);
        assert!(sum_result == 3, 0);
    }

    #[test]
    fun test_vector() {
        let mut numbers = hello_sui::numbers();
        debug::print(&numbers);
        std::vector::push_back(&mut numbers, 4);
        debug::print(&numbers);
        numbers.push_back(4);
        debug::print(&numbers);
        numbers.pop_back();
        debug::print(&numbers);

        let mut idx = 0;
        while (idx < numbers.length()) {
            let num = numbers.borrow(idx);
            debug::print(num);
            idx = idx + 1;
        };
        debug::print(&numbers);

        let mut idx = 0;
        loop {
            if (idx >= numbers.length()) break;
            let num = numbers.borrow(idx);
            debug::print(num);
            idx = idx + 1;
        };
        debug::print(&numbers);
    }

    #[test]
    fun test_option() {
        let numbers = hello_sui::numbers();

        let opt = hello_sui::try_borrow(&numbers, 0);
        debug::print(&opt);
        assert!(opt.is_some(), 0);
        assert!(opt.borrow() == 1, 0);
        assert!(*opt.borrow() == 1, 0);


        let opt = hello_sui::try_borrow(&numbers, 3);
        debug::print(&opt);
        assert!(opt.is_none(), 0);
    }

    #[test]
    fun test_type_name() {
        debug::print(&type_name::get<u64>());
        debug::print(&type_name::get<vector<u64>>());
        debug::print(&type_name::get<Option<u64>>());
    }
}
