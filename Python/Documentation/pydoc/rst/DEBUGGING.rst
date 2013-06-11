``pdb`` --- The Python Debugger
*******************************

The module ``pdb`` defines an interactive source code debugger for
Python programs.  It supports setting (conditional) breakpoints and
single stepping at the source line level, inspection of stack frames,
source code listing, and evaluation of arbitrary Python code in the
context of any stack frame.  It also supports post-mortem debugging
and can be called under program control.

The debugger is extensible --- it is actually defined as the class
``Pdb``. This is currently undocumented but easily understood by
reading the source.  The extension interface uses the modules ``bdb``
and ``cmd``.

The debugger's prompt is ``(Pdb)``. Typical usage to run a program
under control of the debugger is:

   >>> import pdb
   >>> import mymodule
   >>> pdb.run('mymodule.test()')
   > <string>(0)?()
   (Pdb) continue
   > <string>(1)?()
   (Pdb) continue
   NameError: 'spam'
   > <string>(1)?()
   (Pdb)

``pdb.py`` can also be invoked as a script to debug other scripts.
For example:

   python -m pdb myscript.py

When invoked as a script, pdb will automatically enter post-mortem
debugging if the program being debugged exits abnormally. After post-
mortem debugging (or after normal exit of the program), pdb will
restart the program. Automatic restarting preserves pdb's state (such
as breakpoints) and in most cases is more useful than quitting the
debugger upon program's exit.

New in version 2.4: Restarting post-mortem behavior added.

The typical usage to break into the debugger from a running program is
to insert

   import pdb; pdb.set_trace()

at the location you want to break into the debugger.  You can then
step through the code following this statement, and continue running
without the debugger using the ``c`` command.

The typical usage to inspect a crashed program is:

   >>> import pdb
   >>> import mymodule
   >>> mymodule.test()
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
     File "./mymodule.py", line 4, in test
       test2()
     File "./mymodule.py", line 3, in test2
       print spam
   NameError: spam
   >>> pdb.pm()
   > ./mymodule.py(3)test2()
   -> print spam
   (Pdb)

The module defines the following functions; each enters the debugger
in a slightly different way:

pdb.run(statement[, globals[, locals]])

   Execute the *statement* (given as a string) under debugger control.
   The debugger prompt appears before any code is executed; you can
   set breakpoints and type ``continue``, or you can step through the
   statement using ``step`` or ``next`` (all these commands are
   explained below).  The optional *globals* and *locals* arguments
   specify the environment in which the code is executed; by default
   the dictionary of the module ``__main__`` is used.  (See the
   explanation of the ``exec`` statement or the ``eval()`` built-in
   function.)

pdb.runeval(expression[, globals[, locals]])

   Evaluate the *expression* (given as a string) under debugger
   control.  When ``runeval()`` returns, it returns the value of the
   expression.  Otherwise this function is similar to ``run()``.

pdb.runcall(function[, argument, ...])

   Call the *function* (a function or method object, not a string)
   with the given arguments.  When ``runcall()`` returns, it returns
   whatever the function call returned.  The debugger prompt appears
   as soon as the function is entered.

pdb.set_trace()

   Enter the debugger at the calling stack frame.  This is useful to
   hard-code a breakpoint at a given point in a program, even if the
   code is not otherwise being debugged (e.g. when an assertion
   fails).

pdb.post_mortem([traceback])

   Enter post-mortem debugging of the given *traceback* object.  If no
   *traceback* is given, it uses the one of the exception that is
   currently being handled (an exception must be being handled if the
   default is to be used).

pdb.pm()

   Enter post-mortem debugging of the traceback found in
   ``sys.last_traceback``.

The ``run*`` functions and ``set_trace()`` are aliases for
instantiating the ``Pdb`` class and calling the method of the same
name.  If you want to access further features, you have to do this
yourself:

class class pdb.Pdb(completekey='tab', stdin=None, stdout=None, skip=None)

   ``Pdb`` is the debugger class.

   The *completekey*, *stdin* and *stdout* arguments are passed to the
   underlying ``cmd.Cmd`` class; see the description there.

   The *skip* argument, if given, must be an iterable of glob-style
   module name patterns.  The debugger will not step into frames that
   originate in a module that matches one of these patterns. [1]

   Example call to enable tracing with *skip*:

      import pdb; pdb.Pdb(skip=['django.*']).set_trace()

   New in version 2.7: The *skip* argument.

   run(statement[, globals[, locals]])
   runeval(expression[, globals[, locals]])
   runcall(function[, argument, ...])
   set_trace()

      See the documentation for the functions explained above.

Related help topics: pdb

