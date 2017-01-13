local sprotoparser = require "sprotoparser"

local proto = {}

proto.c2s = sprotoparser.parse [[
.package {
	type 0 : integer
	session 1 : integer
}

handshake 1 {
	response {
		msg 0  : string
	}
}

get 2 {
	request {
		what 0 : string
	}
	response {
		result 0 : string
	}
}

set 3 {
	request {
		what 0 : string
		value 1 : string
	}
}

quit 4 {}

login 5 {
	request {
		username 0 : string
		pass 1 : string
	}
	response {
		result 0 : integer
	}
}

get_userinfo 6 {
	response {
		lastsvr 0 : integer
		historysvr 1 : *integer
	}
}

get_playrinfo 7 {
	response {
		lev 0 : integer
		exp 1 : integer
		gold 2 : integer
		herolist 3 : *integer
	}
}

get_heroinfo 8 {
	request {
		heroid 0 : integer
	}	
	response {
		tpltid 0 : integer

	}
}

]]













proto.s2c = sprotoparser.parse [[
.package {
	type 0 : integer
	session 1 : integer
}

heartbeat 1 {}
]]

return proto
