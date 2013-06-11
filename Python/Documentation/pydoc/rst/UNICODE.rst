String literals
***************

String literals are described by the following lexical definitions:

   stringliteral   ::= [stringprefix](shortstring | longstring)
   stringprefix    ::= "r" | "u" | "ur" | "R" | "U" | "UR" | "Ur" | "uR"
                    | "b" | "B" | "br" | "Br" | "bR" | "BR"
   shortstring     ::= "'" shortstringitem* "'" | '"' shortstringitem* '"'
   longstring      ::= "'''" longstringitem* "'''"
                  | '"""' longstringitem* '"""'
   shortstringitem ::= shortstringchar | escapeseq
   longstringitem  ::= longstringchar | escapeseq
   shortstringchar ::= <any source character except "\" or newline or the quote>
   longstringchar  ::= <any source character except "\">
   escapeseq       ::= "\" <any ASCII character>

One syntactic restriction not indicated by these productions is that
whitespace is not allowed between the ``stringprefix`` and the rest of
the string literal. The source character set is defined by the
encoding declaration; it is ASCII if no encoding declaration is given
in the source file; see section *Encoding declarations*.

In plain English: String literals can be enclosed in matching single
quotes (``'``) or double quotes (``"``).  They can also be enclosed in
matching groups of three single or double quotes (these are generally
referred to as *triple-quoted strings*).  The backslash (``\``)
character is used to escape characters that otherwise have a special
meaning, such as newline, backslash itself, or the quote character.
String literals may optionally be prefixed with a letter ``'r'`` or
``'R'``; such strings are called *raw strings* and use different rules
for interpreting backslash escape sequences.  A prefix of ``'u'`` or
``'U'`` makes the string a Unicode string.  Unicode strings use the
Unicode character set as defined by the Unicode Consortium and ISO
10646.  Some additional escape sequences, described below, are
available in Unicode strings. A prefix of ``'b'`` or ``'B'`` is
ignored in Python 2; it indicates that the literal should become a
bytes literal in Python 3 (e.g. when code is automatically converted
with 2to3).  A ``'u'`` or ``'b'`` prefix may be followed by an ``'r'``
prefix.

In triple-quoted strings, unescaped newlines and quotes are allowed
(and are retained), except that three unescaped quotes in a row
terminate the string.  (A "quote" is the character used to open the
string, i.e. either ``'`` or ``"``.)

Unless an ``'r'`` or ``'R'`` prefix is present, escape sequences in
strings are interpreted according to rules similar to those used by
Standard C.  The recognized escape sequences are:

+-------------------+-----------------------------------+---------+
| Escape Sequence   | Meaning                           | Notes   |
+===================+===================================+=========+
| ``\newline``      | Ignored                           |         |
+-------------------+-----------------------------------+---------+
| ``\\``            | Backslash (``\``)                 |         |
+-------------------+-----------------------------------+---------+
| ``\'``            | Single quote (``'``)              |         |
+-------------------+-----------------------------------+---------+
| ``\"``            | Double quote (``"``)              |         |
+-------------------+-----------------------------------+---------+
| ``\a``            | ASCII Bell (BEL)                  |         |
+-------------------+-----------------------------------+---------+
| ``\b``            | ASCII Backspace (BS)              |         |
+-------------------+-----------------------------------+---------+
| ``\f``            | ASCII Formfeed (FF)               |         |
+-------------------+-----------------------------------+---------+
| ``\n``            | ASCII Linefeed (LF)               |         |
+-------------------+-----------------------------------+---------+
| ``\N{name}``      | Character named *name* in the     |         |
|                   | Unicode database (Unicode only)   |         |
+-------------------+-----------------------------------+---------+
| ``\r``            | ASCII Carriage Return (CR)        |         |
+-------------------+-----------------------------------+---------+
| ``\t``            | ASCII Horizontal Tab (TAB)        |         |
+-------------------+-----------------------------------+---------+
| ``\uxxxx``        | Character with 16-bit hex value   | (1)     |
|                   | *xxxx* (Unicode only)             |         |
+-------------------+-----------------------------------+---------+
| ``\Uxxxxxxxx``    | Character with 32-bit hex value   | (2)     |
|                   | *xxxxxxxx* (Unicode only)         |         |
+-------------------+-----------------------------------+---------+
| ``\v``            | ASCII Vertical Tab (VT)           |         |
+-------------------+-----------------------------------+---------+
| ``\ooo``          | Character with octal value *ooo*  | (3,5)   |
+-------------------+-----------------------------------+---------+
| ``\xhh``          | Character with hex value *hh*     | (4,5)   |
+-------------------+-----------------------------------+---------+

Notes:

1. Individual code units which form parts of a surrogate pair can be
   encoded using this escape sequence.

2. Any Unicode character can be encoded this way, but characters
   outside the Basic Multilingual Plane (BMP) will be encoded using a
   surrogate pair if Python is compiled to use 16-bit code units (the
   default).  Individual code units which form parts of a surrogate
   pair can be encoded using this escape sequence.

3. As in Standard C, up to three octal digits are accepted.

4. Unlike in Standard C, exactly two hex digits are required.

5. In a string literal, hexadecimal and octal escapes denote the byte
   with the given value; it is not necessary that the byte encodes a
   character in the source character set. In a Unicode literal, these
   escapes denote a Unicode character with the given value.

Unlike Standard C, all unrecognized escape sequences are left in the
string unchanged, i.e., *the backslash is left in the string*.  (This
behavior is useful when debugging: if an escape sequence is mistyped,
the resulting output is more easily recognized as broken.)  It is also
important to note that the escape sequences marked as "(Unicode only)"
in the table above fall into the category of unrecognized escapes for
non-Unicode string literals.

When an ``'r'`` or ``'R'`` prefix is present, a character following a
backslash is included in the string without change, and *all
backslashes are left in the string*.  For example, the string literal
``r"\n"`` consists of two characters: a backslash and a lowercase
``'n'``.  String quotes can be escaped with a backslash, but the
backslash remains in the string; for example, ``r"\""`` is a valid
string literal consisting of two characters: a backslash and a double
quote; ``r"\"`` is not a valid string literal (even a raw string
cannot end in an odd number of backslashes).  Specifically, *a raw
string cannot end in a single backslash* (since the backslash would
escape the following quote character).  Note also that a single
backslash followed by a newline is interpreted as those two characters
as part of the string, *not* as a line continuation.

When an ``'r'`` or ``'R'`` prefix is used in conjunction with a
``'u'`` or ``'U'`` prefix, then the ``\uXXXX`` and ``\UXXXXXXXX``
escape sequences are processed while  *all other backslashes are left
in the string*. For example, the string literal ``ur"\u0062\n"``
consists of three Unicode characters: 'LATIN SMALL LETTER B', 'REVERSE
SOLIDUS', and 'LATIN SMALL LETTER N'. Backslashes can be escaped with
a preceding backslash; however, both remain in the string.  As a
result, ``\uXXXX`` escape sequences are only recognized when there are
an odd number of backslashes.

Related help topics: encodings, unicode, SEQUENCES, STRINGMETHODS,
FORMATTING, TYPES

