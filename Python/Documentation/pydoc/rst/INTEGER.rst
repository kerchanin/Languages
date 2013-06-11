Integer and long integer literals
*********************************

Integer and long integer literals are described by the following
lexical definitions:

   longinteger    ::= integer ("l" | "L")
   integer        ::= decimalinteger | octinteger | hexinteger | bininteger
   decimalinteger ::= nonzerodigit digit* | "0"
   octinteger     ::= "0" ("o" | "O") octdigit+ | "0" octdigit+
   hexinteger     ::= "0" ("x" | "X") hexdigit+
   bininteger     ::= "0" ("b" | "B") bindigit+
   nonzerodigit   ::= "1"..."9"
   octdigit       ::= "0"..."7"
   bindigit       ::= "0" | "1"
   hexdigit       ::= digit | "a"..."f" | "A"..."F"

Although both lower case ``'l'`` and upper case ``'L'`` are allowed as
suffix for long integers, it is strongly recommended to always use
``'L'``, since the letter ``'l'`` looks too much like the digit
``'1'``.

Plain integer literals that are above the largest representable plain
integer (e.g., 2147483647 when using 32-bit arithmetic) are accepted
as if they were long integers instead. [1]  There is no limit for long
integer literals apart from what can be stored in available memory.

Some examples of plain integer literals (first row) and long integer
literals (second and third rows):

   7     2147483647                        0177
   3L    79228162514264337593543950336L    0377L   0x100000000L
         79228162514264337593543950336             0xdeadbeef

Related help topics: int, range

