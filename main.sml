val state = Lua.newTable ()

fun load' _ =
	let val game = init ()
		val _ = Lua.setField (state, "game", Lua.unsafeToValue game)
	in
		#[]
	end

fun update' args =
	let val game = Lua.field (state, "game")
		val dt = Lua.checkReal (Vector.sub (args, 0))
	    val game' = update dt (Lua.unsafeFromValue game)
		val _ = Lua.setField (state, "game", Lua.unsafeToValue game')
	in
		#[]
	end

fun draw' _ =
	let val game = Lua.field (state, "game")
		val _ = draw (Lua.unsafeFromValue game)
	in
		#[]
	end

val _ = Love.setLoad (Lua.function load')
val _ = Love.setUpdate (Lua.function update')
val _ = Love.setDraw (Lua.function draw')
