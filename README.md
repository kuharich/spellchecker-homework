# spellchecker-homework
Spell-checker

To complete the new spell-checking software, we need you to create its brain. The requirements for this version are listed below. If you have any questions about any part of the task, please let us know.

## Requirements
Using a language of your choice, write a function that implements the following pseudo-code signature:

<pre><code>String checkWord( String wordToCheck )</code></pre>

The function should behave as follows:

It will correct two kinds of errors on the incoming word and then return the corrected word:
It fixes bad casing.
“wetumpka” → “Wetumpka”
“paRNAssus” → “Parnassus”
It removes invalid repeating characters.
“tabble” → “table”
“rrreally” → “really”
If the incoming word is already correct, the function should return the original word.
If the incoming word is not correct and no correction can be found, the function should return the string “No Correction Found”.
The list of correct word spellings are in the dictionary file that is in this repo. (Uncompress the file before using it.) You don't need to perform corrections on any words not in this dictionary.
