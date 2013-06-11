Exceptions
**********

Exceptions are a means of breaking out of the normal flow of control
of a code block in order to handle errors or other exceptional
conditions.  An exception is *raised* at the point where the error is
detected; it may be *handled* by the surrounding code block or by any
code block that directly or indirectly invoked the code block where
the error occurred.

The Python interpreter raises an exception when it detects a run-time
error (such as division by zero).  A Python program can also
explicitly raise an exception with the ``raise`` statement. Exception
handlers are specified with the ``try`` ... ``except`` statement.  The
``finally`` clause of such a statement can be used to specify cleanup
code which does not handle the exception, but is executed whether an
exception occurred or not in the preceding code.

Python uses the "termination" model of error handling: an exception
handler can find out what happened and continue execution at an outer
level, but it cannot repair the cause of the error and retry the
failing operation (except by re-entering the offending piece of code
from the top).

When an exception is not handled at all, the interpreter terminates
execution of the program, or returns to its interactive main loop.  In
either case, it prints a stack backtrace, except when the exception is
``SystemExit``.

Exceptions are identified by class instances.  The ``except`` clause
is selected depending on the class of the instance: it must reference
the class of the instance or a base class thereof.  The instance can
be received by the handler and can carry additional information about
the exceptional condition.

Exceptions can also be identified by strings, in which case the
``except`` clause is selected by object identity.  An arbitrary value
can be raised along with the identifying string which can be passed to
the handler.

Note: Messages to exceptions are not part of the Python API.  Their
  contents may change from one version of Python to the next without
  warning and should not be relied on by code which will run under
  multiple versions of the interpreter.

See also the description of the ``try`` statement in section *The try
statement* and ``raise`` statement in section *The raise statement*.

-[ Footnotes ]-

[1] This limitation occurs because the code that is executed by these
    operations is not available at the time the module is compiled.

Related help topics: try, except, finally, raise

