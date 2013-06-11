The power operator
******************

The power operator binds more tightly than unary operators on its
left; it binds less tightly than unary operators on its right.  The
syntax is:

   power ::= primary ["**" u_expr]

Thus, in an unparenthesized sequence of power and unary operators, the
operators are evaluated from right to left (this does not constrain
the evaluation order for the operands): ``-1**2`` results in ``-1``.

The power operator has the same semantics as the built-in ``pow()``
function, when called with two arguments: it yields its left argument
raised to the power of its right argument.  The numeric arguments are
first converted to a common type.  The result type is that of the
arguments after coercion.

With mixed operand types, the coercion rules for binary arithmetic
operators apply. For int and long int operands, the result has the
same type as the operands (after coercion) unless the second argument
is negative; in that case, all arguments are converted to float and a
float result is delivered. For example, ``10**2`` returns ``100``, but
``10**-2`` returns ``0.01``. (This last feature was added in Python
2.2. In Python 2.1 and before, if both arguments were of integer types
and the second argument was negative, an exception was raised).

Raising ``0.0`` to a negative power results in a
``ZeroDivisionError``. Raising a negative number to a fractional power
results in a ``ValueError``.

Related help topics: EXPRESSIONS

