Slicings
********

A slicing selects a range of items in a sequence object (e.g., a
string, tuple or list).  Slicings may be used as expressions or as
targets in assignment or ``del`` statements.  The syntax for a
slicing:

   slicing          ::= simple_slicing | extended_slicing
   simple_slicing   ::= primary "[" short_slice "]"
   extended_slicing ::= primary "[" slice_list "]"
   slice_list       ::= slice_item ("," slice_item)* [","]
   slice_item       ::= expression | proper_slice | ellipsis
   proper_slice     ::= short_slice | long_slice
   short_slice      ::= [lower_bound] ":" [upper_bound]
   long_slice       ::= short_slice ":" [stride]
   lower_bound      ::= expression
   upper_bound      ::= expression
   stride           ::= expression
   ellipsis         ::= "..."

There is ambiguity in the formal syntax here: anything that looks like
an expression list also looks like a slice list, so any subscription
can be interpreted as a slicing.  Rather than further complicating the
syntax, this is disambiguated by defining that in this case the
interpretation as a subscription takes priority over the
interpretation as a slicing (this is the case if the slice list
contains no proper slice nor ellipses).  Similarly, when the slice
list has exactly one short slice and no trailing comma, the
interpretation as a simple slicing takes priority over that as an
extended slicing.

The semantics for a simple slicing are as follows.  The primary must
evaluate to a sequence object.  The lower and upper bound expressions,
if present, must evaluate to plain integers; defaults are zero and the
``sys.maxint``, respectively.  If either bound is negative, the
sequence's length is added to it.  The slicing now selects all items
with index *k* such that ``i <= k < j`` where *i* and *j* are the
specified lower and upper bounds.  This may be an empty sequence.  It
is not an error if *i* or *j* lie outside the range of valid indexes
(such items don't exist so they aren't selected).

The semantics for an extended slicing are as follows.  The primary
must evaluate to a mapping object, and it is indexed with a key that
is constructed from the slice list, as follows.  If the slice list
contains at least one comma, the key is a tuple containing the
conversion of the slice items; otherwise, the conversion of the lone
slice item is the key.  The conversion of a slice item that is an
expression is that expression.  The conversion of an ellipsis slice
item is the built-in ``Ellipsis`` object.  The conversion of a proper
slice is a slice object (see section *The standard type hierarchy*)
whose ``start``, ``stop`` and ``step`` attributes are the values of
the expressions given as lower bound, upper bound and stride,
respectively, substituting ``None`` for missing expressions.

Related help topics: SEQUENCEMETHODS2

