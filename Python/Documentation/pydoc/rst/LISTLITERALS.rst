List displays
*************

A list display is a possibly empty series of expressions enclosed in
square brackets:

   list_display        ::= "[" [expression_list | list_comprehension] "]"
   list_comprehension  ::= expression list_for
   list_for            ::= "for" target_list "in" old_expression_list [list_iter]
   old_expression_list ::= old_expression [("," old_expression)+ [","]]
   old_expression      ::= or_test | old_lambda_form
   list_iter           ::= list_for | list_if
   list_if             ::= "if" old_expression [list_iter]

A list display yields a new list object.  Its contents are specified
by providing either a list of expressions or a list comprehension.
When a comma-separated list of expressions is supplied, its elements
are evaluated from left to right and placed into the list object in
that order.  When a list comprehension is supplied, it consists of a
single expression followed by at least one ``for`` clause and zero or
more ``for`` or ``if`` clauses.  In this case, the elements of the new
list are those that would be produced by considering each of the
``for`` or ``if`` clauses a block, nesting from left to right, and
evaluating the expression to produce a list element each time the
innermost block is reached [1].

Related help topics: LISTS, LITERALS

