The standard type hierarchy
***************************

Below is a list of the types that are built into Python.  Extension
modules (written in C, Java, or other languages, depending on the
implementation) can define additional types.  Future versions of
Python may add types to the type hierarchy (e.g., rational numbers,
efficiently stored arrays of integers, etc.).

Some of the type descriptions below contain a paragraph listing
'special attributes.'  These are attributes that provide access to the
implementation and are not intended for general use.  Their definition
may change in the future.

None
   This type has a single value.  There is a single object with this
   value. This object is accessed through the built-in name ``None``.
   It is used to signify the absence of a value in many situations,
   e.g., it is returned from functions that don't explicitly return
   anything. Its truth value is false.

NotImplemented
   This type has a single value.  There is a single object with this
   value. This object is accessed through the built-in name
   ``NotImplemented``. Numeric methods and rich comparison methods may
   return this value if they do not implement the operation for the
   operands provided.  (The interpreter will then try the reflected
   operation, or some other fallback, depending on the operator.)  Its
   truth value is true.

Ellipsis
   This type has a single value.  There is a single object with this
   value. This object is accessed through the built-in name
   ``Ellipsis``. It is used to indicate the presence of the ``...``
   syntax in a slice.  Its truth value is true.

``numbers.Number``
   These are created by numeric literals and returned as results by
   arithmetic operators and arithmetic built-in functions.  Numeric
   objects are immutable; once created their value never changes.
   Python numbers are of course strongly related to mathematical
   numbers, but subject to the limitations of numerical representation
   in computers.

   Python distinguishes between integers, floating point numbers, and
   complex numbers:

   ``numbers.Integral``
      These represent elements from the mathematical set of integers
      (positive and negative).

      There are three types of integers:

      Plain integers
         These represent numbers in the range -2147483648 through
         2147483647. (The range may be larger on machines with a
         larger natural word size, but not smaller.)  When the result
         of an operation would fall outside this range, the result is
         normally returned as a long integer (in some cases, the
         exception ``OverflowError`` is raised instead).  For the
         purpose of shift and mask operations, integers are assumed to
         have a binary, 2's complement notation using 32 or more bits,
         and hiding no bits from the user (i.e., all 4294967296
         different bit patterns correspond to different values).

      Long integers
         These represent numbers in an unlimited range, subject to
         available (virtual) memory only.  For the purpose of shift
         and mask operations, a binary representation is assumed, and
         negative numbers are represented in a variant of 2's
         complement which gives the illusion of an infinite string of
         sign bits extending to the left.

      Booleans
         These represent the truth values False and True.  The two
         objects representing the values False and True are the only
         Boolean objects. The Boolean type is a subtype of plain
         integers, and Boolean values behave like the values 0 and 1,
         respectively, in almost all contexts, the exception being
         that when converted to a string, the strings ``"False"`` or
         ``"True"`` are returned, respectively.

      The rules for integer representation are intended to give the
      most meaningful interpretation of shift and mask operations
      involving negative integers and the least surprises when
      switching between the plain and long integer domains.  Any
      operation, if it yields a result in the plain integer domain,
      will yield the same result in the long integer domain or when
      using mixed operands.  The switch between domains is transparent
      to the programmer.

   ``numbers.Real`` (``float``)
      These represent machine-level double precision floating point
      numbers. You are at the mercy of the underlying machine
      architecture (and C or Java implementation) for the accepted
      range and handling of overflow. Python does not support single-
      precision floating point numbers; the savings in processor and
      memory usage that are usually the reason for using these is
      dwarfed by the overhead of using objects in Python, so there is
      no reason to complicate the language with two kinds of floating
      point numbers.

   ``numbers.Complex``
      These represent complex numbers as a pair of machine-level
      double precision floating point numbers.  The same caveats apply
      as for floating point numbers. The real and imaginary parts of a
      complex number ``z`` can be retrieved through the read-only
      attributes ``z.real`` and ``z.imag``.

Sequences
   These represent finite ordered sets indexed by non-negative
   numbers. The built-in function ``len()`` returns the number of
   items of a sequence. When the length of a sequence is *n*, the
   index set contains the numbers 0, 1, ..., *n*-1.  Item *i* of
   sequence *a* is selected by ``a[i]``.

   Sequences also support slicing: ``a[i:j]`` selects all items with
   index *k* such that *i* ``<=`` *k* ``<`` *j*.  When used as an
   expression, a slice is a sequence of the same type.  This implies
   that the index set is renumbered so that it starts at 0.

   Some sequences also support "extended slicing" with a third "step"
   parameter: ``a[i:j:k]`` selects all items of *a* with index *x*
   where ``x = i + n*k``, *n* ``>=`` ``0`` and *i* ``<=`` *x* ``<``
   *j*.

   Sequences are distinguished according to their mutability:

   Immutable sequences
      An object of an immutable sequence type cannot change once it is
      created.  (If the object contains references to other objects,
      these other objects may be mutable and may be changed; however,
      the collection of objects directly referenced by an immutable
      object cannot change.)

      The following types are immutable sequences:

      Strings
         The items of a string are characters.  There is no separate
         character type; a character is represented by a string of one
         item. Characters represent (at least) 8-bit bytes.  The
         built-in functions ``chr()`` and ``ord()`` convert between
         characters and nonnegative integers representing the byte
         values.  Bytes with the values 0-127 usually represent the
         corresponding ASCII values, but the interpretation of values
         is up to the program.  The string data type is also used to
         represent arrays of bytes, e.g., to hold data read from a
         file.

         (On systems whose native character set is not ASCII, strings
         may use EBCDIC in their internal representation, provided the
         functions ``chr()`` and ``ord()`` implement a mapping between
         ASCII and EBCDIC, and string comparison preserves the ASCII
         order. Or perhaps someone can propose a better rule?)

      Unicode
         The items of a Unicode object are Unicode code units.  A
         Unicode code unit is represented by a Unicode object of one
         item and can hold either a 16-bit or 32-bit value
         representing a Unicode ordinal (the maximum value for the
         ordinal is given in ``sys.maxunicode``, and depends on how
         Python is configured at compile time).  Surrogate pairs may
         be present in the Unicode object, and will be reported as two
         separate items.  The built-in functions ``unichr()`` and
         ``ord()`` convert between code units and nonnegative integers
         representing the Unicode ordinals as defined in the Unicode
         Standard 3.0. Conversion from and to other encodings are
         possible through the Unicode method ``encode()`` and the
         built-in function ``unicode()``.

      Tuples
         The items of a tuple are arbitrary Python objects. Tuples of
         two or more items are formed by comma-separated lists of
         expressions.  A tuple of one item (a 'singleton') can be
         formed by affixing a comma to an expression (an expression by
         itself does not create a tuple, since parentheses must be
         usable for grouping of expressions).  An empty tuple can be
         formed by an empty pair of parentheses.

   Mutable sequences
      Mutable sequences can be changed after they are created.  The
      subscription and slicing notations can be used as the target of
      assignment and ``del`` (delete) statements.

      There are currently two intrinsic mutable sequence types:

      Lists
         The items of a list are arbitrary Python objects.  Lists are
         formed by placing a comma-separated list of expressions in
         square brackets. (Note that there are no special cases needed
         to form lists of length 0 or 1.)

      Byte Arrays
         A bytearray object is a mutable array. They are created by
         the built-in ``bytearray()`` constructor.  Aside from being
         mutable (and hence unhashable), byte arrays otherwise provide
         the same interface and functionality as immutable bytes
         objects.

      The extension module ``array`` provides an additional example of
      a mutable sequence type.

Set types
   These represent unordered, finite sets of unique, immutable
   objects. As such, they cannot be indexed by any subscript. However,
   they can be iterated over, and the built-in function ``len()``
   returns the number of items in a set. Common uses for sets are fast
   membership testing, removing duplicates from a sequence, and
   computing mathematical operations such as intersection, union,
   difference, and symmetric difference.

   For set elements, the same immutability rules apply as for
   dictionary keys. Note that numeric types obey the normal rules for
   numeric comparison: if two numbers compare equal (e.g., ``1`` and
   ``1.0``), only one of them can be contained in a set.

   There are currently two intrinsic set types:

   Sets
      These represent a mutable set. They are created by the built-in
      ``set()`` constructor and can be modified afterwards by several
      methods, such as ``add()``.

   Frozen sets
      These represent an immutable set.  They are created by the
      built-in ``frozenset()`` constructor.  As a frozenset is
      immutable and *hashable*, it can be used again as an element of
      another set, or as a dictionary key.

Mappings
   These represent finite sets of objects indexed by arbitrary index
   sets. The subscript notation ``a[k]`` selects the item indexed by
   ``k`` from the mapping ``a``; this can be used in expressions and
   as the target of assignments or ``del`` statements. The built-in
   function ``len()`` returns the number of items in a mapping.

   There is currently a single intrinsic mapping type:

   Dictionaries
      These represent finite sets of objects indexed by nearly
      arbitrary values.  The only types of values not acceptable as
      keys are values containing lists or dictionaries or other
      mutable types that are compared by value rather than by object
      identity, the reason being that the efficient implementation of
      dictionaries requires a key's hash value to remain constant.
      Numeric types used for keys obey the normal rules for numeric
      comparison: if two numbers compare equal (e.g., ``1`` and
      ``1.0``) then they can be used interchangeably to index the same
      dictionary entry.

      Dictionaries are mutable; they can be created by the ``{...}``
      notation (see section *Dictionary displays*).

      The extension modules ``dbm``, ``gdbm``, and ``bsddb`` provide
      additional examples of mapping types.

Callable types
   These are the types to which the function call operation (see
   section *Calls*) can be applied:

   User-defined functions
      A user-defined function object is created by a function
      definition (see section *Function definitions*).  It should be
      called with an argument list containing the same number of items
      as the function's formal parameter list.

      Special attributes:

      +-------------------------+---------------------------------+-------------+
      | Attribute               | Meaning                         |             |
      +=========================+=================================+=============+
      | ``func_doc``            | The function's documentation    | Writable    |
      |                         | string, or ``None`` if          |             |
      |                         | unavailable                     |             |
      +-------------------------+---------------------------------+-------------+
      | ``__doc__``             | Another way of spelling         | Writable    |
      |                         | ``func_doc``                    |             |
      +-------------------------+---------------------------------+-------------+
      | ``func_name``           | The function's name             | Writable    |
      +-------------------------+---------------------------------+-------------+
      | ``__name__``            | Another way of spelling         | Writable    |
      |                         | ``func_name``                   |             |
      +-------------------------+---------------------------------+-------------+
      | ``__module__``          | The name of the module the      | Writable    |
      |                         | function was defined in, or     |             |
      |                         | ``None`` if unavailable.        |             |
      +-------------------------+---------------------------------+-------------+
      | ``func_defaults``       | A tuple containing default      | Writable    |
      |                         | argument values for those       |             |
      |                         | arguments that have defaults,   |             |
      |                         | or ``None`` if no arguments     |             |
      |                         | have a default value            |             |
      +-------------------------+---------------------------------+-------------+
      | ``func_code``           | The code object representing    | Writable    |
      |                         | the compiled function body.     |             |
      +-------------------------+---------------------------------+-------------+
      | ``func_globals``        | A reference to the dictionary   | Read-only   |
      |                         | that holds the function's       |             |
      |                         | global variables --- the global |             |
      |                         | namespace of the module in      |             |
      |                         | which the function was defined. |             |
      +-------------------------+---------------------------------+-------------+
      | ``func_dict``           | The namespace supporting        | Writable    |
      |                         | arbitrary function attributes.  |             |
      +-------------------------+---------------------------------+-------------+
      | ``func_closure``        | ``None`` or a tuple of cells    | Read-only   |
      |                         | that contain bindings for the   |             |
      |                         | function's free variables.      |             |
      +-------------------------+---------------------------------+-------------+

      Most of the attributes labelled "Writable" check the type of the
      assigned value.

      Changed in version 2.4: ``func_name`` is now writable.

      Function objects also support getting and setting arbitrary
      attributes, which can be used, for example, to attach metadata
      to functions.  Regular attribute dot-notation is used to get and
      set such attributes. *Note that the current implementation only
      supports function attributes on user-defined functions. Function
      attributes on built-in functions may be supported in the
      future.*

      Additional information about a function's definition can be
      retrieved from its code object; see the description of internal
      types below.

   User-defined methods
      A user-defined method object combines a class, a class instance
      (or ``None``) and any callable object (normally a user-defined
      function).

      Special read-only attributes: ``im_self`` is the class instance
      object, ``im_func`` is the function object; ``im_class`` is the
      class of ``im_self`` for bound methods or the class that asked
      for the method for unbound methods; ``__doc__`` is the method's
      documentation (same as ``im_func.__doc__``); ``__name__`` is the
      method name (same as ``im_func.__name__``); ``__module__`` is
      the name of the module the method was defined in, or ``None`` if
      unavailable.

      Changed in version 2.2: ``im_self`` used to refer to the class
      that defined the method.

      Changed in version 2.6: For 3.0 forward-compatibility,
      ``im_func`` is also available as ``__func__``, and ``im_self``
      as ``__self__``.

      Methods also support accessing (but not setting) the arbitrary
      function attributes on the underlying function object.

      User-defined method objects may be created when getting an
      attribute of a class (perhaps via an instance of that class), if
      that attribute is a user-defined function object, an unbound
      user-defined method object, or a class method object. When the
      attribute is a user-defined method object, a new method object
      is only created if the class from which it is being retrieved is
      the same as, or a derived class of, the class stored in the
      original method object; otherwise, the original method object is
      used as it is.

      When a user-defined method object is created by retrieving a
      user-defined function object from a class, its ``im_self``
      attribute is ``None`` and the method object is said to be
      unbound. When one is created by retrieving a user-defined
      function object from a class via one of its instances, its
      ``im_self`` attribute is the instance, and the method object is
      said to be bound. In either case, the new method's ``im_class``
      attribute is the class from which the retrieval takes place, and
      its ``im_func`` attribute is the original function object.

      When a user-defined method object is created by retrieving
      another method object from a class or instance, the behaviour is
      the same as for a function object, except that the ``im_func``
      attribute of the new instance is not the original method object
      but its ``im_func`` attribute.

      When a user-defined method object is created by retrieving a
      class method object from a class or instance, its ``im_self``
      attribute is the class itself (the same as the ``im_class``
      attribute), and its ``im_func`` attribute is the function object
      underlying the class method.

      When an unbound user-defined method object is called, the
      underlying function (``im_func``) is called, with the
      restriction that the first argument must be an instance of the
      proper class (``im_class``) or of a derived class thereof.

      When a bound user-defined method object is called, the
      underlying function (``im_func``) is called, inserting the class
      instance (``im_self``) in front of the argument list.  For
      instance, when ``C`` is a class which contains a definition for
      a function ``f()``, and ``x`` is an instance of ``C``, calling
      ``x.f(1)`` is equivalent to calling ``C.f(x, 1)``.

      When a user-defined method object is derived from a class method
      object, the "class instance" stored in ``im_self`` will actually
      be the class itself, so that calling either ``x.f(1)`` or
      ``C.f(1)`` is equivalent to calling ``f(C,1)`` where ``f`` is
      the underlying function.

      Note that the transformation from function object to (unbound or
      bound) method object happens each time the attribute is
      retrieved from the class or instance. In some cases, a fruitful
      optimization is to assign the attribute to a local variable and
      call that local variable. Also notice that this transformation
      only happens for user-defined functions; other callable objects
      (and all non-callable objects) are retrieved without
      transformation.  It is also important to note that user-defined
      functions which are attributes of a class instance are not
      converted to bound methods; this *only* happens when the
      function is an attribute of the class.

   Generator functions
      A function or method which uses the ``yield`` statement (see
      section *The yield statement*) is called a *generator function*.
      Such a function, when called, always returns an iterator object
      which can be used to execute the body of the function:  calling
      the iterator's ``next()`` method will cause the function to
      execute until it provides a value using the ``yield`` statement.
      When the function executes a ``return`` statement or falls off
      the end, a ``StopIteration`` exception is raised and the
      iterator will have reached the end of the set of values to be
      returned.

   Built-in functions
      A built-in function object is a wrapper around a C function.
      Examples of built-in functions are ``len()`` and ``math.sin()``
      (``math`` is a standard built-in module). The number and type of
      the arguments are determined by the C function. Special read-
      only attributes: ``__doc__`` is the function's documentation
      string, or ``None`` if unavailable; ``__name__`` is the
      function's name; ``__self__`` is set to ``None`` (but see the
      next item); ``__module__`` is the name of the module the
      function was defined in or ``None`` if unavailable.

   Built-in methods
      This is really a different disguise of a built-in function, this
      time containing an object passed to the C function as an
      implicit extra argument.  An example of a built-in method is
      ``alist.append()``, assuming *alist* is a list object. In this
      case, the special read-only attribute ``__self__`` is set to the
      object denoted by *alist*.

   Class Types
      Class types, or "new-style classes," are callable.  These
      objects normally act as factories for new instances of
      themselves, but variations are possible for class types that
      override ``__new__()``.  The arguments of the call are passed to
      ``__new__()`` and, in the typical case, to ``__init__()`` to
      initialize the new instance.

   Classic Classes
      Class objects are described below.  When a class object is
      called, a new class instance (also described below) is created
      and returned.  This implies a call to the class's ``__init__()``
      method if it has one.  Any arguments are passed on to the
      ``__init__()`` method.  If there is no ``__init__()`` method,
      the class must be called without arguments.

   Class instances
      Class instances are described below.  Class instances are
      callable only when the class has a ``__call__()`` method;
      ``x(arguments)`` is a shorthand for ``x.__call__(arguments)``.

Modules
   Modules are imported by the ``import`` statement (see section *The
   import statement*). A module object has a namespace implemented by
   a dictionary object (this is the dictionary referenced by the
   func_globals attribute of functions defined in the module).
   Attribute references are translated to lookups in this dictionary,
   e.g., ``m.x`` is equivalent to ``m.__dict__["x"]``. A module object
   does not contain the code object used to initialize the module
   (since it isn't needed once the initialization is done).

   Attribute assignment updates the module's namespace dictionary,
   e.g., ``m.x = 1`` is equivalent to ``m.__dict__["x"] = 1``.

   Special read-only attribute: ``__dict__`` is the module's namespace
   as a dictionary object.

   **CPython implementation detail:** Because of the way CPython
   clears module dictionaries, the module dictionary will be cleared
   when the module falls out of scope even if the dictionary still has
   live references.  To avoid this, copy the dictionary or keep the
   module around while using its dictionary directly.

   Predefined (writable) attributes: ``__name__`` is the module's
   name; ``__doc__`` is the module's documentation string, or ``None``
   if unavailable; ``__file__`` is the pathname of the file from which
   the module was loaded, if it was loaded from a file. The
   ``__file__`` attribute is not present for C modules that are
   statically linked into the interpreter; for extension modules
   loaded dynamically from a shared library, it is the pathname of the
   shared library file.

Classes
   Both class types (new-style classes) and class objects (old-
   style/classic classes) are typically created by class definitions
   (see section *Class definitions*).  A class has a namespace
   implemented by a dictionary object. Class attribute references are
   translated to lookups in this dictionary, e.g., ``C.x`` is
   translated to ``C.__dict__["x"]`` (although for new-style classes
   in particular there are a number of hooks which allow for other
   means of locating attributes). When the attribute name is not found
   there, the attribute search continues in the base classes.  For
   old-style classes, the search is depth-first, left-to-right in the
   order of occurrence in the base class list. New-style classes use
   the more complex C3 method resolution order which behaves correctly
   even in the presence of 'diamond' inheritance structures where
   there are multiple inheritance paths leading back to a common
   ancestor. Additional details on the C3 MRO used by new-style
   classes can be found in the documentation accompanying the 2.3
   release at http://www.python.org/download/releases/2.3/mro/.

   When a class attribute reference (for class ``C``, say) would yield
   a user-defined function object or an unbound user-defined method
   object whose associated class is either ``C`` or one of its base
   classes, it is transformed into an unbound user-defined method
   object whose ``im_class`` attribute is ``C``. When it would yield a
   class method object, it is transformed into a bound user-defined
   method object whose ``im_class`` and ``im_self`` attributes are
   both ``C``.  When it would yield a static method object, it is
   transformed into the object wrapped by the static method object.
   See section *Implementing Descriptors* for another way in which
   attributes retrieved from a class may differ from those actually
   contained in its ``__dict__`` (note that only new-style classes
   support descriptors).

   Class attribute assignments update the class's dictionary, never
   the dictionary of a base class.

   A class object can be called (see above) to yield a class instance
   (see below).

   Special attributes: ``__name__`` is the class name; ``__module__``
   is the module name in which the class was defined; ``__dict__`` is
   the dictionary containing the class's namespace; ``__bases__`` is a
   tuple (possibly empty or a singleton) containing the base classes,
   in the order of their occurrence in the base class list;
   ``__doc__`` is the class's documentation string, or None if
   undefined.

Class instances
   A class instance is created by calling a class object (see above).
   A class instance has a namespace implemented as a dictionary which
   is the first place in which attribute references are searched.
   When an attribute is not found there, and the instance's class has
   an attribute by that name, the search continues with the class
   attributes.  If a class attribute is found that is a user-defined
   function object or an unbound user-defined method object whose
   associated class is the class (call it ``C``) of the instance for
   which the attribute reference was initiated or one of its bases, it
   is transformed into a bound user-defined method object whose
   ``im_class`` attribute is ``C`` and whose ``im_self`` attribute is
   the instance. Static method and class method objects are also
   transformed, as if they had been retrieved from class ``C``; see
   above under "Classes". See section *Implementing Descriptors* for
   another way in which attributes of a class retrieved via its
   instances may differ from the objects actually stored in the
   class's ``__dict__``. If no class attribute is found, and the
   object's class has a ``__getattr__()`` method, that is called to
   satisfy the lookup.

   Attribute assignments and deletions update the instance's
   dictionary, never a class's dictionary.  If the class has a
   ``__setattr__()`` or ``__delattr__()`` method, this is called
   instead of updating the instance dictionary directly.

   Class instances can pretend to be numbers, sequences, or mappings
   if they have methods with certain special names.  See section
   *Special method names*.

   Special attributes: ``__dict__`` is the attribute dictionary;
   ``__class__`` is the instance's class.

Files
   A file object represents an open file.  File objects are created by
   the ``open()`` built-in function, and also by ``os.popen()``,
   ``os.fdopen()``, and the ``makefile()`` method of socket objects
   (and perhaps by other functions or methods provided by extension
   modules).  The objects ``sys.stdin``, ``sys.stdout`` and
   ``sys.stderr`` are initialized to file objects corresponding to the
   interpreter's standard input, output and error streams.  See *File
   Objects* for complete documentation of file objects.

Internal types
   A few types used internally by the interpreter are exposed to the
   user. Their definitions may change with future versions of the
   interpreter, but they are mentioned here for completeness.

   Code objects
      Code objects represent *byte-compiled* executable Python code,
      or *bytecode*. The difference between a code object and a
      function object is that the function object contains an explicit
      reference to the function's globals (the module in which it was
      defined), while a code object contains no context; also the
      default argument values are stored in the function object, not
      in the code object (because they represent values calculated at
      run-time).  Unlike function objects, code objects are immutable
      and contain no references (directly or indirectly) to mutable
      objects.

      Special read-only attributes: ``co_name`` gives the function
      name; ``co_argcount`` is the number of positional arguments
      (including arguments with default values); ``co_nlocals`` is the
      number of local variables used by the function (including
      arguments); ``co_varnames`` is a tuple containing the names of
      the local variables (starting with the argument names);
      ``co_cellvars`` is a tuple containing the names of local
      variables that are referenced by nested functions;
      ``co_freevars`` is a tuple containing the names of free
      variables; ``co_code`` is a string representing the sequence of
      bytecode instructions; ``co_consts`` is a tuple containing the
      literals used by the bytecode; ``co_names`` is a tuple
      containing the names used by the bytecode; ``co_filename`` is
      the filename from which the code was compiled;
      ``co_firstlineno`` is the first line number of the function;
      ``co_lnotab`` is a string encoding the mapping from bytecode
      offsets to line numbers (for details see the source code of the
      interpreter); ``co_stacksize`` is the required stack size
      (including local variables); ``co_flags`` is an integer encoding
      a number of flags for the interpreter.

      The following flag bits are defined for ``co_flags``: bit
      ``0x04`` is set if the function uses the ``*arguments`` syntax
      to accept an arbitrary number of positional arguments; bit
      ``0x08`` is set if the function uses the ``**keywords`` syntax
      to accept arbitrary keyword arguments; bit ``0x20`` is set if
      the function is a generator.

      Future feature declarations (``from __future__ import
      division``) also use bits in ``co_flags`` to indicate whether a
      code object was compiled with a particular feature enabled: bit
      ``0x2000`` is set if the function was compiled with future
      division enabled; bits ``0x10`` and ``0x1000`` were used in
      earlier versions of Python.

      Other bits in ``co_flags`` are reserved for internal use.

      If a code object represents a function, the first item in
      ``co_consts`` is the documentation string of the function, or
      ``None`` if undefined.

   Frame objects
      Frame objects represent execution frames.  They may occur in
      traceback objects (see below).

      Special read-only attributes: ``f_back`` is to the previous
      stack frame (towards the caller), or ``None`` if this is the
      bottom stack frame; ``f_code`` is the code object being executed
      in this frame; ``f_locals`` is the dictionary used to look up
      local variables; ``f_globals`` is used for global variables;
      ``f_builtins`` is used for built-in (intrinsic) names;
      ``f_restricted`` is a flag indicating whether the function is
      executing in restricted execution mode; ``f_lasti`` gives the
      precise instruction (this is an index into the bytecode string
      of the code object).

      Special writable attributes: ``f_trace``, if not ``None``, is a
      function called at the start of each source code line (this is
      used by the debugger); ``f_exc_type``, ``f_exc_value``,
      ``f_exc_traceback`` represent the last exception raised in the
      parent frame provided another exception was ever raised in the
      current frame (in all other cases they are None); ``f_lineno``
      is the current line number of the frame --- writing to this from
      within a trace function jumps to the given line (only for the
      bottom-most frame).  A debugger can implement a Jump command
      (aka Set Next Statement) by writing to f_lineno.

   Traceback objects
      Traceback objects represent a stack trace of an exception.  A
      traceback object is created when an exception occurs.  When the
      search for an exception handler unwinds the execution stack, at
      each unwound level a traceback object is inserted in front of
      the current traceback.  When an exception handler is entered,
      the stack trace is made available to the program. (See section
      *The try statement*.) It is accessible as ``sys.exc_traceback``,
      and also as the third item of the tuple returned by
      ``sys.exc_info()``.  The latter is the preferred interface,
      since it works correctly when the program is using multiple
      threads. When the program contains no suitable handler, the
      stack trace is written (nicely formatted) to the standard error
      stream; if the interpreter is interactive, it is also made
      available to the user as ``sys.last_traceback``.

      Special read-only attributes: ``tb_next`` is the next level in
      the stack trace (towards the frame where the exception
      occurred), or ``None`` if there is no next level; ``tb_frame``
      points to the execution frame of the current level;
      ``tb_lineno`` gives the line number where the exception
      occurred; ``tb_lasti`` indicates the precise instruction.  The
      line number and last instruction in the traceback may differ
      from the line number of its frame object if the exception
      occurred in a ``try`` statement with no matching except clause
      or with a finally clause.

   Slice objects
      Slice objects are used to represent slices when *extended slice
      syntax* is used. This is a slice using two colons, or multiple
      slices or ellipses separated by commas, e.g., ``a[i:j:step]``,
      ``a[i:j, k:l]``, or ``a[..., i:j]``.  They are also created by
      the built-in ``slice()`` function.

      Special read-only attributes: ``start`` is the lower bound;
      ``stop`` is the upper bound; ``step`` is the step value; each is
      ``None`` if omitted. These attributes can have any type.

      Slice objects support one method:

      slice.indices(self, length)

         This method takes a single integer argument *length* and
         computes information about the extended slice that the slice
         object would describe if applied to a sequence of *length*
         items.  It returns a tuple of three integers; respectively
         these are the *start* and *stop* indices and the *step* or
         stride length of the slice. Missing or out-of-bounds indices
         are handled in a manner consistent with regular slices.

         New in version 2.3.

   Static method objects
      Static method objects provide a way of defeating the
      transformation of function objects to method objects described
      above. A static method object is a wrapper around any other
      object, usually a user-defined method object. When a static
      method object is retrieved from a class or a class instance, the
      object actually returned is the wrapped object, which is not
      subject to any further transformation. Static method objects are
      not themselves callable, although the objects they wrap usually
      are. Static method objects are created by the built-in
      ``staticmethod()`` constructor.

   Class method objects
      A class method object, like a static method object, is a wrapper
      around another object that alters the way in which that object
      is retrieved from classes and class instances. The behaviour of
      class method objects upon such retrieval is described above,
      under "User-defined methods". Class method objects are created
      by the built-in ``classmethod()`` constructor.

Related help topics: STRINGS, UNICODE, NUMBERS, SEQUENCES, MAPPINGS,
FUNCTIONS, CLASSES, MODULES, FILES, inspect

