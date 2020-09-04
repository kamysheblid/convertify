# convertify
### _Kamy Sheblid <kamysheblid@gmail.com>_

This package is built to turn arrays, characters, strings, symbols, numbers, arrays, and lists into each other.

## License

GPLv3 license. See LICENSE file for more information.

## TODO

* When converting a symbol to a list, sometimes it returns chars and sometimes it returns numbers. (convert '123 'list) => (1 2 3) but (convert 'a123 'list) => (#\a #\1 #\2 #\3).

I could add an optional parameter to handle this so user can say whether it should be char or num, but it can also be handled by turning the number into a string, (convert "123" 'list) => (#\1 #\2 #\3).

The benefit of adding an optional parameter will be so that (convert "123" 'list 'number) => (1 2 3) instead of a list of characters.

There is an easy workaround though, as we can just (mapcar #'numberify numbers-as-char-list.

* When converting to number or string, if I pass a list or array then all the elements must be single digits as chars, numbers, or strings. If they arent then current implementation cannot handle it.

This can be fixed by flattening the list/array.

* When converting an array/list of symbols into something else, it will capitalize those symbols and it will never turn them into a sequence of characters. This is a gotcha/bug.
