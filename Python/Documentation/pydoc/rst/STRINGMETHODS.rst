String Methods
**************

Below are listed the string methods which both 8-bit strings and
Unicode objects support.  Some of them are also available on
``bytearray`` objects.

In addition, Python's strings support the sequence type methods
described in the *Sequence Types --- str, unicode, list, tuple,
bytearray, buffer, xrange* section. To output formatted strings use
template strings or the ``%`` operator described in the *String
Formatting Operations* section. Also, see the ``re`` module for string
functions based on regular expressions.

str.capitalize()

   Return a copy of the string with its first character capitalized
   and the rest lowercased.

   For 8-bit strings, this method is locale-dependent.

str.center(width[, fillchar])

   Return centered in a string of length *width*. Padding is done
   using the specified *fillchar* (default is a space).

   Changed in version 2.4: Support for the *fillchar* argument.

str.count(sub[, start[, end]])

   Return the number of non-overlapping occurrences of substring *sub*
   in the range [*start*, *end*].  Optional arguments *start* and
   *end* are interpreted as in slice notation.

str.decode([encoding[, errors]])

   Decodes the string using the codec registered for *encoding*.
   *encoding* defaults to the default string encoding.  *errors* may
   be given to set a different error handling scheme.  The default is
   ``'strict'``, meaning that encoding errors raise ``UnicodeError``.
   Other possible values are ``'ignore'``, ``'replace'`` and any other
   name registered via ``codecs.register_error()``, see section *Codec
   Base Classes*.

   New in version 2.2.

   Changed in version 2.3: Support for other error handling schemes
   added.

   Changed in version 2.7: Support for keyword arguments added.

str.encode([encoding[, errors]])

   Return an encoded version of the string.  Default encoding is the
   current default string encoding.  *errors* may be given to set a
   different error handling scheme.  The default for *errors* is
   ``'strict'``, meaning that encoding errors raise a
   ``UnicodeError``.  Other possible values are ``'ignore'``,
   ``'replace'``, ``'xmlcharrefreplace'``, ``'backslashreplace'`` and
   any other name registered via ``codecs.register_error()``, see
   section *Codec Base Classes*. For a list of possible encodings, see
   section *Standard Encodings*.

   New in version 2.0.

   Changed in version 2.3: Support for ``'xmlcharrefreplace'`` and
   ``'backslashreplace'`` and other error handling schemes added.

   Changed in version 2.7: Support for keyword arguments added.

str.endswith(suffix[, start[, end]])

   Return ``True`` if the string ends with the specified *suffix*,
   otherwise return ``False``.  *suffix* can also be a tuple of
   suffixes to look for.  With optional *start*, test beginning at
   that position.  With optional *end*, stop comparing at that
   position.

   Changed in version 2.5: Accept tuples as *suffix*.

str.expandtabs([tabsize])

   Return a copy of the string where all tab characters are replaced
   by one or more spaces, depending on the current column and the
   given tab size.  The column number is reset to zero after each
   newline occurring in the string. If *tabsize* is not given, a tab
   size of ``8`` characters is assumed.  This doesn't understand other
   non-printing characters or escape sequences.

str.find(sub[, start[, end]])

   Return the lowest index in the string where substring *sub* is
   found, such that *sub* is contained in the slice ``s[start:end]``.
   Optional arguments *start* and *end* are interpreted as in slice
   notation.  Return ``-1`` if *sub* is not found.

   Note: The ``find()`` method should be used only if you need to know the
     position of *sub*.  To check if *sub* is a substring or not, use
     the ``in`` operator:

        >>> 'Py' in 'Python'
        True

str.format(*args, **kwargs)

   Perform a string formatting operation.  The string on which this
   method is called can contain literal text or replacement fields
   delimited by braces ``{}``.  Each replacement field contains either
   the numeric index of a positional argument, or the name of a
   keyword argument.  Returns a copy of the string where each
   replacement field is replaced with the string value of the
   corresponding argument.

   >>> "The sum of 1 + 2 is {0}".format(1+2)
   'The sum of 1 + 2 is 3'

   See *Format String Syntax* for a description of the various
   formatting options that can be specified in format strings.

   This method of string formatting is the new standard in Python 3.0,
   and should be preferred to the ``%`` formatting described in
   *String Formatting Operations* in new code.

   New in version 2.6.

str.index(sub[, start[, end]])

   Like ``find()``, but raise ``ValueError`` when the substring is not
   found.

str.isalnum()

   Return true if all characters in the string are alphanumeric and
   there is at least one character, false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.isalpha()

   Return true if all characters in the string are alphabetic and
   there is at least one character, false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.isdigit()

   Return true if all characters in the string are digits and there is
   at least one character, false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.islower()

   Return true if all cased characters [4] in the string are lowercase
   and there is at least one cased character, false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.isspace()

   Return true if there are only whitespace characters in the string
   and there is at least one character, false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.istitle()

   Return true if the string is a titlecased string and there is at
   least one character, for example uppercase characters may only
   follow uncased characters and lowercase characters only cased ones.
   Return false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.isupper()

   Return true if all cased characters [4] in the string are uppercase
   and there is at least one cased character, false otherwise.

   For 8-bit strings, this method is locale-dependent.

str.join(iterable)

   Return a string which is the concatenation of the strings in the
   *iterable* *iterable*.  The separator between elements is the
   string providing this method.

str.ljust(width[, fillchar])

   Return the string left justified in a string of length *width*.
   Padding is done using the specified *fillchar* (default is a
   space).  The original string is returned if *width* is less than or
   equal to ``len(s)``.

   Changed in version 2.4: Support for the *fillchar* argument.

str.lower()

   Return a copy of the string with all the cased characters [4]
   converted to lowercase.

   For 8-bit strings, this method is locale-dependent.

str.lstrip([chars])

   Return a copy of the string with leading characters removed.  The
   *chars* argument is a string specifying the set of characters to be
   removed.  If omitted or ``None``, the *chars* argument defaults to
   removing whitespace.  The *chars* argument is not a prefix; rather,
   all combinations of its values are stripped:

   >>> '   spacious   '.lstrip()
   'spacious   '
   >>> 'www.example.com'.lstrip('cmowz.')
   'example.com'

   Changed in version 2.2.2: Support for the *chars* argument.

str.partition(sep)

   Split the string at the first occurrence of *sep*, and return a
   3-tuple containing the part before the separator, the separator
   itself, and the part after the separator.  If the separator is not
   found, return a 3-tuple containing the string itself, followed by
   two empty strings.

   New in version 2.5.

str.replace(old, new[, count])

   Return a copy of the string with all occurrences of substring *old*
   replaced by *new*.  If the optional argument *count* is given, only
   the first *count* occurrences are replaced.

str.rfind(sub[, start[, end]])

   Return the highest index in the string where substring *sub* is
   found, such that *sub* is contained within ``s[start:end]``.
   Optional arguments *start* and *end* are interpreted as in slice
   notation.  Return ``-1`` on failure.

str.rindex(sub[, start[, end]])

   Like ``rfind()`` but raises ``ValueError`` when the substring *sub*
   is not found.

str.rjust(width[, fillchar])

   Return the string right justified in a string of length *width*.
   Padding is done using the specified *fillchar* (default is a
   space). The original string is returned if *width* is less than or
   equal to ``len(s)``.

   Changed in version 2.4: Support for the *fillchar* argument.

str.rpartition(sep)

   Split the string at the last occurrence of *sep*, and return a
   3-tuple containing the part before the separator, the separator
   itself, and the part after the separator.  If the separator is not
   found, return a 3-tuple containing two empty strings, followed by
   the string itself.

   New in version 2.5.

str.rsplit([sep[, maxsplit]])

   Return a list of the words in the string, using *sep* as the
   delimiter string. If *maxsplit* is given, at most *maxsplit* splits
   are done, the *rightmost* ones.  If *sep* is not specified or
   ``None``, any whitespace string is a separator.  Except for
   splitting from the right, ``rsplit()`` behaves like ``split()``
   which is described in detail below.

   New in version 2.4.

str.rstrip([chars])

   Return a copy of the string with trailing characters removed.  The
   *chars* argument is a string specifying the set of characters to be
   removed.  If omitted or ``None``, the *chars* argument defaults to
   removing whitespace.  The *chars* argument is not a suffix; rather,
   all combinations of its values are stripped:

   >>> '   spacious   '.rstrip()
   '   spacious'
   >>> 'mississippi'.rstrip('ipz')
   'mississ'

   Changed in version 2.2.2: Support for the *chars* argument.

str.split([sep[, maxsplit]])

   Return a list of the words in the string, using *sep* as the
   delimiter string.  If *maxsplit* is given, at most *maxsplit*
   splits are done (thus, the list will have at most ``maxsplit+1``
   elements).  If *maxsplit* is not specified, then there is no limit
   on the number of splits (all possible splits are made).

   If *sep* is given, consecutive delimiters are not grouped together
   and are deemed to delimit empty strings (for example,
   ``'1,,2'.split(',')`` returns ``['1', '', '2']``).  The *sep*
   argument may consist of multiple characters (for example,
   ``'1<>2<>3'.split('<>')`` returns ``['1', '2', '3']``). Splitting
   an empty string with a specified separator returns ``['']``.

   If *sep* is not specified or is ``None``, a different splitting
   algorithm is applied: runs of consecutive whitespace are regarded
   as a single separator, and the result will contain no empty strings
   at the start or end if the string has leading or trailing
   whitespace.  Consequently, splitting an empty string or a string
   consisting of just whitespace with a ``None`` separator returns
   ``[]``.

   For example, ``' 1  2   3  '.split()`` returns ``['1', '2', '3']``,
   and ``'  1  2   3  '.split(None, 1)`` returns ``['1', '2   3  ']``.

str.splitlines([keepends])

   Return a list of the lines in the string, breaking at line
   boundaries.  Line breaks are not included in the resulting list
   unless *keepends* is given and true.

str.startswith(prefix[, start[, end]])

   Return ``True`` if string starts with the *prefix*, otherwise
   return ``False``. *prefix* can also be a tuple of prefixes to look
   for.  With optional *start*, test string beginning at that
   position.  With optional *end*, stop comparing string at that
   position.

   Changed in version 2.5: Accept tuples as *prefix*.

str.strip([chars])

   Return a copy of the string with the leading and trailing
   characters removed. The *chars* argument is a string specifying the
   set of characters to be removed. If omitted or ``None``, the
   *chars* argument defaults to removing whitespace. The *chars*
   argument is not a prefix or suffix; rather, all combinations of its
   values are stripped:

   >>> '   spacious   '.strip()
   'spacious'
   >>> 'www.example.com'.strip('cmowz.')
   'example'

   Changed in version 2.2.2: Support for the *chars* argument.

str.swapcase()

   Return a copy of the string with uppercase characters converted to
   lowercase and vice versa.

   For 8-bit strings, this method is locale-dependent.

str.title()

   Return a titlecased version of the string where words start with an
   uppercase character and the remaining characters are lowercase.

   The algorithm uses a simple language-independent definition of a
   word as groups of consecutive letters.  The definition works in
   many contexts but it means that apostrophes in contractions and
   possessives form word boundaries, which may not be the desired
   result:

      >>> "they're bill's friends from the UK".title()
      "They'Re Bill'S Friends From The Uk"

   A workaround for apostrophes can be constructed using regular
   expressions:

      >>> import re
      >>> def titlecase(s):
              return re.sub(r"[A-Za-z]+('[A-Za-z]+)?",
                            lambda mo: mo.group(0)[0].upper() +
                                       mo.group(0)[1:].lower(),
                            s)

      >>> titlecase("they're bill's friends.")
      "They're Bill's Friends."

   For 8-bit strings, this method is locale-dependent.

str.translate(table[, deletechars])

   Return a copy of the string where all characters occurring in the
   optional argument *deletechars* are removed, and the remaining
   characters have been mapped through the given translation table,
   which must be a string of length 256.

   You can use the ``maketrans()`` helper function in the ``string``
   module to create a translation table. For string objects, set the
   *table* argument to ``None`` for translations that only delete
   characters:

   >>> 'read this short text'.translate(None, 'aeiou')
   'rd ths shrt txt'

   New in version 2.6: Support for a ``None`` *table* argument.

   For Unicode objects, the ``translate()`` method does not accept the
   optional *deletechars* argument.  Instead, it returns a copy of the
   *s* where all characters have been mapped through the given
   translation table which must be a mapping of Unicode ordinals to
   Unicode ordinals, Unicode strings or ``None``. Unmapped characters
   are left untouched. Characters mapped to ``None`` are deleted.
   Note, a more flexible approach is to create a custom character
   mapping codec using the ``codecs`` module (see ``encodings.cp1251``
   for an example).

str.upper()

   Return a copy of the string with all the cased characters [4]
   converted to uppercase.  Note that ``str.upper().isupper()`` might
   be ``False`` if ``s`` contains uncased characters or if the Unicode
   category of the resulting character(s) is not "Lu" (Letter,
   uppercase), but e.g. "Lt" (Letter, titlecase).

   For 8-bit strings, this method is locale-dependent.

str.zfill(width)

   Return the numeric string left filled with zeros in a string of
   length *width*.  A sign prefix is handled correctly.  The original
   string is returned if *width* is less than or equal to ``len(s)``.

   New in version 2.2.2.

The following methods are present only on unicode objects:

unicode.isnumeric()

   Return ``True`` if there are only numeric characters in S,
   ``False`` otherwise. Numeric characters include digit characters,
   and all characters that have the Unicode numeric value property,
   e.g. U+2155, VULGAR FRACTION ONE FIFTH.

unicode.isdecimal()

   Return ``True`` if there are only decimal characters in S,
   ``False`` otherwise. Decimal characters include digit characters,
   and all characters that can be used to form decimal-radix numbers,
   e.g. U+0660, ARABIC-INDIC DIGIT ZERO.

Related help topics: STRINGS, FORMATTING

