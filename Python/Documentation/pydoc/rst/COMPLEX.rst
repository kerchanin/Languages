Imaginary literals
******************

Imaginary literals are described by the following lexical definitions:

   imagnumber ::= (floatnumber | intpart) ("j" | "J")

An imaginary literal yields a complex number with a real part of 0.0.
Complex numbers are represented as a pair of floating point numbers
and have the same restrictions on their range.  To create a complex
number with a nonzero real part, add a floating point number to it,
e.g., ``(3+4j)``.  Some examples of imaginary literals:

   3.14j   10.j    10j     .001j   1e100j  3.14e-10j

Related help topics: complex, cmath

