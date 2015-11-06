-module(rest_handler).
-export([init/3, rest_init/2, to_html/2]).

init(_, Req, Opts) ->
	{upgrade, protocol, cowboy_rest}.

rest_init(Req, Opts) ->
	{ok, Req, Opts}.

to_html(Req, State) ->
	{<<"Hello, world from REST">>, Req, State}.

