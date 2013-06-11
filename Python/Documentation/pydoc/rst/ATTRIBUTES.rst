Attribute references
********************

An attribute reference is a primary followed by a period and a name:

   attributeref ::= primary "." identifier

The primary must evaluate to an object of a type that supports
attribute references, e.g., a module, list, or an instance.  This
object is then asked to produce the attribute whose name is the
identifier.  If this attribute is not available, the exception
``AttributeError`` is raised. Otherwise, the type and value of the
object produced is determined by the object.  Multiple evaluations of
the same attribute reference may yield different objects.

Related help topics: getattr, hasattr, setattr, ATTRIBUTEMETHODS

