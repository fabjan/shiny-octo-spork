signature GAME = sig
    type t
    val init : unit -> t
    val update : real -> t -> t
    val draw : t -> unit
end
