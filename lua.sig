signature LUA =
sig
  type value
  exception Error of value
  exception TypeError of string
  val sub: value * value -> value (* t[k] *)
  val field: value * string -> value (* t[k] *)
  val set: value * value * value -> unit (* t[k] = v *)
  val setField: value * string * value -> unit (* t[k] = v *)
  val global: string -> value (* _ENV[name] *)
  val setGlobal: string * value -> unit (* _ENV[name] = v *)
  val call: value -> value vector -> value vector (* f(args) *)
  val call0: value -> value vector -> unit (* f(args) *)
  val call1: value -> value vector -> value (* f(args) *)
  val call2: value -> value vector -> value * value (* f(args) *)
  val call3: value -> value vector -> value * value * value (* f(args) *)
  val method: value * string -> value vector -> value vector (* f:name(args) *)
  val NIL: value (* Lua nil *)
  val isNil: value -> bool (* x == nil *)
  val isFalsy: value -> bool (* not x *)
  val fromBool: bool -> value
  val fromInt: int -> value
  val fromWord: word -> value
  val fromReal: real -> value
  val fromString: string -> value
  val unsafeToValue: 'a -> value
  val unsafeFromValue: value -> 'a
  val newTable: unit -> value (* {} *)
  val function: (value vector -> value vector) -> value
  val + : value * value -> value
  val - : value * value -> value
  val * : value * value -> value
  val / : value * value -> value
  (* val // : value * value -> value (* not in LuaJIT *) *)
  val % : value * value -> value
  val pow: value * value -> value (* x ^ y *)
  val negate: value -> value (* unary minus *)
  val andb: value * value -> value (* x & y *)
  val orb: value * value -> value (* x | y *)
  val xorb: value * value -> value (* x ~ y *)
  val notb: value -> value (* ~ x *)
  val << : value * value -> value
  val >> : value * value -> value
  val == : value * value -> bool
  val ~= : value * value -> bool
  val < : value * value -> bool
  val > : value * value -> bool
  val <= : value * value -> bool
  val >= : value * value -> bool
  val concat: value * value -> value (* x .. y *)
  val length: value -> value (* #x *)
  val typeof: value -> string (* type *)
  val checkString: value -> string
  val checkBoolean: value -> bool
  val checkInt: value -> int
  val checkWord: value -> word
  val checkReal: value -> real
  val optString: value -> string option
  structure Lib:
  sig
    val GLOBAL: value (* _G *)
    val VERSION: value (* _VERSION *)
    val assert: value
    val collectgarbage: value
    val coroutine: value
    val debug: value
    val dofile: value
    val error: value
    val getmetatable: value
    val io: value
    val ipairs: value
    val load: value
    val loadfile: value
    val math: value
    val next: value
    val os: value
    val package: value
    val pairs: value
    val pcall: value
    val print: value
    val rawequal: value
    val rawget: value
    (* val rawlen: value (* not in LuaJIT *) *)
    val rawset: value
    val require: value
    val select: value
    val setmetatable: value
    val string: value
    val table: value
    val tonumber: value
    val tostring: value
    val type': value
    (* val utf8: value (* not in LuaJIT *) *)
    (* val warn : value (* Lua 5.4 *) *)
    val xpcall: value
    structure coroutine:
    sig
      (* val close : value (* Lua 5.4 *) *)
      val create: value
      (* val isyieldable: value (* not in LuaJIT *) *)
      val resume: value
      val running: value
      val status: value
      val wrap: value
      val yield: value
    end
    structure debug:
    sig
      val debug: value
      val gethook: value
      val getinfo: value
      val getlocal: value
      val getmetatable: value
      val getregistry: value
      val getupvalue: value
      (* val getuservalue: value (* not in LuaJIT *) *)
      val sethook: value
      val setlocal: value
      val setmetatable: value
      val setupvalue: value
      (* val setuservalue: value (* not in LuaJIT *) *)
      val traceback: value
      val upvalueid: value
      val upvaluejoin: value
    end
    structure io:
    sig
      val close: value
      val flush: value
      val input: value
      val lines: value
      val open': value
      val output: value
      val popen: value
      val read: value
      val stderr: value
      val stdin: value
      val stdout: value
      val tmpfile: value
      val type': value
      val write: value
    end
    structure math:
    sig
      val abs: value
      val acos: value
      val asin: value
      val atan: value
      val ceil: value
      val cos: value
      val deg: value
      val exp: value
      val floor: value
      val fmod: value
      val huge: value
      val log: value
      val max: value
      (* val maxinteger: value (* not in LuaJIT *) *)
      val min: value
      (* val mininteger: value (* not in LuaJIT *) *)
      val modf: value
      val pi: value
      val rad: value
      val random: value
      val randomseed: value
      val sin: value
      val sqrt: value
      val tan: value
      (* val tointeger: value (* not in LuaJIT *) *)
      (* val type': value (* not in LuaJIT *) *)
      (* val ult: value (* not in LuaJIT *) *)
    end
    structure os:
    sig
      val clock: value
      val date: value
      val difftime: value
      val execute: value
      val exit: value
      val getenv: value
      val remove: value
      val rename: value
      val setlocale: value
      val time: value
      val tmpname: value
    end
    structure package:
    sig
      (* val config: value (* not in LuaJIT *) *)
      val cpath: value
      val loaded: value
      val loadlib: value
      val path: value
      val preload: value
      (* val searchers: value (* not in LuaJIT *) *)
      val searchpath: value
    end
    structure string:
    sig
      val byte: value
      val char: value
      val dump: value
      val find: value
      val format: value
      val gmatch: value
      val gsub: value
      val len: value
      val lower: value
      val match: value
      (* val pack: value (* not in LuaJIT *) *)
      (* val packsize: value (* not in LuaJIT *) *)
      val rep: value
      val reverse: value
      val sub: value
      (* val unpack: value (* not in LuaJIT *) *)
      val upper: value
    end
    structure table:
    sig
      val concat: value
      val insert: value
      (* val move: value (* not in LuaJIT *) *)
      val pack: value
      val remove: value
      val sort: value
      val unpack: value
    end
    (* (* not in LuaJIT *)
    structure utf8:
    sig
      val char: value
      val charpattern: value
      val codepoint: value
      val codes: value
      val len: value
      val offset: value
    end
    *)
    val lfs: value option (* LuaFileSystem *)
  end
end
