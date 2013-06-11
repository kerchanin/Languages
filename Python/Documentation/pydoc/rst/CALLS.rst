Calls
*****

A call calls a callable object (e.g., a function) with a possibly
empty series of arguments:

   call                 ::= primary "(" [argument_list [","]
            | expression genexpr_for] ")"
   argument_list        ::= positional_arguments ["," keyword_arguments]
                       ["," "*" expression] ["," keyword_arguments]
                       ["," "**" expression]
                     | keyword_arguments ["," "*" expression]
                       ["," "**" expression]
                     | "*" expression ["," "*" expression] ["," "**" expression]
                     | "**" expression
   positional_arguments ::= expression ("," expression)*
   keyword_arguments    ::= keyword_item ("," keyword_item)*
   keyword_item         ::= identifier "=" expression

A trailing comma may be present after the positional and keyword
arguments but does not affect the semantics.

The primary must evaluate to a callable object (user-defined
functions, built-in functions, methods of built-in objects, class
objects, methods of class instances, and certain class instances
themselves are callable; extensions may define additional callable
object types).  All argument expressions are evaluated before the call
is attempted.  Please refer to section *Function definitions* for the
syntax of formal parameter lists.

If keyword arguments are present, they are first converted to
positional arguments, as follows.  First, a list of unfilled slots is
created for the formal parameters.  If there are N positional
arguments, they are placed in the first N slots.  Next, for each
keyword argument, the identifier is used to determine the
corresponding slot (if the identifier is the same as the first formal
parameter name, the first slot is used, and so on).  If the slot is
already filled, a ``TypeError`` exception is raised. Otherwise, the
value of the argument is placed in the slot, filling it (even if the
expression is ``None``, it fills the slot).  When all arguments have
been processed, the slots that are still unfilled are filled with the
corresponding default value from the function definition.  (Default
values are calculated, once, when the function is defined; thus, a
mutable object such as a list or dictionary used as default value will
be shared by all calls that don't specify an argument value for the
corresponding slot; this should usually be avoided.)  If there are any
unfilled slots for which no default value is specified, a
``TypeError`` exception is raised.  Otherwise, the list of filled
slots is used as the argument list for the call.

**CPython implementation detail:** An implementation may provide
built-in functions whose positional parameters do not have names, even
if they are 'named' for the purpose of documentation, and which
therefore cannot be supplied by keyword.  In CPython, this is the case
for functions implemented in C that use ``PyArg_ParseTuple()`` to
parse their arguments.

If there are more positional arguments than there are formal parameter
slots, a ``TypeError`` exception is raised, unless a formal parameter
using the syntax ``*identifier`` is present; in this case, that formal
parameter receives a tuple containing the excess positional arguments
(or an empty tuple if there were no excess positional arguments).

If any keyword argument does not correspond to a formal parameter
name, a ``TypeError`` exception is raised, unless a formal parameter
using the syntax ``**identifier`` is present; in this case, that
formal parameter receives a dictionary containing the excess keyword
arguments (using the keywords as keys and the argument values as
corresponding values), or a (new) empty dictionary if there were no
excess keyword arguments.

If the syntax ``*expression`` appears in the function call,
``expression`` must evaluate to an iterable.  Elements from this
iterable are treated as if they were additional positional arguments;
if there are positional arguments *x1*, ..., *xN*, and ``expression``
evaluates to a sequence *y1*, ..., *yM*, this is equivalent to a call
with M+N positional arguments *x1*, ..., *xN*, *y1*, ..., *yM*.

A consequence of this is that although the ``*expression`` syntax may
appear *after* some keyword arguments, it is processed *before* the
keyword arguments (and the ``**expression`` argument, if any -- see
below).  So:

   >>> def f(a, b):
   ...  print a, b
   ...
   >>> f(b=1, *(2,))
   2 1
   >>> f(a=1, *(2,))
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   TypeError: f() got multiple values for keyword argument 'a'
   >>> f(1, *(2,))
   1 2

It is unusual for both keyword arguments and the ``*expression``
syntax to be used in the same call, so in practice this confusion does
not arise.

If the syntax ``**expression`` appears in the function call,
``expression`` must evaluate to a mapping, the contents of which are
treated as additional keyword arguments.  In the case of a keyword
appearing in both ``expression`` and as an explicit keyword argument,
a ``TypeError`` exception is raised.

Formal parameters using the syntax ``*identifier`` or ``**identifier``
cannot be used as positional argument slots or as keyword argument
names.  Formal parameters using the syntax ``(sublist)`` cannot be
used as keyword argument names; the outermost sublist corresponds to a
single unnamed argument slot, and the argument value is assigned to
the sublist using the usual tuple assignment rules after all other
parameter processing is done.

A call always returns some value, possibly ``None``, unless it raises
an exception.  How this value is computed depends on the type of the
callable object.

If it is---

a user-defined function:
   The code block for the function is executed, passing it the
   argument list.  The first thing the code block will do is bind the
   formal parameters to the arguments; this is described in section
   *Function definitions*.  When the code block executes a ``return``
   statement, this specifies the return value of the function call.

a built-in function or method:
   The result is up to the interpreter; see *Built-in Functions* for
   the descriptions of built-in functions and methods.

a class object:
   A new instance of that class is returned.

a class instance method:
   The corresponding user-defined function is called, with an argument
   list that is one longer than the argument list of the call: the
   instance becomes the first argument.

a class instance:
   The class must define a ``__call__()`` method; the effect is then
   the same as if that method was called.

Related help topics: EXPRESSIONS

