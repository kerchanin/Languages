Arithmetic conversions
**********************

When a description of an arithmetic operator below uses the phrase
"the numeric arguments are converted to a common type," the arguments
are coerced using the coercion rules listed at  *Coercion rules*.  If
both arguments are standard numeric types, the following coercions are
applied:

* If either argument is a complex number, the other is converted to
  complex;

* otherwise, if either argument is a floating point number, the other
  is converted to floating point;

* otherwise, if either argument is a long integer, the other is
  converted to long integer;

* otherwise, both must be plain integers and no conversion is
  necessary.

Some additional rules apply for certain operators (e.g., a string left
argument to the '%' operator). Extensions can define their own
coercions.

Related help topics: COERCIONS

