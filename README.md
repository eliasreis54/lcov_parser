# Lcov parser

A simple dart implementation to parser lcov file.

The lcov is very used to get coverage of projects. It works as a front-end from [gcov](https://gcc.gnu.org/onlinedocs/gcc/Gcov.html) collecting the data and generating the coverage info.

This implementation in dart translate de lcov format to couple of classes we can understanding and use the coverage info for a lot of proposals.

### How to use

To use it is very simples, this package exports the `model` of the record and the `parser` class, and you will receive from the return of the parser is a list of record. 
As you can see in the code below

```
import 'package:lcov_parser/lcov_parser.dart';

void main() async {
    final file = 'absolute path from lcov.info file';
    List<Record> records = await Parser.parse(file);
}
```

You also will find a script example in the `main.dart` file.

### How to contribute with the project.

Feel free to open issues in this repository or open your pull request. 

#### Running the tests

In the root path

```
dart test ./lib/tests
```


ted from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
