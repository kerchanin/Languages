Literals
********

Python supports string literals and various numeric literals:

   literal ::= stringliteral | integer | longinteger
               | floatnumber | imagnumber

Evaluation of a literal yields an object of the given type (string,
integer, long integer, floating point number, complex number) with the
given value.  The value may be approximated in the case of floating
point and imaginary (complex) literals.  See section *Literals* for
details.

All literals correspond to immutable data types, and hence the
object's identity is less important than its value.  Multiple
evaluations of literals with the same value (either the same
occurrence in the program text or a different occurrence) may obtain
the same object or a different object with the same value.

Related help topics: STRINGS, BACKQUOTES, NUMBERS, TUPLELITERALS,
LISTLITERALS, DICTIONARYLITERALS

