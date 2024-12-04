# 汇率
恒定乘积
x * y = l

```sui move
// balance
let a_value = pool.a.value();
let b_value = pool.b.value();

let const_value = a_value * b_value;

let a_swap_amt = coin.value();
let total_pool_a = a_value + a_swap_amt;

total_pool_a * total_pool_b = const_value;
let total_pool_b = const_value / total_pool_a;
let b_swap_amt = b_value - total_pool_b;

```