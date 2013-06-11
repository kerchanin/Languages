Mapping Types --- ``dict``
**************************

A *mapping* object maps *hashable* values to arbitrary objects.
Mappings are mutable objects.  There is currently only one standard
mapping type, the *dictionary*.  (For other containers see the built
in ``list``, ``set``, and ``tuple`` classes, and the ``collections``
module.)

A dictionary's keys are *almost* arbitrary values.  Values that are
not *hashable*, that is, values containing lists, dictionaries or
other mutable types (that are compared by value rather than by object
identity) may not be used as keys.  Numeric types used for keys obey
the normal rules for numeric comparison: if two numbers compare equal
(such as ``1`` and ``1.0``) then they can be used interchangeably to
index the same dictionary entry.  (Note however, that since computers
store floating-point numbers as approximations it is usually unwise to
use them as dictionary keys.)

Dictionaries can be created by placing a comma-separated list of
``key: value`` pairs within braces, for example: ``{'jack': 4098,
'sjoerd': 4127}`` or ``{4098: 'jack', 4127: 'sjoerd'}``, or by the
``dict`` constructor.

class class dict([arg])

   Return a new dictionary initialized from an optional positional
   argument or from a set of keyword arguments. If no arguments are
   given, return a new empty dictionary. If the positional argument
   *arg* is a mapping object, return a dictionary mapping the same
   keys to the same values as does the mapping object. Otherwise the
   positional argument must be a sequence, a container that supports
   iteration, or an iterator object.  The elements of the argument
   must each also be of one of those kinds, and each must in turn
   contain exactly two objects. The first is used as a key in the new
   dictionary, and the second as the key's value.  If a given key is
   seen more than once, the last value associated with it is retained
   in the new dictionary.

   If keyword arguments are given, the keywords themselves with their
   associated values are added as items to the dictionary. If a key is
   specified both in the positional argument and as a keyword
   argument, the value associated with the keyword is retained in the
   dictionary. For example, these all return a dictionary equal to
   ``{"one": 1, "two": 2}``:

   * ``dict(one=1, two=2)``

   * ``dict({'one': 1, 'two': 2})``

   * ``dict(zip(('one', 'two'), (1, 2)))``

   * ``dict([['two', 2], ['one', 1]])``

   The first example only works for keys that are valid Python
   identifiers; the others work with any valid keys.

   New in version 2.2.

   Changed in version 2.3: Support for building a dictionary from
   keyword arguments added.

   These are the operations that dictionaries support (and therefore,
   custom mapping types should support too):

   len(d)

      Return the number of items in the dictionary *d*.

   d[key]

      Return the item of *d* with key *key*.  Raises a ``KeyError`` if
      *key* is not in the map.

      New in version 2.5: If a subclass of dict defines a method
      ``__missing__()``, if the key *key* is not present, the
      ``d[key]`` operation calls that method with the key *key* as
      argument.  The ``d[key]`` operation then returns or raises
      whatever is returned or raised by the ``__missing__(key)`` call
      if the key is not present. No other operations or methods invoke
      ``__missing__()``. If ``__missing__()`` is not defined,
      ``KeyError`` is raised.  ``__missing__()`` must be a method; it
      cannot be an instance variable. For an example, see
      ``collections.defaultdict``.

   d[key] = value

      Set ``d[key]`` to *value*.

   del d[key]

      Remove ``d[key]`` from *d*.  Raises a ``KeyError`` if *key* is
      not in the map.

   key in d

      Return ``True`` if *d* has a key *key*, else ``False``.

      New in version 2.2.

   key not in d

      Equivalent to ``not key in d``.

      New in version 2.2.

   iter(d)

      Return an iterator over the keys of the dictionary.  This is a
      shortcut for ``iterkeys()``.

   clear()

      Remove all items from the dictionary.

   copy()

      Return a shallow copy of the dictionary.

   fromkeys(seq[, value])

      Create a new dictionary with keys from *seq* and values set to
      *value*.

      ``fromkeys()`` is a class method that returns a new dictionary.
      *value* defaults to ``None``.

      New in version 2.3.

   get(key[, default])

      Return the value for *key* if *key* is in the dictionary, else
      *default*. If *default* is not given, it defaults to ``None``,
      so that this method never raises a ``KeyError``.

   has_key(key)

      Test for the presence of *key* in the dictionary.  ``has_key()``
      is deprecated in favor of ``key in d``.

   items()

      Return a copy of the dictionary's list of ``(key, value)``
      pairs.

      **CPython implementation detail:** Keys and values are listed in
      an arbitrary order which is non-random, varies across Python
      implementations, and depends on the dictionary's history of
      insertions and deletions.

      If ``items()``, ``keys()``, ``values()``, ``iteritems()``,
      ``iterkeys()``, and ``itervalues()`` are called with no
      intervening modifications to the dictionary, the lists will
      directly correspond.  This allows the creation of ``(value,
      key)`` pairs using ``zip()``: ``pairs = zip(d.values(),
      d.keys())``.  The same relationship holds for the ``iterkeys()``
      and ``itervalues()`` methods: ``pairs = zip(d.itervalues(),
      d.iterkeys())`` provides the same value for ``pairs``. Another
      way to create the same list is ``pairs = [(v, k) for (k, v) in
      d.iteritems()]``.

   iteritems()

      Return an iterator over the dictionary's ``(key, value)`` pairs.
      See the note for ``dict.items()``.

      Using ``iteritems()`` while adding or deleting entries in the
      dictionary may raise a ``RuntimeError`` or fail to iterate over
      all entries.

      New in version 2.2.

   iterkeys()

      Return an iterator over the dictionary's keys.  See the note for
      ``dict.items()``.

      Using ``iterkeys()`` while adding or deleting entries in the
      dictionary may raise a ``RuntimeError`` or fail to iterate over
      all entries.

      New in version 2.2.

   itervalues()

      Return an iterator over the dictionary's values.  See the note
      for ``dict.items()``.

      Using ``itervalues()`` while adding or deleting entries in the
      dictionary may raise a ``RuntimeError`` or fail to iterate over
      all entries.

      New in version 2.2.

   keys()

      Return a copy of the dictionary's list of keys.  See the note
      for ``dict.items()``.

   pop(key[, default])

      If *key* is in the dictionary, remove it and return its value,
      else return *default*.  If *default* is not given and *key* is
      not in the dictionary, a ``KeyError`` is raised.

      New in version 2.3.

   popitem()

      Remove and return an arbitrary ``(key, value)`` pair from the
      dictionary.

      ``popitem()`` is useful to destructively iterate over a
      dictionary, as often used in set algorithms.  If the dictionary
      is empty, calling ``popitem()`` raises a ``KeyError``.

   setdefault(key[, default])

      If *key* is in the dictionary, return its value.  If not, insert
      *key* with a value of *default* and return *default*.  *default*
      defaults to ``None``.

   update([other])

      Update the dictionary with the key/value pairs from *other*,
      overwriting existing keys.  Return ``None``.

      ``update()`` accepts either another dictionary object or an
      iterable of key/value pairs (as tuples or other iterables of
      length two).  If keyword arguments are specified, the dictionary
      is then updated with those key/value pairs: ``d.update(red=1,
      blue=2)``.

      Changed in version 2.4: Allowed the argument to be an iterable
      of key/value pairs and allowed keyword arguments.

   values()

      Return a copy of the dictionary's list of values.  See the note
      for ``dict.items()``.

   viewitems()

      Return a new view of the dictionary's items (``(key, value)``
      pairs).  See below for documentation of view objects.

      New in version 2.7.

   viewkeys()

      Return a new view of the dictionary's keys.  See below for
      documentation of view objects.

      New in version 2.7.

   viewvalues()

      Return a new view of the dictionary's values.  See below for
      documentation of view objects.

      New in version 2.7.


Dictionary view objects
=======================

The objects returned by ``dict.viewkeys()``, ``dict.viewvalues()`` and
``dict.viewitems()`` are *view objects*.  They provide a dynamic view
on the dictionary's entries, which means that when the dictionary
changes, the view reflects these changes.

Dictionary views can be iterated over to yield their respective data,
and support membership tests:

len(dictview)

   Return the number of entries in the dictionary.

iter(dictview)

   Return an iterator over the keys, values or items (represented as
   tuples of ``(key, value)``) in the dictionary.

   Keys and values are iterated over in an arbitrary order which is
   non-random, varies across Python implementations, and depends on
   the dictionary's history of insertions and deletions. If keys,
   values and items views are iterated over with no intervening
   modifications to the dictionary, the order of items will directly
   correspond.  This allows the creation of ``(value, key)`` pairs
   using ``zip()``: ``pairs = zip(d.values(), d.keys())``.  Another
   way to create the same list is ``pairs = [(v, k) for (k, v) in
   d.items()]``.

   Iterating views while adding or deleting entries in the dictionary
   may raise a ``RuntimeError`` or fail to iterate over all entries.

x in dictview

   Return ``True`` if *x* is in the underlying dictionary's keys,
   values or items (in the latter case, *x* should be a ``(key,
   value)`` tuple).

Keys views are set-like since their entries are unique and hashable.
If all values are hashable, so that (key, value) pairs are unique and
hashable, then the items view is also set-like.  (Values views are not
treated as set-like since the entries are generally not unique.)  Then
these set operations are available ("other" refers either to another
view or a set):

dictview & other

   Return the intersection of the dictview and the other object as a
   new set.

dictview | other

   Return the union of the dictview and the other object as a new set.

dictview - other

   Return the difference between the dictview and the other object
   (all elements in *dictview* that aren't in *other*) as a new set.

dictview ^ other

   Return the symmetric difference (all elements either in *dictview*
   or *other*, but not in both) of the dictview and the other object
   as a new set.

An example of dictionary view usage:

   >>> dishes = {'eggs': 2, 'sausage': 1, 'bacon': 1, 'spam': 500}
   >>> keys = dishes.viewkeys()
   >>> values = dishes.viewvalues()

   >>> # iteration
   >>> n = 0
   >>> for val in values:
   ...     n += val
   >>> print(n)
   504

   >>> # keys and values are iterated over in the same order
   >>> list(keys)
   ['eggs', 'bacon', 'sausage', 'spam']
   >>> list(values)
   [2, 1, 1, 500]

   >>> # view objects are dynamic and reflect dict changes
   >>> del dishes['eggs']
   >>> del dishes['sausage']
   >>> list(keys)
   ['spam', 'bacon']

   >>> # set operations
   >>> keys & {'eggs', 'bacon', 'salad'}
   {'bacon'}

Related help topics: DICTIONARYLITERALS

