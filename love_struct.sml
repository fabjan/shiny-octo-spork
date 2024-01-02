structure Love = struct

    fun setLoad (f : Lua.value) : unit =
        Lua.setField (Lua.global "love", "load", f)
    fun setUpdate (f : Lua.value) : unit =
        Lua.setField (Lua.global "love", "update", f)
    fun setDraw (f : Lua.value) : unit =
        Lua.setField (Lua.global "love", "draw", f)

    structure Keyboard = struct
        fun isDown (key : string) : bool =
            let
                val keyboard = Lua.field (Lua.global "love", "keyboard")
                val key = Lua.fromString key
                val res = Lua.call1 (Lua.field (keyboard, "isDown")) #[key]
            in
                Lua.checkBoolean res
            end
    end

	structure Graphics = struct
        fun setColor (r : real) (g : real) (b : real) (a : real) : unit =
            let
                val graphics = Lua.field (Lua.global "love", "graphics")
                val r = Lua.fromReal r
                val g = Lua.fromReal g
                val b = Lua.fromReal b
                val a = Lua.fromReal a
            in
                Lua.call0 (Lua.field (graphics, "setColor")) #[r, g, b, a]
            end
		fun print (s : string) (x : int) (y : int) : unit =
			let
                val graphics = Lua.field (Lua.global "love", "graphics")
				val s = Lua.fromString s
				val x = Lua.fromInt x
				val y = Lua.fromInt y
			in
				Lua.call0 (Lua.field (graphics, "print")) #[s, x, y]
			end
	end

    structure Math = struct
        fun random () : real =
            let
                val math = Lua.field (Lua.global "love", "math")
                val res = Lua.call1 (Lua.field (math, "random")) #[]
            in
                Lua.checkReal res
            end
    end
end
