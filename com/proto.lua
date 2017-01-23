local sprotoparser = require "sprotoparser"

local proto = {}

proto.c2s = sprotoparser.parse [[
.package {
	type 0 : integer
	session 1 : integer
}
.heroinfo {
	confid 0 : integer
	lv 1 : integer
}

handshake 1 {
	response {
		msg 0  : string
		hi 1 : heroinfo
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
get_heroinfo 9 {
	request {
		heroid 0 : integer
	}	
	response {
		hi 0 : heroinfo
	}
}

ping 11 {}

signup 12 {
	request {
		userid 0 : string
	}
	response {
		ok 0 : boolean
	}
}

signin 13 {
	request {
		userid 0 : string
	}
	response {
		ok 0 : boolean
	}
}

login 14 {
	response {
		ok 0 : boolean
	}
}

]]













proto.s2c = sprotoparser.parse [[
.package {
	type 0 : integer
	session 1 : integer
}
push 1 {
	request {
		text 0 : string
	}
}
heartbeat 2 {}
]]

return proto
