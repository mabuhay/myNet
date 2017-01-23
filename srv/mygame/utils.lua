local skynet = require "skynet"

function do_redis(args, uid)
	local cmd = assert(args[1])
	args[1] = uid or 1
	return skynet.call("mydb", "lua", cmd, table.unpack(args))
end

function make_pairs_table(t, fields)
	assert(type(t) == "table", "make_pairs_table t is not table")

	local data = {}

	if not fields then
		for i=1, #t, 2 do
			data[t[i]] = t[i+1]
		end
	else
		for i=1, #t do
			data[fields[i]] = t[i]
		end
	end

	print("make_pairs_table: ")
	for k, v in pairs(data) do
		print("k: "..k)
		print("v: "..v)
	end

	return data
end