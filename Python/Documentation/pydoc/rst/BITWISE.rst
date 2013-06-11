Binary bitwise operations
*************************

Each of the three bitwise operations has a different priority level:

   and_expr ::= shift_expr | and_expr "&" shift_expr
   xor_expr ::= and_expr | xor_expr "^" and_expr
   or_expr  ::= xor_expr | or_expr "|" xor_expr

The ``&`` operator yields the bitwise AND of its arguments, which must
be plain or long integers.  The arguments are converted to a common
type.

The ``^`` operator yields the bitwise XOR (exclusive OR) of its
arguments, which must be plain or long integers.  The arguments are
converted to a common type.

The ``|`` operator yields the bitwise (inclusive) OR of its arguments,
which must be plain or long integers.  The arguments are converted to
a common type.

Related help topics: EXPRESSIONS

