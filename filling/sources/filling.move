
/// Module: filling
module filling::filling;
use sui::table::{Self, Table};
use std::string::String;
use sui::event;

const EProfileExist: u64 = 1;

public struct State has key {
    id: UID,
    users: Table<address, address>,
}

public struct Profile has key {
    id: UID,
    name: String,
    description: String,
}

public struct ProfileCreated has copy, drop {
    profile: address,
    owner: address,
}

fun init(ctx: &mut TxContext) {
    transfer::share_object(State {
        id: object::new(ctx),
        users: table::new(ctx)
    })
}

public entry fun create_profile(name: String, description: String, state: &mut State, ctx: &mut TxContext) {
    let owner = tx_context::sender(ctx);
    assert!(!table::contains(&state.users, owner), EProfileExist);
    let uid = object::new(ctx);
    let id = object::uid_to_inner(&uid);
    let new_profile = Profile { id: uid, name, description };
    transfer::transfer(new_profile, owner);
    table::add(&mut state.users, owner, object::id_to_address(&id));
    event::emit(ProfileCreated { profile: object::id_to_address(&id), owner });
}


public fun check_if_has_profile(user_address: address, state: &State): Option<address> {
    if (table::contains(&state.users, user_address)) {
        option::some(*table::borrow(&state.users, user_address))
    } else {
        option::none()
    }
}

#[test_only]
public fun init_for_testing(ctx: &mut TxContext) {
    init(ctx)
}
