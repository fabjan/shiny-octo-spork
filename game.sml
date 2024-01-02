datatype coinflip = Heads | Tails

fun coinflipString Heads = "Heads"
|	coinflipString Tails = "Tails"

type game = {
	time : real,
	flips : int,
	charging : bool,
	coin : coinflip
}

fun gameString (game : game) =
	"Time: " ^ Real.fmt (StringCvt.FIX (SOME 2)) (#time game) ^ "\n" ^
	"Flips: " ^ Int.toString (#flips game) ^ "\n" ^
	"Coin: " ^ coinflipString (#coin game)

structure Love = Love (Lua)

fun newCoin () =
	if Love.Math.random () < 0.5
	then Heads
	else Tails

fun startCharging (game : game) =
	{
		time = #time game,
		flips = #flips game,
		charging = true,
		coin = #coin game
	}

fun flipCoin (game : game) =
	{
		time = #time game,
		flips = #flips game + 1,
		charging = false,
		coin = newCoin ()
	}

fun updateTime (dt : real) (game : game) =
	{
		time = #time game + dt,
		flips = #flips game,
		charging = #charging game,
		coin = #coin game
	}

fun init () : game =
	{
		time = 0.0,
		flips = 0,
		charging = false,
		coin = newCoin ()
	}

fun update (dt : real) (game : game) =
	let
		val game = updateTime dt game
		val charging = #charging game
		val pressing = Love.Keyboard.isDown "space"
	in
		case (charging, pressing) of
			(false, true) => startCharging game
		|	(true, false) => flipCoin game
		|	_ => game
	end

fun draw (game : game) =
	(
		Love.Graphics.setColor 1.0 1.0 1.0 1.0;
		Love.Graphics.print "Press space to flip the coin." 10 10;
		Love.Graphics.print (gameString game) 10 30;
		()
	)
