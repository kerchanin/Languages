Comparisons
***********

Unlike C, all comparison operations in Python have the same priority,
which is lower than that of any arithmetic, shifting or bitwise
operation.  Also unlike C, expressions like ``a < b < c`` have the
interpretation that is conventional in mathematics:

   comparison    ::= or_expr ( comp_operator or_expr )*
   comp_operator ::= "<" | ">" | "==" | ">=" | "<=" | "<>" | "!="
                     | "is" ["not"] | ["not"] "in"

Comparisons yield boolean values: ``True`` or ``False``.

Comparisons can be chained arbitrarily, e.g., ``x < y <= z`` is
equivalent to ``x < y and y <= z``, except that ``y`` is evaluated
only once (but in both cases ``z`` is not evaluated at all when ``x <
y`` is found to be false).

Formally, if *a*, *b*, *c*, ..., *y*, *z* are expressions and *op1*,
*op2*, ..., *opN* are comparison operators, then ``a op1 b op2 c ... y
opN z`` is equivalent to ``a op1 b and b op2 c and ... y opN z``,
except that each expression is evaluated at most once.

Note that ``a op1 b op2 c`` doesn't imply any kind of comparison
between *a* and *c*, so that, e.g., ``x < y > z`` is perfectly legal
(though perhaps not pretty).

The forms ``<>`` and ``!=`` are equivalent; for consistency with C,
``!=`` is preferred; where ``!=`` is mentioned below ``<>`` is also
accepted.  The ``<>`` spelling is considered obsolescent.

The operators ``<``, ``>``, ``==``, ``>=``, ``<=``, and ``!=`` compare
the values of two objects.  The objects need not have the same type.
If both are numbers, they are converted to a common type.  Otherwise,
objects of different types *always* compare unequal, and are ordered
consistently but arbitrarily. You can control comparison behavior of
objects of non-built-in types by defining a ``__cmp__`` method or rich
comparison methods like ``__gt__``, described in section *Special
method names*.

(This unusual definition of comparison was used to simplify the
definition of operations like sorting and the ``in`` and ``not in``
operators. In the future, the comparison rules for objects of
different types are likely to change.)

Comparison of objects of the same type depends on the type:

* Numbers are compared arithmetically.

* Strings are compared lexicographically using the numeric equivalents
  (the result of the built-in function ``ord()``) of their characters.
  Unicode and 8-bit strings are fully interoperable in this behavior.
  [4]

* Tuples and lists are compared lexicographically using comparison of
  corresponding elements.  This means that to compare equal, each
  element must compare equal and the two sequences must be of the same
  type and have the same length.

  If not equal, the sequences are ordered the same as their first
  differing elements.  For example, ``cmp([1,2,x], [1,2,y])`` returns
  the same as ``cmp(x,y)``.  If the corresponding element does not
  exist, the shorter sequence is ordered first (for example, ``[1,2] <
  [1,2,3]``).

* Mappings (dictionaries) compare equal if and only if their sorted
  (key, value) lists compare equal. [5] Outcomes other than equality
  are resolved consistently, but are not otherwise defined. [6]

* Most other objects of built-in types compare unequal unless they are
  the same object; the choice whether one object is considered smaller
  or larger than another one is made arbitrarily but consistently
  within one execution of a program.

The operators ``in`` and ``not in`` test for collection membership.
``x in s`` evaluates to true if *x* is a member of the collection *s*,
and false otherwise.  ``x not in s`` returns the negation of ``x in
s``. The collection membership test has traditionally been bound to
sequences; an object is a member of a collection if the collection is
a sequence and contains an element equal to that object.  However, it
make sense for many other object types to support membership tests
without being a sequence.  In particular, dictionaries (for keys) and
sets support membership testing.

For the list and tuple types, ``x in y`` is true if and only if there
exists an index *i* such that ``x == y[i]`` is true.

For the Unicode and string types, ``x in y`` is true if and only if
*x* is a substring of *y*.  An equivalent test is ``y.find(x) != -1``.
Note, *x* and *y* need not be the same type; consequently, ``u'ab' in
'abc'`` will return ``True``. Empty strings are always considered to
be a substring of any other string, so ``"" in "abc"`` will return
``True``.

Changed in version 2.3: Previously, *x* was required to be a string of
length ``1``.

For user-defined classes which define the ``__contains__()`` method,
``x in y`` is true if and only if ``y.__contains__(x)`` is true.

For user-defined classes which do not define ``__contains__()`` but do
define ``__iter__()``, ``x in y`` is true if some value ``z`` with ``x
== z`` is produced while iterating over ``y``.  If an exception is
raised during the iteration, it is as if ``in`` raised that exception.

Lastly, the old-style iteration protocol is tried: if a class defines
``__getitem__()``, ``x in y`` is true if and only if there is a non-
negative integer index *i* such that ``x == y[i]``, and all lower
integer indices do not raise ``IndexError`` exception. (If any other
exception is raised, it is as if ``in`` raised that exception).

The operator ``not in`` is defined to have the inverse true value of
``in``.

The operators ``is`` and ``is not`` test for object identity: ``x is
y`` is true if and only if *x* and *y* are the same object.  ``x is
not y`` yields the inverse truth value. [7]

Related help topics: EXPRESSIONS, BASICMETHODS

