Code Objects
************

Code objects are used by the implementation to represent "pseudo-
compiled" executable Python code such as a function body. They differ
from function objects because they don't contain a reference to their
global execution environment.  Code objects are returned by the built-
in ``compile()`` function and can be extracted from function objects
through their ``func_code`` attribute. See also the ``code`` module.

A code object can be executed or evaluated by passing it (instead of a
source string) to the ``exec`` statement or the built-in ``eval()``
function.

See *The standard type hierarchy* for more information.

Related help topics: compile, FUNCTIONS, TYPES

