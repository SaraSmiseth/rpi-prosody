-- see example config at https://hg.prosody.im/0.9/file/0.9.10/prosody.cfg.lua.dist
-- easily extendable by putting into different config files within conf.d folder


print("Hello")
print("World")
print(os.getenv("PROSODY_ADMINS"));

local stringy = require "stringy" 

print(stringy.split(os.getenv("PROSODY_ADMINS"), ","))
print(stringy.split(os.getenv("PROSODY_ADMINS"), ", "))

admins = stringy.split(os.getenv("PROSODY_ADMINS"), ", ");

print(admins);

pidfile = "/var/run/prosody/prosody.pid"

use_libevent = true; -- improves performance

allow_registration = os.getenv("ALLOW_REGISTRATION");
print("allow_registration:")
print(allow_registration)

c2s_require_encryption = os.getenv("C2S_REQUIRE_ENCRYPTION");
s2s_require_encryption = os.getenv("S2S_REQUIRE_ENCRYPTION");
s2s_secure_auth = os.getenv("S2S_SECURE_AUTH");

authentication = "internal_hashed";

log = {
    {levels = {min = os.getenv("LOG_LEVEL")}, to = "console"};
};

Include "conf.d/*.cfg.lua";
