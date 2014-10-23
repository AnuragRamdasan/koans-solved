-module(about_processes).
-export([writing_messages_to_yourself/0,
         writing_messages_to_your_friends/0,
         keeping_an_eye_on_your_friends/0
        ]).

writing_messages_to_yourself() ->
    % send a message to the current process(itself)
    self() ! "Hello Self!",
    receive
        Message ->
          Message =:= "Hello Self!"
    end.

writing_messages_to_your_friends() ->
  % make a new process that receives only a Pid and pong
  FriendPid = spawn(
                fun() ->
                    receive
                        {Pid, ping} ->
                            Pid ! pong;
                        {Pid, _} ->
                            Pid ! "I only ping-pong!"
                end
              end),
  % send ping to that process
  FriendPid ! {self(), ping},
  receive
      pong ->
          get_here;
      _ ->
          not_here
  end.

keeping_an_eye_on_your_friends() ->
    % recieve message back to this process if any child process exits
    process_flag(trap_exit, true),
    % create a child process and exit it with a message
    spawn_link(fun() -> exit("Goodbye!") end),
    EndMessage = receive
        {'EXIT', _, Message} ->
            Message
    end,
    "Goodbye!" =:= EndMessage.
