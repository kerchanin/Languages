The ``return`` statement
************************

   return_stmt ::= "return" [expression_list]

``return`` may only occur syntactically nested in a function
definition, not within a nested class definition.

If an expression list is present, it is evaluated, else ``None`` is
substituted.

``return`` leaves the current function call with the expression list
(or ``None``) as return value.

When ``return`` passes control out of a ``try`` statement with a
``finally`` clause, that ``finally`` clause is executed before really
leaving the function.

In a generator function, the ``return`` statement is not allowed to
include an ``expression_list``.  In that context, a bare ``return``
indicates that the generator is done and will cause ``StopIteration``
to be raised.

Related help topics: FUNCTIONS

