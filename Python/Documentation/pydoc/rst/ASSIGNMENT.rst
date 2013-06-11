Assignment statements
*********************

Assignment statements are used to (re)bind names to values and to
modify attributes or items of mutable objects:

   assignment_stmt ::= (target_list "=")+ (expression_list | yield_expression)
   target_list     ::= target ("," target)* [","]
   target          ::= identifier
              | "(" target_list ")"
              | "[" target_list "]"
              | attributeref
              | subscription
              | slicing

(See section *Primaries* for the syntax definitions for the last three
symbols.)

An assignment statement evaluates the expression list (remember that
this can be a single expression or a comma-separated list, the latter
yielding a tuple) and assigns the single resulting object to each of
the target lists, from left to right.

Assignment is defined recursively depending on the form of the target
(list). When a target is part of a mutable object (an attribute
reference, subscription or slicing), the mutable object must
ultimately perform the assignment and decide about its validity, and
may raise an exception if the assignment is unacceptable.  The rules
observed by various types and the exceptions raised are given with the
definition of the object types (see section *The standard type
hierarchy*).

Assignment of an object to a target list is recursively defined as
follows.

* If the target list is a single target: The object is assigned to
  that target.

* If the target list is a comma-separated list of targets: The object
  must be an iterable with the same number of items as there are
  targets in the target list, and the items are assigned, from left to
  right, to the corresponding targets.

Assignment of an object to a single target is recursively defined as
follows.

* If the target is an identifier (name):

  * If the name does not occur in a ``global`` statement in the
    current code block: the name is bound to the object in the current
    local namespace.

  * Otherwise: the name is bound to the object in the current global
    namespace.

  The name is rebound if it was already bound.  This may cause the
  reference count for the object previously bound to the name to reach
  zero, causing the object to be deallocated and its destructor (if it
  has one) to be called.

* If the target is a target list enclosed in parentheses or in square
  brackets: The object must be an iterable with the same number of
  items as there are targets in the target list, and its items are
  assigned, from left to right, to the corresponding targets.

* If the target is an attribute reference: The primary expression in
  the reference is evaluated.  It should yield an object with
  assignable attributes; if this is not the case, ``TypeError`` is
  raised.  That object is then asked to assign the assigned object to
  the given attribute; if it cannot perform the assignment, it raises
  an exception (usually but not necessarily ``AttributeError``).

  Note: If the object is a class instance and the attribute reference
  occurs on both sides of the assignment operator, the RHS expression,
  ``a.x`` can access either an instance attribute or (if no instance
  attribute exists) a class attribute.  The LHS target ``a.x`` is
  always set as an instance attribute, creating it if necessary.
  Thus, the two occurrences of ``a.x`` do not necessarily refer to the
  same attribute: if the RHS expression refers to a class attribute,
  the LHS creates a new instance attribute as the target of the
  assignment:

     class Cls:
         x = 3             # class variable
     inst = Cls()
     inst.x = inst.x + 1   # writes inst.x as 4 leaving Cls.x as 3

  This description does not necessarily apply to descriptor
  attributes, such as properties created with ``property()``.

* If the target is a subscription: The primary expression in the
  reference is evaluated.  It should yield either a mutable sequence
  object (such as a list) or a mapping object (such as a dictionary).
  Next, the subscript expression is evaluated.

  If the primary is a mutable sequence object (such as a list), the
  subscript must yield a plain integer.  If it is negative, the
  sequence's length is added to it. The resulting value must be a
  nonnegative integer less than the sequence's length, and the
  sequence is asked to assign the assigned object to its item with
  that index.  If the index is out of range, ``IndexError`` is raised
  (assignment to a subscripted sequence cannot add new items to a
  list).

  If the primary is a mapping object (such as a dictionary), the
  subscript must have a type compatible with the mapping's key type,
  and the mapping is then asked to create a key/datum pair which maps
  the subscript to the assigned object.  This can either replace an
  existing key/value pair with the same key value, or insert a new
  key/value pair (if no key with the same value existed).

* If the target is a slicing: The primary expression in the reference
  is evaluated.  It should yield a mutable sequence object (such as a
  list).  The assigned object should be a sequence object of the same
  type.  Next, the lower and upper bound expressions are evaluated,
  insofar they are present; defaults are zero and the sequence's
  length.  The bounds should evaluate to (small) integers.  If either
  bound is negative, the sequence's length is added to it. The
  resulting bounds are clipped to lie between zero and the sequence's
  length, inclusive.  Finally, the sequence object is asked to replace
  the slice with the items of the assigned sequence.  The length of
  the slice may be different from the length of the assigned sequence,
  thus changing the length of the target sequence, if the object
  allows it.

**CPython implementation detail:** In the current implementation, the
syntax for targets is taken to be the same as for expressions, and
invalid syntax is rejected during the code generation phase, causing
less detailed error messages.

WARNING: Although the definition of assignment implies that overlaps
between the left-hand side and the right-hand side are 'safe' (for
example ``a, b = b, a`` swaps two variables), overlaps *within* the
collection of assigned-to variables are not safe!  For instance, the
following program prints ``[0, 2]``:

   x = [0, 1]
   i = 0
   i, x[i] = 1, 2
   print x


Augmented assignment statements
===============================

Augmented assignment is the combination, in a single statement, of a
binary operation and an assignment statement:

   augmented_assignment_stmt ::= augtarget augop (expression_list | yield_expression)
   augtarget                 ::= identifier | attributeref | subscription | slicing
   augop                     ::= "+=" | "-=" | "*=" | "/=" | "//=" | "%=" | "**="
             | ">>=" | "<<=" | "&=" | "^=" | "|="

(See section *Primaries* for the syntax definitions for the last three
symbols.)

An augmented assignment evaluates the target (which, unlike normal
assignment statements, cannot be an unpacking) and the expression
list, performs the binary operation specific to the type of assignment
on the two operands, and assigns the result to the original target.
The target is only evaluated once.

An augmented assignment expression like ``x += 1`` can be rewritten as
``x = x + 1`` to achieve a similar, but not exactly equal effect. In
the augmented version, ``x`` is only evaluated once. Also, when
possible, the actual operation is performed *in-place*, meaning that
rather than creating a new object and assigning that to the target,
the old object is modified instead.

With the exception of assigning to tuples and multiple targets in a
single statement, the assignment done by augmented assignment
statements is handled the same way as normal assignments. Similarly,
with the exception of the possible *in-place* behavior, the binary
operation performed by augmented assignment is the same as the normal
binary operations.

For targets which are attribute references, the same *caveat about
class and instance attributes* applies as for regular assignments.

Related help topics: AUGMENTEDASSIGNMENT

