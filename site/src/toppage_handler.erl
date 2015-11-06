-module(toppage_handler).

-export([init/3, handle/2, terminate/3]).

init(_, Req, Opts) ->
	{ok, Req, Opts}.

handle(Req, State) ->
	{ok, Req2} = cowboy_req:reply(200, [
	    {<<"content-type">>, <<"text/plain">>}],
		<<"Hello World!">>, Req),
	{ok, Req2, State}.

terminate(_Reason, Req, State) ->
	ok.
