-module(about_list_comprehensions).
-export([representing_a_list/0,
         mapping_a_function/0,
         applying_a_filter/0
        ]).

representing_a_list() ->
    [1, 2, 3] =:= [Item || Item <- [1, 2, 3]].

mapping_a_function() ->
    [2, 4, 6] =:= [Item * 2 || Item <- [1, 2, 3]].

applying_a_filter() ->
    [2] =:= [Item || Item <- [1, 2, 3], Item rem 2 =:= 0]. % last part acts like a predicate to filter
