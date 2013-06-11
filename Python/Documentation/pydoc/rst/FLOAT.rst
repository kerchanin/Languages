Floating point literals
***********************

Floating point literals are described by the following lexical
definitions:

   floatnumber   ::= pointfloat | exponentfloat
   pointfloat    ::= [intpart] fraction | intpart "."
   exponentfloat ::= (intpart | pointfloat) exponent
   intpart       ::= digit+
   fraction      ::= "." digit+
   exponent      ::= ("e" | "E") ["+" | "-"] digit+

Note that the integer and exponent parts of floating point numbers can
look like octal integers, but are interpreted using radix 10.  For
example, ``077e010`` is legal, and denotes the same number as
``77e10``. The allowed range of floating point literals is
implementation-dependent. Some examples of floating point literals:

   3.14    10.    .001    1e100    3.14e-10    0e0

Note that numeric literals do not include a sign; a phrase like ``-1``
is actually an expression composed of the unary operator ``-`` and the
literal ``1``.

Related help topics: float, math

