%%%-------------------------------------------------------------------
%%% @author Juan Jose Comellas <juanjo@comellas.org>
%%% @author Mahesh Paolini-Subramanya <mahesh@dieswaytoofast.com>
%%% @copyright (C) 2011-2012 Juan Jose Comellas, Mahesh Paolini-Subramanya
%%% @doc Cache template type definitions and records.
%%% @end
%%%
%%% This source file is subject to the New BSD License. You should have received
%%% a copy of the New BSD license with this software. If not, it can be
%%% retrieved from: http://www.opensource.org/licenses/bsd-license.php
%%%-------------------------------------------------------------------

-include("types.hrl").


-define(PROCESSOR,     app_cache_processor).
-define(SCAVENGER,     app_cache_scavenger).

-define(INFINITY,     infinity).
-define(META_VERSION, 1).

-define(SCAVENGE_FACTOR, 2*1000).       %% 1000 'cos of microseconds

-define(DEFAULT_CACHE_TTL, ?INFINITY).
-define(TIMESTAMP,     timestamp).
-define(DEFAULT_TIMESTAMP, undefined).
-define(DEFAULT_TYPE, set).

-define(METATABLE, app_metatable).

-define(TRANSACTION_TYPE_SAFE, safe).
-define(TRANSACTION_TYPE_DIRTY, dirty).


-record(app_metatable, {
          table                                             :: table(),
          version = ?META_VERSION                           :: table_version(),
          time_to_live = ?INFINITY                          :: time_to_live(),    %% in seconds
          type = ?DEFAULT_TYPE                              :: table_type(),
          fields = []                                       :: [table_key()],
          secondary_index_fields = []                       :: [table_key()],
          last_update                                       :: non_neg_integer(),
          reason                                            :: any(),
          extras                                            :: any()
         }).

%% Testing
-record(test_table_1, {
            key,
            timestamp,
            value,
            name}).
-record(test_table_2, {
            key,
            timestamp,
            value,
            name}).
