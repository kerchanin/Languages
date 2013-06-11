Customizing attribute access
****************************

The following methods can be defined to customize the meaning of
attribute access (use of, assignment to, or deletion of ``x.name``)
for class instances.

object.__getattr__(self, name)

   Called when an attribute lookup has not found the attribute in the
   usual places (i.e. it is not an instance attribute nor is it found
   in the class tree for ``self``).  ``name`` is the attribute name.
   This method should return the (computed) attribute value or raise
   an ``AttributeError`` exception.

   Note that if the attribute is found through the normal mechanism,
   ``__getattr__()`` is not called.  (This is an intentional asymmetry
   between ``__getattr__()`` and ``__setattr__()``.) This is done both
   for efficiency reasons and because otherwise ``__getattr__()``
   would have no way to access other attributes of the instance.  Note
   that at least for instance variables, you can fake total control by
   not inserting any values in the instance attribute dictionary (but
   instead inserting them in another object).  See the
   ``__getattribute__()`` method below for a way to actually get total
   control in new-style classes.

object.__setattr__(self, name, value)

   Called when an attribute assignment is attempted.  This is called
   instead of the normal mechanism (i.e. store the value in the
   instance dictionary).  *name* is the attribute name, *value* is the
   value to be assigned to it.

   If ``__setattr__()`` wants to assign to an instance attribute, it
   should not simply execute ``self.name = value`` --- this would
   cause a recursive call to itself.  Instead, it should insert the
   value in the dictionary of instance attributes, e.g.,
   ``self.__dict__[name] = value``.  For new-style classes, rather
   than accessing the instance dictionary, it should call the base
   class method with the same name, for example,
   ``object.__setattr__(self, name, value)``.

object.__delattr__(self, name)

   Like ``__setattr__()`` but for attribute deletion instead of
   assignment.  This should only be implemented if ``del obj.name`` is
   meaningful for the object.


More attribute access for new-style classes
===========================================

The following methods only apply to new-style classes.

object.__getattribute__(self, name)

   Called unconditionally to implement attribute accesses for
   instances of the class. If the class also defines
   ``__getattr__()``, the latter will not be called unless
   ``__getattribute__()`` either calls it explicitly or raises an
   ``AttributeError``. This method should return the (computed)
   attribute value or raise an ``AttributeError`` exception. In order
   to avoid infinite recursion in this method, its implementation
   should always call the base class method with the same name to
   access any attributes it needs, for example,
   ``object.__getattribute__(self, name)``.

   Note: This method may still be bypassed when looking up special methods
     as the result of implicit invocation via language syntax or
     built-in functions. See *Special method lookup for new-style
     classes*.


Implementing Descriptors
========================

The following methods only apply when an instance of the class
containing the method (a so-called *descriptor* class) appears in an
*owner* class (the descriptor must be in either the owner's class
dictionary or in the class dictionary for one of its parents).  In the
examples below, "the attribute" refers to the attribute whose name is
the key of the property in the owner class' ``__dict__``.

object.__get__(self, instance, owner)

   Called to get the attribute of the owner class (class attribute
   access) or of an instance of that class (instance attribute
   access). *owner* is always the owner class, while *instance* is the
   instance that the attribute was accessed through, or ``None`` when
   the attribute is accessed through the *owner*.  This method should
   return the (computed) attribute value or raise an
   ``AttributeError`` exception.

object.__set__(self, instance, value)

   Called to set the attribute on an instance *instance* of the owner
   class to a new value, *value*.

object.__delete__(self, instance)

   Called to delete the attribute on an instance *instance* of the
   owner class.


Invoking Descriptors
====================

In general, a descriptor is an object attribute with "binding
behavior", one whose attribute access has been overridden by methods
in the descriptor protocol:  ``__get__()``, ``__set__()``, and
``__delete__()``. If any of those methods are defined for an object,
it is said to be a descriptor.

The default behavior for attribute access is to get, set, or delete
the attribute from an object's dictionary. For instance, ``a.x`` has a
lookup chain starting with ``a.__dict__['x']``, then
``type(a).__dict__['x']``, and continuing through the base classes of
``type(a)`` excluding metaclasses.

However, if the looked-up value is an object defining one of the
descriptor methods, then Python may override the default behavior and
invoke the descriptor method instead.  Where this occurs in the
precedence chain depends on which descriptor methods were defined and
how they were called.  Note that descriptors are only invoked for new
style objects or classes (ones that subclass ``object()`` or
``type()``).

The starting point for descriptor invocation is a binding, ``a.x``.
How the arguments are assembled depends on ``a``:

Direct Call
   The simplest and least common call is when user code directly
   invokes a descriptor method:    ``x.__get__(a)``.

Instance Binding
   If binding to a new-style object instance, ``a.x`` is transformed
   into the call: ``type(a).__dict__['x'].__get__(a, type(a))``.

Class Binding
   If binding to a new-style class, ``A.x`` is transformed into the
   call: ``A.__dict__['x'].__get__(None, A)``.

Super Binding
   If ``a`` is an instance of ``super``, then the binding ``super(B,
   obj).m()`` searches ``obj.__class__.__mro__`` for the base class
   ``A`` immediately preceding ``B`` and then invokes the descriptor
   with the call: ``A.__dict__['m'].__get__(obj, obj.__class__)``.

For instance bindings, the precedence of descriptor invocation depends
on the which descriptor methods are defined.  A descriptor can define
any combination of ``__get__()``, ``__set__()`` and ``__delete__()``.
If it does not define ``__get__()``, then accessing the attribute will
return the descriptor object itself unless there is a value in the
object's instance dictionary.  If the descriptor defines ``__set__()``
and/or ``__delete__()``, it is a data descriptor; if it defines
neither, it is a non-data descriptor.  Normally, data descriptors
define both ``__get__()`` and ``__set__()``, while non-data
descriptors have just the ``__get__()`` method.  Data descriptors with
``__set__()`` and ``__get__()`` defined always override a redefinition
in an instance dictionary.  In contrast, non-data descriptors can be
overridden by instances.

Python methods (including ``staticmethod()`` and ``classmethod()``)
are implemented as non-data descriptors.  Accordingly, instances can
redefine and override methods.  This allows individual instances to
acquire behaviors that differ from other instances of the same class.

The ``property()`` function is implemented as a data descriptor.
Accordingly, instances cannot override the behavior of a property.


__slots__
=========

By default, instances of both old and new-style classes have a
dictionary for attribute storage.  This wastes space for objects
having very few instance variables.  The space consumption can become
acute when creating large numbers of instances.

The default can be overridden by defining *__slots__* in a new-style
class definition.  The *__slots__* declaration takes a sequence of
instance variables and reserves just enough space in each instance to
hold a value for each variable.  Space is saved because *__dict__* is
not created for each instance.

__slots__

   This class variable can be assigned a string, iterable, or sequence
   of strings with variable names used by instances.  If defined in a
   new-style class, *__slots__* reserves space for the declared
   variables and prevents the automatic creation of *__dict__* and
   *__weakref__* for each instance.

   New in version 2.2.

Notes on using *__slots__*

* When inheriting from a class without *__slots__*, the *__dict__*
  attribute of that class will always be accessible, so a *__slots__*
  definition in the subclass is meaningless.

* Without a *__dict__* variable, instances cannot be assigned new
  variables not listed in the *__slots__* definition.  Attempts to
  assign to an unlisted variable name raises ``AttributeError``. If
  dynamic assignment of new variables is desired, then add
  ``'__dict__'`` to the sequence of strings in the *__slots__*
  declaration.

  Changed in version 2.3: Previously, adding ``'__dict__'`` to the
  *__slots__* declaration would not enable the assignment of new
  attributes not specifically listed in the sequence of instance
  variable names.

* Without a *__weakref__* variable for each instance, classes defining
  *__slots__* do not support weak references to its instances. If weak
  reference support is needed, then add ``'__weakref__'`` to the
  sequence of strings in the *__slots__* declaration.

  Changed in version 2.3: Previously, adding ``'__weakref__'`` to the
  *__slots__* declaration would not enable support for weak
  references.

* *__slots__* are implemented at the class level by creating
  descriptors (*Implementing Descriptors*) for each variable name.  As
  a result, class attributes cannot be used to set default values for
  instance variables defined by *__slots__*; otherwise, the class
  attribute would overwrite the descriptor assignment.

* The action of a *__slots__* declaration is limited to the class
  where it is defined.  As a result, subclasses will have a *__dict__*
  unless they also define *__slots__* (which must only contain names
  of any *additional* slots).

* If a class defines a slot also defined in a base class, the instance
  variable defined by the base class slot is inaccessible (except by
  retrieving its descriptor directly from the base class). This
  renders the meaning of the program undefined.  In the future, a
  check may be added to prevent this.

* Nonempty *__slots__* does not work for classes derived from
  "variable-length" built-in types such as ``long``, ``str`` and
  ``tuple``.

* Any non-string iterable may be assigned to *__slots__*. Mappings may
  also be used; however, in the future, special meaning may be
  assigned to the values corresponding to each key.

* *__class__* assignment works only if both classes have the same
  *__slots__*.

  Changed in version 2.6: Previously, *__class__* assignment raised an
  error if either new or old class had *__slots__*.

Related help topics: ATTRIBUTES, SPECIALMETHODS

