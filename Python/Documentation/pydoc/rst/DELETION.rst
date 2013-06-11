The ``del`` statement
*********************

   del_stmt ::= "del" target_list

Deletion is recursively defined very similar to the way assignment is
defined. Rather than spelling it out in full details, here are some
hints.

Deletion of a target list recursively deletes each target, from left
to right.

Deletion of a name removes the binding of that name  from the local or
global namespace, depending on whether the name occurs in a ``global``
statement in the same code block.  If the name is unbound, a
``NameError`` exception will be raised.

It is illegal to delete a name from the local namespace if it occurs
as a free variable in a nested block.

Deletion of attribute references, subscriptions and slicings is passed
to the primary object involved; deletion of a slicing is in general
equivalent to assignment of an empty slice of the right type (but even
this is determined by the sliced object).

Related help topics: BASICMETHODS

