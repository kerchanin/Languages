Emulating numeric types
***********************

The following methods can be defined to emulate numeric objects.
Methods corresponding to operations that are not supported by the
particular kind of number implemented (e.g., bitwise operations for
non-integral numbers) should be left undefined.

object.__add__(self, other)
object.__sub__(self, other)
object.__mul__(self, other)
object.__floordiv__(self, other)
object.__mod__(self, other)
object.__divmod__(self, other)
object.__pow__(self, other[, modulo])
object.__lshift__(self, other)
object.__rshift__(self, other)
object.__and__(self, other)
object.__xor__(self, other)
object.__or__(self, other)

   These methods are called to implement the binary arithmetic
   operations (``+``, ``-``, ``*``, ``//``, ``%``, ``divmod()``,
   ``pow()``, ``**``, ``<<``, ``>>``, ``&``, ``^``, ``|``).  For
   instance, to evaluate the expression ``x + y``, where *x* is an
   instance of a class that has an ``__add__()`` method,
   ``x.__add__(y)`` is called.  The ``__divmod__()`` method should be
   the equivalent to using ``__floordiv__()`` and ``__mod__()``; it
   should not be related to ``__truediv__()`` (described below).  Note
   that ``__pow__()`` should be defined to accept an optional third
   argument if the ternary version of the built-in ``pow()`` function
   is to be supported.

   If one of those methods does not support the operation with the
   supplied arguments, it should return ``NotImplemented``.

object.__div__(self, other)
object.__truediv__(self, other)

   The division operator (``/``) is implemented by these methods.  The
   ``__truediv__()`` method is used when ``__future__.division`` is in
   effect, otherwise ``__div__()`` is used.  If only one of these two
   methods is defined, the object will not support division in the
   alternate context; ``TypeError`` will be raised instead.

object.__radd__(self, other)
object.__rsub__(self, other)
object.__rmul__(self, other)
object.__rdiv__(self, other)
object.__rtruediv__(self, other)
object.__rfloordiv__(self, other)
object.__rmod__(self, other)
object.__rdivmod__(self, other)
object.__rpow__(self, other)
object.__rlshift__(self, other)
object.__rrshift__(self, other)
object.__rand__(self, other)
object.__rxor__(self, other)
object.__ror__(self, other)

   These methods are called to implement the binary arithmetic
   operations (``+``, ``-``, ``*``, ``/``, ``%``, ``divmod()``,
   ``pow()``, ``**``, ``<<``, ``>>``, ``&``, ``^``, ``|``) with
   reflected (swapped) operands.  These functions are only called if
   the left operand does not support the corresponding operation and
   the operands are of different types. [2] For instance, to evaluate
   the expression ``x - y``, where *y* is an instance of a class that
   has an ``__rsub__()`` method, ``y.__rsub__(x)`` is called if
   ``x.__sub__(y)`` returns *NotImplemented*.

   Note that ternary ``pow()`` will not try calling ``__rpow__()``
   (the coercion rules would become too complicated).

   Note: If the right operand's type is a subclass of the left operand's
     type and that subclass provides the reflected method for the
     operation, this method will be called before the left operand's
     non-reflected method.  This behavior allows subclasses to
     override their ancestors' operations.

object.__iadd__(self, other)
object.__isub__(self, other)
object.__imul__(self, other)
object.__idiv__(self, other)
object.__itruediv__(self, other)
object.__ifloordiv__(self, other)
object.__imod__(self, other)
object.__ipow__(self, other[, modulo])
object.__ilshift__(self, other)
object.__irshift__(self, other)
object.__iand__(self, other)
object.__ixor__(self, other)
object.__ior__(self, other)

   These methods are called to implement the augmented arithmetic
   assignments (``+=``, ``-=``, ``*=``, ``/=``, ``//=``, ``%=``,
   ``**=``, ``<<=``, ``>>=``, ``&=``, ``^=``, ``|=``).  These methods
   should attempt to do the operation in-place (modifying *self*) and
   return the result (which could be, but does not have to be,
   *self*).  If a specific method is not defined, the augmented
   assignment falls back to the normal methods.  For instance, to
   execute the statement ``x += y``, where *x* is an instance of a
   class that has an ``__iadd__()`` method, ``x.__iadd__(y)`` is
   called.  If *x* is an instance of a class that does not define a
   ``__iadd__()`` method, ``x.__add__(y)`` and ``y.__radd__(x)`` are
   considered, as with the evaluation of ``x + y``.

object.__neg__(self)
object.__pos__(self)
object.__abs__(self)
object.__invert__(self)

   Called to implement the unary arithmetic operations (``-``, ``+``,
   ``abs()`` and ``~``).

object.__complex__(self)
object.__int__(self)
object.__long__(self)
object.__float__(self)

   Called to implement the built-in functions ``complex()``,
   ``int()``, ``long()``, and ``float()``.  Should return a value of
   the appropriate type.

object.__oct__(self)
object.__hex__(self)

   Called to implement the built-in functions ``oct()`` and ``hex()``.
   Should return a string value.

object.__index__(self)

   Called to implement ``operator.index()``.  Also called whenever
   Python needs an integer object (such as in slicing).  Must return
   an integer (int or long).

   New in version 2.5.

object.__coerce__(self, other)

   Called to implement "mixed-mode" numeric arithmetic.  Should either
   return a 2-tuple containing *self* and *other* converted to a
   common numeric type, or ``None`` if conversion is impossible.  When
   the common type would be the type of ``other``, it is sufficient to
   return ``None``, since the interpreter will also ask the other
   object to attempt a coercion (but sometimes, if the implementation
   of the other type cannot be changed, it is useful to do the
   conversion to the other type here).  A return value of
   ``NotImplemented`` is equivalent to returning ``None``.

Related help topics: NUMBERS, AUGMENTEDASSIGNMENT, SPECIALMETHODS

