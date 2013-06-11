Interaction with dynamic features
*********************************

There are several cases where Python statements are illegal when used
in conjunction with nested scopes that contain free variables.

If a variable is referenced in an enclosing scope, it is illegal to
delete the name.  An error will be reported at compile time.

If the wild card form of import --- ``import *`` --- is used in a
function and the function contains or is a nested block with free
variables, the compiler will raise a ``SyntaxError``.

If ``exec`` is used in a function and the function contains or is a
nested block with free variables, the compiler will raise a
``SyntaxError`` unless the exec explicitly specifies the local
namespace for the ``exec``.  (In other words, ``exec obj`` would be
illegal, but ``exec obj in ns`` would be legal.)

The ``eval()``, ``execfile()``, and ``input()`` functions and the
``exec`` statement do not have access to the full environment for
resolving names.  Names may be resolved in the local and global
namespaces of the caller.  Free variables are not resolved in the
nearest enclosing namespace, but in the global namespace. [1] The
``exec`` statement and the ``eval()`` and ``execfile()`` functions
have optional arguments to override the global and local namespace.
If only one namespace is specified, it is used for both.

