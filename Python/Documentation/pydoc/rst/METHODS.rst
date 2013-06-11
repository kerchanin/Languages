Methods
*******

Methods are functions that are called using the attribute notation.
There are two flavors: built-in methods (such as ``append()`` on
lists) and class instance methods.  Built-in methods are described
with the types that support them.

The implementation adds two special read-only attributes to class
instance methods: ``m.im_self`` is the object on which the method
operates, and ``m.im_func`` is the function implementing the method.
Calling ``m(arg-1, arg-2, ..., arg-n)`` is completely equivalent to
calling ``m.im_func(m.im_self, arg-1, arg-2, ..., arg-n)``.

Class instance methods are either *bound* or *unbound*, referring to
whether the method was accessed through an instance or a class,
respectively.  When a method is unbound, its ``im_self`` attribute
will be ``None`` and if called, an explicit ``self`` object must be
passed as the first argument.  In this case, ``self`` must be an
instance of the unbound method's class (or a subclass of that class),
otherwise a ``TypeError`` is raised.

Like function objects, methods objects support getting arbitrary
attributes. However, since method attributes are actually stored on
the underlying function object (``meth.im_func``), setting method
attributes on either bound or unbound methods is disallowed.
Attempting to set a method attribute results in a ``TypeError`` being
raised.  In order to set a method attribute, you need to explicitly
set it on the underlying function object:

   class C:
       def method(self):
           pass

   c = C()
   c.method.im_func.whoami = 'my name is c'

See *The standard type hierarchy* for more information.

Related help topics: class, def, CLASSES, TYPES

