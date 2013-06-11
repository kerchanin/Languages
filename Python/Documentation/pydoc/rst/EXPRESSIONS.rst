Summary
*******

The following table summarizes the operator precedences in Python,
from lowest precedence (least binding) to highest precedence (most
binding). Operators in the same box have the same precedence.  Unless
the syntax is explicitly given, operators are binary.  Operators in
the same box group left to right (except for comparisons, including
tests, which all have the same precedence and chain from left to right
--- see section *Comparisons* --- and exponentiation, which groups
from right to left).

+-------------------------------------------------+---------------------------------------+
| Operator                                        | Description                           |
+=================================================+=======================================+
| ``lambda``                                      | Lambda expression                     |
+-------------------------------------------------+---------------------------------------+
| ``if`` -- ``else``                              | Conditional expression                |
+-------------------------------------------------+---------------------------------------+
| ``or``                                          | Boolean OR                            |
+-------------------------------------------------+---------------------------------------+
| ``and``                                         | Boolean AND                           |
+-------------------------------------------------+---------------------------------------+
| ``not`` *x*                                     | Boolean NOT                           |
+-------------------------------------------------+---------------------------------------+
| ``in``, ``not`` ``in``, ``is``, ``is not``,     | Comparisons, including membership     |
| ``<``, ``<=``, ``>``, ``>=``, ``<>``, ``!=``,   | tests and identity tests,             |
| ``==``                                          |                                       |
+-------------------------------------------------+---------------------------------------+
| ``|``                                           | Bitwise OR                            |
+-------------------------------------------------+---------------------------------------+
| ``^``                                           | Bitwise XOR                           |
+-------------------------------------------------+---------------------------------------+
| ``&``                                           | Bitwise AND                           |
+-------------------------------------------------+---------------------------------------+
| ``<<``, ``>>``                                  | Shifts                                |
+-------------------------------------------------+---------------------------------------+
| ``+``, ``-``                                    | Addition and subtraction              |
+-------------------------------------------------+---------------------------------------+
| ``*``, ``/``, ``//``, ``%``                     | Multiplication, division, remainder   |
|                                                 | [8]                                   |
+-------------------------------------------------+---------------------------------------+
| ``+x``, ``-x``, ``~x``                          | Positive, negative, bitwise NOT       |
+-------------------------------------------------+---------------------------------------+
| ``**``                                          | Exponentiation [9]                    |
+-------------------------------------------------+---------------------------------------+
| ``x[index]``, ``x[index:index]``,               | Subscription, slicing, call,          |
| ``x(arguments...)``, ``x.attribute``            | attribute reference                   |
+-------------------------------------------------+---------------------------------------+
| ``(expressions...)``, ``[expressions...]``,     | Binding or tuple display, list        |
| ``{key:datum...}``, ```expressions...```        | display, dictionary display, string   |
|                                                 | conversion                            |
+-------------------------------------------------+---------------------------------------+

-[ Footnotes ]-

[1] In Python 2.3 and later releases, a list comprehension "leaks" the
    control variables of each ``for`` it contains into the containing
    scope.  However, this behavior is deprecated, and relying on it
    will not work in Python 3.0

[2] While ``abs(x%y) < abs(y)`` is true mathematically, for floats it
    may not be true numerically due to roundoff.  For example, and
    assuming a platform on which a Python float is an IEEE 754 double-
    precision number, in order that ``-1e-100 % 1e100`` have the same
    sign as ``1e100``, the computed result is ``-1e-100 + 1e100``,
    which is numerically exactly equal to ``1e100``.  The function
    ``math.fmod()`` returns a result whose sign matches the sign of
    the first argument instead, and so returns ``-1e-100`` in this
    case. Which approach is more appropriate depends on the
    application.

[3] If x is very close to an exact integer multiple of y, it's
    possible for ``floor(x/y)`` to be one larger than ``(x-x%y)/y``
    due to rounding.  In such cases, Python returns the latter result,
    in order to preserve that ``divmod(x,y)[0] * y + x % y`` be very
    close to ``x``.

[4] While comparisons between unicode strings make sense at the byte
    level, they may be counter-intuitive to users. For example, the
    strings ``u"\u00C7"`` and ``u"\u0043\u0327"`` compare differently,
    even though they both represent the same unicode character (LATIN
    CAPITAL LETTER C WITH CEDILLA). To compare strings in a human
    recognizable way, compare using ``unicodedata.normalize()``.

[5] The implementation computes this efficiently, without constructing
    lists or sorting.

[6] Earlier versions of Python used lexicographic comparison of the
    sorted (key, value) lists, but this was very expensive for the
    common case of comparing for equality.  An even earlier version of
    Python compared dictionaries by identity only, but this caused
    surprises because people expected to be able to test a dictionary
    for emptiness by comparing it to ``{}``.

[7] Due to automatic garbage-collection, free lists, and the dynamic
    nature of descriptors, you may notice seemingly unusual behaviour
    in certain uses of the ``is`` operator, like those involving
    comparisons between instance methods, or constants.  Check their
    documentation for more info.

[8] The ``%`` operator is also used for string formatting; the same
    precedence applies.

[9] The power operator ``**`` binds less tightly than an arithmetic or
    bitwise unary operator on its right, that is, ``2**-1`` is
    ``0.5``.

Related help topics: lambda, or, and, not, in, is, BOOLEAN, COMPARISON,
BITWISE, SHIFTING, BINARY, FORMATTING, POWER, UNARY, ATTRIBUTES,
SUBSCRIPTS, SLICINGS, CALLS, TUPLES, LISTS, DICTIONARIES, BACKQUOTES

