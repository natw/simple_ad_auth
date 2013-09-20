simple AD auth
==============

I needed something that just took some credentials, queried an ActiveDirectory server, and returned what groups that user was in.
And more importantly, I needed something that didn't expect me to have a separate account for querying with.

[Adauth](https://github.com/Arcath/Adauth) is nice software, but it didn't obviously do either of those things,
and it was easier to write this than figure out how it might.
