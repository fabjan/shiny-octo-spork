signature LOVE = sig
    structure Keyboard : sig
        val isDown : string -> bool
    end

	structure Graphics : sig
        val setColor : real -> real -> real -> real -> unit
		val print : string -> int -> int -> unit
	end

    structure Math : sig
        val random : unit -> real
    end
end
