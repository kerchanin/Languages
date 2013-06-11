Mutable Sequence Types
**********************

List and ``bytearray`` objects support additional operations that
allow in-place modification of the object. Other mutable sequence
types (when added to the language) should also support these
operations. Strings and tuples are immutable sequence types: such
objects cannot be modified once created. The following operations are
defined on mutable sequence types (where *x* is an arbitrary object):

+--------------------------------+----------------------------------+-----------------------+
| Operation                      | Result                           | Notes                 |
+================================+==================================+=======================+
| ``s[i] = x``                   | item *i* of *s* is replaced by   |                       |
|                                | *x*                              |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s[i:j] = t``                 | slice of *s* from *i* to *j* is  |                       |
|                                | replaced by the contents of the  |                       |
|                                | iterable *t*                     |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``del s[i:j]``                 | same as ``s[i:j] = []``          |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s[i:j:k] = t``               | the elements of ``s[i:j:k]`` are | (1)                   |
|                                | replaced by those of *t*         |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``del s[i:j:k]``               | removes the elements of          |                       |
|                                | ``s[i:j:k]`` from the list       |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s.append(x)``                | same as ``s[len(s):len(s)] =     | (2)                   |
|                                | [x]``                            |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s.extend(x)``                | same as ``s[len(s):len(s)] = x`` | (3)                   |
+--------------------------------+----------------------------------+-----------------------+
| ``s.count(x)``                 | return number of *i*'s for which |                       |
|                                | ``s[i] == x``                    |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s.index(x[, i[, j]])``       | return smallest *k* such that    | (4)                   |
|                                | ``s[k] == x`` and ``i <= k < j`` |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s.insert(i, x)``             | same as ``s[i:i] = [x]``         | (5)                   |
+--------------------------------+----------------------------------+-----------------------+
| ``s.pop([i])``                 | same as ``x = s[i]; del s[i];    | (6)                   |
|                                | return x``                       |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s.remove(x)``                | same as ``del s[s.index(x)]``    | (4)                   |
+--------------------------------+----------------------------------+-----------------------+
| ``s.reverse()``                | reverses the items of *s* in     | (7)                   |
|                                | place                            |                       |
+--------------------------------+----------------------------------+-----------------------+
| ``s.sort([cmp[, key[,          | sort the items of *s* in place   | (7)(8)(9)(10)         |
| reverse]]])``                  |                                  |                       |
+--------------------------------+----------------------------------+-----------------------+

Notes:

1. *t* must have the same length as the slice it is  replacing.

2. The C implementation of Python has historically accepted multiple
   parameters and implicitly joined them into a tuple; this no longer
   works in Python 2.0.  Use of this misfeature has been deprecated
   since Python 1.4.

3. *x* can be any iterable object.

4. Raises ``ValueError`` when *x* is not found in *s*. When a negative
   index is passed as the second or third parameter to the ``index()``
   method, the list length is added, as for slice indices.  If it is
   still negative, it is truncated to zero, as for slice indices.

   Changed in version 2.3: Previously, ``index()`` didn't have
   arguments for specifying start and stop positions.

5. When a negative index is passed as the first parameter to the
   ``insert()`` method, the list length is added, as for slice
   indices.  If it is still negative, it is truncated to zero, as for
   slice indices.

   Changed in version 2.3: Previously, all negative indices were
   truncated to zero.

6. The ``pop()`` method is only supported by the list and array types.
   The optional argument *i* defaults to ``-1``, so that by default
   the last item is removed and returned.

7. The ``sort()`` and ``reverse()`` methods modify the list in place
   for economy of space when sorting or reversing a large list.  To
   remind you that they operate by side effect, they don't return the
   sorted or reversed list.

8. The ``sort()`` method takes optional arguments for controlling the
   comparisons.

   *cmp* specifies a custom comparison function of two arguments (list
   items) which should return a negative, zero or positive number
   depending on whether the first argument is considered smaller than,
   equal to, or larger than the second argument: ``cmp=lambda x,y:
   cmp(x.lower(), y.lower())``.  The default value is ``None``.

   *key* specifies a function of one argument that is used to extract
   a comparison key from each list element: ``key=str.lower``.  The
   default value is ``None``.

   *reverse* is a boolean value.  If set to ``True``, then the list
   elements are sorted as if each comparison were reversed.

   In general, the *key* and *reverse* conversion processes are much
   faster than specifying an equivalent *cmp* function.  This is
   because *cmp* is called multiple times for each list element while
   *key* and *reverse* touch each element only once.  Use
   ``functools.cmp_to_key()`` to convert an old-style *cmp* function
   to a *key* function.

   Changed in version 2.3: Support for ``None`` as an equivalent to
   omitting *cmp* was added.

   Changed in version 2.4: Support for *key* and *reverse* was added.

9. Starting with Python 2.3, the ``sort()`` method is guaranteed to be
   stable.  A sort is stable if it guarantees not to change the
   relative order of elements that compare equal --- this is helpful
   for sorting in multiple passes (for example, sort by department,
   then by salary grade).

10. **CPython implementation detail:** While a list is being sorted,
    the effect of attempting to mutate, or even inspect, the list is
    undefined.  The C implementation of Python 2.3 and newer makes the
    list appear empty for the duration, and raises ``ValueError`` if
    it can detect that the list has been mutated during a sort.

Related help topics: LISTLITERALS

