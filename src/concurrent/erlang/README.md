# Message Passing with Erlang

Compile erlang source to BEAM bytecode:
> erlc example.erl

Run the example:
> erl example.beam

In beam:
> Cnt = example:start().
> example:value(Cnt).

To quit the terminal type `halt().`.

