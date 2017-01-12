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

login 101 {
	request {
		username 0 : string
		pass 1 : string
	}
	response {
		result 0 : integer
	}
}

userinfo 110 {
	response {
		result 0 : integer
	}
}

playerinfo 120 {
	response {
		result 0 : integer
	}
}

heroinfo 130 {
	request {
		heroid 0 : integer
	}
	response {
		hero : hero_info
	}
}

equip 140 {
	request {
		heroid 0 : integer
	}
	response {
		equip : equip
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
