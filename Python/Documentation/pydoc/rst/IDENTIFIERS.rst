Identifiers and keywords
************************

Identifiers (also referred to as *names*) are described by the
following lexical definitions:

   identifier ::= (letter|"_") (letter | digit | "_")*
   letter     ::= lowercase | uppercase
   lowercase  ::= "a"..."z"
   uppercase  ::= "A"..."Z"
   digit      ::= "0"..."9"

Identifiers are unlimited in length.  Case is significant.


Keywords
========

The following identifiers are used as reserved words, or *keywords* of
the language, and cannot be used as ordinary identifiers.  They must
be spelled exactly as written here:

   and       del       from      not       while
   as        elif      global    or        with
   assert    else      if        pass      yield
   break     except    import    print
   class     exec      in        raise
   continue  finally   is        return
   def       for       lambda    try

Changed in version 2.4: ``None`` became a constant and is now
recognized by the compiler as a name for the built-in object ``None``.
Although it is not a keyword, you cannot assign a different object to
it.

Changed in version 2.5: Using ``as`` and ``with`` as identifiers
triggers a warning.  To use them as keywords, enable the
``with_statement`` future feature .

Changed in version 2.6: ``as`` and ``with`` are full keywords.


Reserved classes of identifiers
===============================

Certain classes of identifiers (besides keywords) have special
meanings.  These classes are identified by the patterns of leading and
trailing underscore characters:

``_*``
   Not imported by ``from module import *``.  The special identifier
   ``_`` is used in the interactive interpreter to store the result of
   the last evaluation; it is stored in the ``__builtin__`` module.
   When not in interactive mode, ``_`` has no special meaning and is
   not defined. See section *The import statement*.

   Note: The name ``_`` is often used in conjunction with
     internationalization; refer to the documentation for the
     ``gettext`` module for more information on this convention.

``__*__``
   System-defined names. These names are defined by the interpreter
   and its implementation (including the standard library).  Current
   system names are discussed in the *Special method names* section
   and elsewhere.  More will likely be defined in future versions of
   Python.  *Any* use of ``__*__`` names, in any context, that does
   not follow explicitly documented use, is subject to breakage
   without warning.

``__*``
   Class-private names.  Names in this category, when used within the
   context of a class definition, are re-written to use a mangled form
   to help avoid name clashes between "private" attributes of base and
   derived classes. See section *Identifiers (Names)*.

Related help topics: keywords, SPECIALIDENTIFIERS

