signature LUA =
sig
  type value
  exception Error of value
  exception TypeError of string
  val field: value * string -> value (* t[k] *)
  val setField: value * string * value -> unit (* t[k] = v *)
  val global: string -> value (* _ENV[name] *)
  val call0: value -> value vector -> unit (* f(args) *)
  val call1: value -> value vector -> value (* f(args) *)
  val method: value * string -> value vector -> value vector (* f:name(args) *)
  val fromBool: bool -> value
  val fromInt: int -> value
  val fromWord: word -> value
  val fromReal: real -> value
  val fromString: string -> value
  val unsafeToValue: 'a -> value
  val unsafeFromValue: value -> 'a
  val newTable: unit -> value (* {} *)
  val function: (value vector -> value vector) -> value
  val checkString: value -> string
  val checkBoolean: value -> bool
  val checkInt: value -> int
  val checkWord: value -> word
  val checkReal: value -> real
end
