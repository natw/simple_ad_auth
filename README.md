simple AD auth
==============

I needed something that just took some credentials, queried an ActiveDirectory server, and returned what groups that user was in.
And more importantly, I needed something that didn't expect me to have a separate account for querying with.

[Adauth](https://github.com/Arcath/Adauth) is nice software, but it didn't obviously do either of those things,
and it was easier to write this than figure out how it might.

Usage
-----

There are only really two steps for using SimpleADAuth.
You configure it in the traditional fashion, and then you authenticate.
Observe:

```ruby
require 'simple_ad_auth'

SimpleADAuth.configure do |c|
  c.host = 'my_ad_server.com'  # the host of the AD server you are authenticating against
  c.port = '389'  # optional, default is 389
  c.domain = 'example.com'  # the AD domain. This is probably just the part after @ in your email address.
  c.search_root = 'dc=example,dc=com'  # the root, or base, for LDAP searching.
end

user = SimpleADAuth.authenticate('username', 'password')  # returns nil if the credentials are wrong, otherwise a SimpleADAuth::User instance
```

The User object
---------------

This library does not attempt to integrate with any exiting authentication or user management schemes.
The User object returned by `#authenticate` is really just a thin wrapper around a [Net::LDAP::Entry](http://net-ldap.rubyforge.org/Net/LDAP/Entry.html) instance.

The Entry object can be accessed at `user.entry`.
Otherwise, there is currently just one helper method, `groups`, that returns a nicer looking array of the groups that the user is a member of.
