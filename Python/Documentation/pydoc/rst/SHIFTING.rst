Shifting operations
*******************

The shifting operations have lower priority than the arithmetic
operations:

   shift_expr ::= a_expr | shift_expr ( "<<" | ">>" ) a_expr

These operators accept plain or long integers as arguments.  The
arguments are converted to a common type.  They shift the first
argument to the left or right by the number of bits given by the
second argument.

A right shift by *n* bits is defined as division by ``pow(2, n)``.  A
left shift by *n* bits is defined as multiplication with ``pow(2,
n)``.  Negative shift counts raise a ``ValueError`` exception.

Note: In the current implementation, the right-hand operand is required to
  be at most ``sys.maxsize``.  If the right-hand operand is larger
  than ``sys.maxsize`` an ``OverflowError`` exception is raised.

Related help topics: EXPRESSIONS

