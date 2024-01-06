structure Love = Love (Lua)

structure CoinFlip = CoinFlip (Love)

structure Engine = Engine(
	structure Lua = Lua
	structure Love = Love
	structure Game = CoinFlip
)

val _ = Engine.runGame()
