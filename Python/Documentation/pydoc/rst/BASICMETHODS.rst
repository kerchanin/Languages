Basic customization
*******************

object.__new__(cls[, ...])

   Called to create a new instance of class *cls*.  ``__new__()`` is a
   static method (special-cased so you need not declare it as such)
   that takes the class of which an instance was requested as its
   first argument.  The remaining arguments are those passed to the
   object constructor expression (the call to the class).  The return
   value of ``__new__()`` should be the new object instance (usually
   an instance of *cls*).

   Typical implementations create a new instance of the class by
   invoking the superclass's ``__new__()`` method using
   ``super(currentclass, cls).__new__(cls[, ...])`` with appropriate
   arguments and then modifying the newly-created instance as
   necessary before returning it.

   If ``__new__()`` returns an instance of *cls*, then the new
   instance's ``__init__()`` method will be invoked like
   ``__init__(self[, ...])``, where *self* is the new instance and the
   remaining arguments are the same as were passed to ``__new__()``.

   If ``__new__()`` does not return an instance of *cls*, then the new
   instance's ``__init__()`` method will not be invoked.

   ``__new__()`` is intended mainly to allow subclasses of immutable
   types (like int, str, or tuple) to customize instance creation.  It
   is also commonly overridden in custom metaclasses in order to
   customize class creation.

object.__init__(self[, ...])

   Called when the instance is created.  The arguments are those
   passed to the class constructor expression.  If a base class has an
   ``__init__()`` method, the derived class's ``__init__()`` method,
   if any, must explicitly call it to ensure proper initialization of
   the base class part of the instance; for example:
   ``BaseClass.__init__(self, [args...])``.  As a special constraint
   on constructors, no value may be returned; doing so will cause a
   ``TypeError`` to be raised at runtime.

object.__del__(self)

   Called when the instance is about to be destroyed.  This is also
   called a destructor.  If a base class has a ``__del__()`` method,
   the derived class's ``__del__()`` method, if any, must explicitly
   call it to ensure proper deletion of the base class part of the
   instance.  Note that it is possible (though not recommended!) for
   the ``__del__()`` method to postpone destruction of the instance by
   creating a new reference to it.  It may then be called at a later
   time when this new reference is deleted.  It is not guaranteed that
   ``__del__()`` methods are called for objects that still exist when
   the interpreter exits.

   Note: ``del x`` doesn't directly call ``x.__del__()`` --- the former
     decrements the reference count for ``x`` by one, and the latter
     is only called when ``x``'s reference count reaches zero.  Some
     common situations that may prevent the reference count of an
     object from going to zero include: circular references between
     objects (e.g., a doubly-linked list or a tree data structure with
     parent and child pointers); a reference to the object on the
     stack frame of a function that caught an exception (the traceback
     stored in ``sys.exc_traceback`` keeps the stack frame alive); or
     a reference to the object on the stack frame that raised an
     unhandled exception in interactive mode (the traceback stored in
     ``sys.last_traceback`` keeps the stack frame alive).  The first
     situation can only be remedied by explicitly breaking the cycles;
     the latter two situations can be resolved by storing ``None`` in
     ``sys.exc_traceback`` or ``sys.last_traceback``.  Circular
     references which are garbage are detected when the option cycle
     detector is enabled (it's on by default), but can only be cleaned
     up if there are no Python-level ``__del__()`` methods involved.
     Refer to the documentation for the ``gc`` module for more
     information about how ``__del__()`` methods are handled by the
     cycle detector, particularly the description of the ``garbage``
     value.

   Warning: Due to the precarious circumstances under which ``__del__()``
     methods are invoked, exceptions that occur during their execution
     are ignored, and a warning is printed to ``sys.stderr`` instead.
     Also, when ``__del__()`` is invoked in response to a module being
     deleted (e.g., when execution of the program is done), other
     globals referenced by the ``__del__()`` method may already have
     been deleted or in the process of being torn down (e.g. the
     import machinery shutting down).  For this reason, ``__del__()``
     methods should do the absolute minimum needed to maintain
     external invariants.  Starting with version 1.5, Python
     guarantees that globals whose name begins with a single
     underscore are deleted from their module before other globals are
     deleted; if no other references to such globals exist, this may
     help in assuring that imported modules are still available at the
     time when the ``__del__()`` method is called.

   See also the *-R* command-line option.

object.__repr__(self)

   Called by the ``repr()`` built-in function and by string
   conversions (reverse quotes) to compute the "official" string
   representation of an object.  If at all possible, this should look
   like a valid Python expression that could be used to recreate an
   object with the same value (given an appropriate environment).  If
   this is not possible, a string of the form ``<...some useful
   description...>`` should be returned.  The return value must be a
   string object. If a class defines ``__repr__()`` but not
   ``__str__()``, then ``__repr__()`` is also used when an "informal"
   string representation of instances of that class is required.

   This is typically used for debugging, so it is important that the
   representation is information-rich and unambiguous.

object.__str__(self)

   Called by the ``str()`` built-in function and by the ``print``
   statement to compute the "informal" string representation of an
   object.  This differs from ``__repr__()`` in that it does not have
   to be a valid Python expression: a more convenient or concise
   representation may be used instead. The return value must be a
   string object.

object.__lt__(self, other)
object.__le__(self, other)
object.__eq__(self, other)
object.__ne__(self, other)
object.__gt__(self, other)
object.__ge__(self, other)

   New in version 2.1.

   These are the so-called "rich comparison" methods, and are called
   for comparison operators in preference to ``__cmp__()`` below. The
   correspondence between operator symbols and method names is as
   follows: ``x<y`` calls ``x.__lt__(y)``, ``x<=y`` calls
   ``x.__le__(y)``, ``x==y`` calls ``x.__eq__(y)``, ``x!=y`` and
   ``x<>y`` call ``x.__ne__(y)``, ``x>y`` calls ``x.__gt__(y)``, and
   ``x>=y`` calls ``x.__ge__(y)``.

   A rich comparison method may return the singleton
   ``NotImplemented`` if it does not implement the operation for a
   given pair of arguments. By convention, ``False`` and ``True`` are
   returned for a successful comparison. However, these methods can
   return any value, so if the comparison operator is used in a
   Boolean context (e.g., in the condition of an ``if`` statement),
   Python will call ``bool()`` on the value to determine if the result
   is true or false.

   There are no implied relationships among the comparison operators.
   The truth of ``x==y`` does not imply that ``x!=y`` is false.
   Accordingly, when defining ``__eq__()``, one should also define
   ``__ne__()`` so that the operators will behave as expected.  See
   the paragraph on ``__hash__()`` for some important notes on
   creating *hashable* objects which support custom comparison
   operations and are usable as dictionary keys.

   There are no swapped-argument versions of these methods (to be used
   when the left argument does not support the operation but the right
   argument does); rather, ``__lt__()`` and ``__gt__()`` are each
   other's reflection, ``__le__()`` and ``__ge__()`` are each other's
   reflection, and ``__eq__()`` and ``__ne__()`` are their own
   reflection.

   Arguments to rich comparison methods are never coerced.

   To automatically generate ordering operations from a single root
   operation, see ``functools.total_ordering()``.

object.__cmp__(self, other)

   Called by comparison operations if rich comparison (see above) is
   not defined.  Should return a negative integer if ``self < other``,
   zero if ``self == other``, a positive integer if ``self > other``.
   If no ``__cmp__()``, ``__eq__()`` or ``__ne__()`` operation is
   defined, class instances are compared by object identity
   ("address").  See also the description of ``__hash__()`` for some
   important notes on creating *hashable* objects which support custom
   comparison operations and are usable as dictionary keys. (Note: the
   restriction that exceptions are not propagated by ``__cmp__()`` has
   been removed since Python 1.5.)

object.__rcmp__(self, other)

   Changed in version 2.1: No longer supported.

object.__hash__(self)

   Called by built-in function ``hash()`` and for operations on
   members of hashed collections including ``set``, ``frozenset``, and
   ``dict``.  ``__hash__()`` should return an integer.  The only
   required property is that objects which compare equal have the same
   hash value; it is advised to somehow mix together (e.g. using
   exclusive or) the hash values for the components of the object that
   also play a part in comparison of objects.

   If a class does not define a ``__cmp__()`` or ``__eq__()`` method
   it should not define a ``__hash__()`` operation either; if it
   defines ``__cmp__()`` or ``__eq__()`` but not ``__hash__()``, its
   instances will not be usable in hashed collections.  If a class
   defines mutable objects and implements a ``__cmp__()`` or
   ``__eq__()`` method, it should not implement ``__hash__()``, since
   hashable collection implementations require that a object's hash
   value is immutable (if the object's hash value changes, it will be
   in the wrong hash bucket).

   User-defined classes have ``__cmp__()`` and ``__hash__()`` methods
   by default; with them, all objects compare unequal (except with
   themselves) and ``x.__hash__()`` returns ``id(x)``.

   Classes which inherit a ``__hash__()`` method from a parent class
   but change the meaning of ``__cmp__()`` or ``__eq__()`` such that
   the hash value returned is no longer appropriate (e.g. by switching
   to a value-based concept of equality instead of the default
   identity based equality) can explicitly flag themselves as being
   unhashable by setting ``__hash__ = None`` in the class definition.
   Doing so means that not only will instances of the class raise an
   appropriate ``TypeError`` when a program attempts to retrieve their
   hash value, but they will also be correctly identified as
   unhashable when checking ``isinstance(obj, collections.Hashable)``
   (unlike classes which define their own ``__hash__()`` to explicitly
   raise ``TypeError``).

   Changed in version 2.5: ``__hash__()`` may now also return a long
   integer object; the 32-bit integer is then derived from the hash of
   that object.

   Changed in version 2.6: ``__hash__`` may now be set to ``None`` to
   explicitly flag instances of a class as unhashable.

object.__nonzero__(self)

   Called to implement truth value testing and the built-in operation
   ``bool()``; should return ``False`` or ``True``, or their integer
   equivalents ``0`` or ``1``.  When this method is not defined,
   ``__len__()`` is called, if it is defined, and the object is
   considered true if its result is nonzero. If a class defines
   neither ``__len__()`` nor ``__nonzero__()``, all its instances are
   considered true.

object.__unicode__(self)

   Called to implement ``unicode()`` built-in; should return a Unicode
   object. When this method is not defined, string conversion is
   attempted, and the result of string conversion is converted to
   Unicode using the system default encoding.

Related help topics: cmp, hash, repr, str, SPECIALMETHODS

