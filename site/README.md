site
=====

An OTP application

Build
-----

    $ rebar3 compile

Running from the Erlang Shell
-----------------------------
    $ rebar3 shell
    > application:start(cowlib).
    > application:start(ranch).
    > application:start(cowboy).
    > application:start(site).

