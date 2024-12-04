module hello_world::transcript {
    use sui::object::{Self, ID, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::event;

    public struct TranscriptObject has key {
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }

    public struct WrappableTranscript has key, store {
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }

    public struct Folder has key {
        id: UID,
        transcript: WrappableTranscript,
        intended_address: address
    }

    // Type that marks the capability to create, update, and delete transcripts
    public struct TeacherCap has key {
        id: UID,
    }

    // Events
    /// Event marking when a transcript has been requested
    public struct TranscriptRequestEvent has copy, drop {
        // The Object ID of the transcript wrapper
        wrapper_id: ID,
        // The requester of the transcript
        requester: address,
        // The intended address of the transcript
        intended_address: address,
    }

    // Errors
    const ENotIntendedAddress: u64 = 1;

    /// Module initializer is called only once on module publish.
    fun init(ctx: &mut TxContext) {
        transfer::transfer(TeacherCap {
            id: object::new(ctx)
        }, tx_context::sender(ctx))
    }

    public entry fun add_additional_teacher(_: &TeacherCap, new_teacher_address: address, ctx: &mut TxContext) {
        transfer::transfer(TeacherCap {
            id: object::new(ctx)
        }, new_teacher_address)
    }

    public entry fun request_transcript(transcript: WrappableTranscript, intended_address: address, ctx: &mut TxContext) {
        let folderObject = Folder {
            id: object::new(ctx),
            transcript,
            intended_address
        };
        event::emit(TranscriptRequestEvent {
            wrapper_id: object::uid_to_inner(&folderObject.id),
            requester: tx_context::sender(ctx),
            intended_address,
        });
        // We transfer the wrapped transcript object directly to the intended_address
        transfer::transfer(folderObject, intended_address)
    }

    public entry fun unpack_wrapped_transcript(folder: Folder, ctx: &mut TxContext) {
        // Check that the person unpacking the transcript is the intended_address
        assert!(folder.intended_address == tx_context::sender(ctx), ENotIntendedAddress);
        let Folder {
            id,
            transcript,
            intended_address: _,
        } = folder;
        transfer::transfer(transcript, tx_context::sender(ctx));
        // Deletes the wrapper Folder object
        object::delete(id)
    }

    public entry fun create_transcript_object(_: &TeacherCap, history: u8, math: u8,literature: u8, ctx: &mut TxContext) {
        let transcriptObject = TranscriptObject { id: object::new(ctx), history, math, literature};
        transfer::transfer(transcriptObject, tx_context::sender(ctx))
        // https://docs.sui.io/concepts/object-ownership/immutable#create-immutable-object
        // transfer::freeze_object(transcriptObject);
        // https://docs.sui.io/concepts/object-ownership/shared
        // transfer::share_object(transcriptObject);
    }

    // struct Transcript {
    //     history: u8,
    //     math: u8,
    //     literature: u8,
    // }

    public fun view_score(transcriptObject: &TranscriptObject): u8 {
        transcriptObject.literature
    }

    public entry fun update_score(transcriptObject: &mut TranscriptObject, score: u8) {
        transcriptObject.literature = score
    }

    public entry fun delete_transcript(transcriptObject:  TranscriptObject) {
        let TranscriptObject { id, history: _, math: _, literature: _ } = transcriptObject;
        object::delete(id);
    }
}
