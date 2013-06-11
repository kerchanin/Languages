Expression lists
****************

   expression_list ::= expression ( "," expression )* [","]

An expression list containing at least one comma yields a tuple.  The
length of the tuple is the number of expressions in the list.  The
expressions are evaluated from left to right.

The trailing comma is required only to create a single tuple (a.k.a. a
*singleton*); it is optional in all other cases.  A single expression
without a trailing comma doesn't create a tuple, but rather yields the
value of that expression. (To create an empty tuple, use an empty pair
of parentheses: ``()``.)

Related help topics: TUPLES, LITERALS

