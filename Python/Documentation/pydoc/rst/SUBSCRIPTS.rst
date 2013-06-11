Subscriptions
*************

A subscription selects an item of a sequence (string, tuple or list)
or mapping (dictionary) object:

   subscription ::= primary "[" expression_list "]"

The primary must evaluate to an object of a sequence or mapping type.

If the primary is a mapping, the expression list must evaluate to an
object whose value is one of the keys of the mapping, and the
subscription selects the value in the mapping that corresponds to that
key.  (The expression list is a tuple except if it has exactly one
item.)

If the primary is a sequence, the expression (list) must evaluate to a
plain integer.  If this value is negative, the length of the sequence
is added to it (so that, e.g., ``x[-1]`` selects the last item of
``x``.)  The resulting value must be a nonnegative integer less than
the number of items in the sequence, and the subscription selects the
item whose index is that value (counting from zero).

A string's items are characters.  A character is not a separate data
type but a string of exactly one character.

Related help topics: SEQUENCEMETHODS1

