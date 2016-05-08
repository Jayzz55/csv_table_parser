# Table Parser

This is an implementation practice of adapter design patern that allows the user to choose an adapter for a rudimentary CSV parser.

The adapters list:
* `scan` : parses using the scan method with an appropriate regular expression. The regex delimiter searches for either anything that is not a comma or two consecutive commas
* `split` : parses using the split method with an appropirate regular expression.
