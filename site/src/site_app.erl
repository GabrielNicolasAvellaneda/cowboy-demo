%%%-------------------------------------------------------------------
%% @doc site public API
%% @end
%%%-------------------------------------------------------------------

-module('site_app').

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1,
	bootstrap/0]).

%%====================================================================
%% API
%%====================================================================

bootstrap() ->
	application:ensure_all_started(site).
%%	application:start(cowlib),
%%	application:start(ranch),
%%	application:start(cowboy),
%%	application:start(site).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
      {'_', [
	     {"/", cowboy_static, {priv_file, site, "index.html"}},
	     {"/html", toppage_handler, []},
	     {"/api", rest_handler, []}
	    ]}
				    ]),
      {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
	{env, [{dispatch, Dispatch}]}
							   ]),
    'site_sup':start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
