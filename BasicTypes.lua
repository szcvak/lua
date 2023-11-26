--[[

	These are Canary's basic types.
	
	This should be inserted into every package.

--]]

local ScriptSignal = loadstring(game:HttpGet("https://raw.githubusercontent.com/szcvak/lua/main/ScriptSignal.lua"))()

export type array = {[number]: any}
export type dictionary = {[string]: any}

export type universal<V> = V

export type ScriptSignal = typeof(ScriptSignal.new())
export type NetworkScriptSignal = typeof(1)

export type Package = any

--[[

	Use ipairs for arrays/tables, and pairs for dictionary.

--]]

return nil
