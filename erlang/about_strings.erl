-module(about_strings).
-export([first_we_must_see_what_lies_underneath/0,
         two_strings_are_longer_than_one/0,
         a_substring_is_shorter_than_the_original/0,
         if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this/0,
         joining_a_list_of_strings/0
        ]).

first_we_must_see_what_lies_underneath() ->
    true =:= is_list("Hello list!").

two_strings_are_longer_than_one() ->
    "Hello World" =:= string:concat("Hello", " World").

a_substring_is_shorter_than_the_original() ->
    "burger" =:= string:substr("hamburger", 4, 10). % strings start from one

if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this() ->
    ["(=", "true",  "my-answer)"] =:= string:tokens("(= true my-answer)", " ").

joining_a_list_of_strings() ->
    "Oxford,Comma" =:= string:join(["Oxford", "Comma"], ",").
