Unary arithmetic and bitwise operations
***************************************

All unary arithmetic and bitwise operations have the same priority:

   u_expr ::= power | "-" u_expr | "+" u_expr | "~" u_expr

The unary ``-`` (minus) operator yields the negation of its numeric
argument.

The unary ``+`` (plus) operator yields its numeric argument unchanged.

The unary ``~`` (invert) operator yields the bitwise inversion of its
plain or long integer argument.  The bitwise inversion of ``x`` is
defined as ``-(x+1)``.  It only applies to integral numbers.

In all three cases, if the argument does not have the proper type, a
``TypeError`` exception is raised.

Related help topics: EXPRESSIONS

