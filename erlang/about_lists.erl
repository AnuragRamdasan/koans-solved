-module(about_lists).
-export([lists_are_not_homogenious/0,
         we_can_add/0,
         we_can_also_take_away/0,
         lists_define_delete/0,
         just_how_many_are_deleted/0,
         lists_have_heads/0,
         lists_also_have_tails/0,
         constructing_with_cons/0,
         length_is_as_simple_as_it_seems/0,
         lists_of_tuples_can_be_found_by_key/0
        ]).

lists_are_not_homogenious() ->
    NotJustFruits = [apple, banana, 1, mango],
    Element = lists:nth(3, NotJustFruits),
    (Element < 2) and (Element > 0).

we_can_add() ->
    [apple, banana] ++ [mango, orange].

we_can_also_take_away() ->
    [apple, banana] -- [apple].

lists_define_delete() ->
    lists:delete(apple, [apple, banana]).

just_how_many_are_deleted() ->
    [banana, apple] =:= lists:delete(apple, [apple, banana, apple]).

lists_have_heads() ->
    [Head | Tail] = [apple, banana, mango],
    apple =:= Head.

lists_also_have_tails() ->
    [Head | Tail] = [apple, banana, mango],
    [banana, mango] =:= Tail.

constructing_with_cons() ->
    [apple, banana, mango, pear] =:= [apple | [banana | [mango | [pear | []]]]].

length_is_as_simple_as_it_seems() ->
    3 =:= length([1, 2, 3]).

lists_of_tuples_can_be_found_by_key() ->
    Meals = [{breakfast, eggs}, {lunch, pasta}, {dinner, burrito}],
    {lunch, pasta} = lists:keyfind(pasta, 2, Meals).
