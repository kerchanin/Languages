Dictionary displays
*******************

A dictionary display is a possibly empty series of key/datum pairs
enclosed in curly braces:

   dict_display       ::= "{" [key_datum_list | dict_comprehension] "}"
   key_datum_list     ::= key_datum ("," key_datum)* [","]
   key_datum          ::= expression ":" expression
   dict_comprehension ::= expression ":" expression comp_for

A dictionary display yields a new dictionary object.

If a comma-separated sequence of key/datum pairs is given, they are
evaluated from left to right to define the entries of the dictionary:
each key object is used as a key into the dictionary to store the
corresponding datum.  This means that you can specify the same key
multiple times in the key/datum list, and the final dictionary's value
for that key will be the last one given.

A dict comprehension, in contrast to list and set comprehensions,
needs two expressions separated with a colon followed by the usual
"for" and "if" clauses. When the comprehension is run, the resulting
key and value elements are inserted in the new dictionary in the order
they are produced.

Restrictions on the types of the key values are listed earlier in
section *The standard type hierarchy*.  (To summarize, the key type
should be *hashable*, which excludes all mutable objects.)  Clashes
between duplicate keys are not detected; the last datum (textually
rightmost in the display) stored for a given key value prevails.

Related help topics: DICTIONARIES, LITERALS

