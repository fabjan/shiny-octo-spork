## Test repo please ignore

Trying to make Millet and LunarML play nice together.

## Problem

The Successor ML featureset of LunarML and Millet is different, but syntactic
differences can be worked around.

LunarML also has some extra libraries, such as `$(SML_LIB)/basis/lua.mlb`, and
I cannot figure out how to make Millet take these into account when checking
the code.

This repo has two MLB files: `main_struct.mlb` and `main_func.mlb`.

### Using a plain structure

The struct version defines the structure `Love` in terms of the LunarML
libraries. Compiling and running this works fine but Millet doesn't see the
`Lua` structure from LunarML.

### Using a functor

The functor version defines a functor `Love` which depends on a `LUA` signature
extracted from
https://github.com/minoki/LunarML/blob/master/doc/LuaInterface.md (see
`lua.sig`), and applies the functor to `Lua`. This makes Millet much more
happy, even if it doesn't know about the `Lua` structure, using the signature
it can check all the code that uses it. However, this version cannot be compiled with LunarML:

```
.../love_func.sml:54:18-54:27: error: signature matching: isyieldable not found
structure Love = Love (Lua)
```

## Solution

TBD?

### Can we use Millet workspace path vars?

After seeing this discussion https://github.com/azdavis/millet/issues/51

I tried adding to `millet.toml`:

```toml
[workspace.path-vars]
SML_LIB = { path = "/Users/fabian/lunarml/lib/lunarml/ml" }
```

But Millet still says "undefined structure: `Lua`"

I also tried creating a separate `millet.mlb` (in case there was some
shenanigans defining SML_LIB specifically):

```sml
local
    $(LUNARMLLIB)/basis/lua.mlb
in
    main_struct.mlb
end
```

With this path definition in millet.toml:

```toml
[workspace.path-vars]
LUNARMLLIB = { path = "/Users/fabian/lunarml/lib/lunarml/ml" }
```

But Millet still says "undefined structure: `Lua`"

## Building

Requires [LunarML](https://github.com/minoki/LunarML)

Run `./build.sh`

The script will build the two versions explained above.

## Running

Requires [LÖVE](https://love2d.org), depends on the build step above.

Run `./run.sh`

The script will ask which version of the example to run, and copy the
corresponding compiled result to `main.lua` for executing in LÖVE.
