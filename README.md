# Lcov parser
[![Dart](https://github.com/eliasreis54/lcov_parser/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/eliasreis54/lcov_parser/actions/workflows/main.yml)

A simple lcov file parser implementation in Dart.

The lcov is used to get test coverage. It works as a front-end for [gcov](https://gcc.gnu.org/onlinedocs/gcc/Gcov.html) collecting the data and generating the coverage info.

This implementation translates the lcov format to Dart classes we can understand and use the coverage info for a lot of proposals.

### How to use

To use it is very simple, this package exports the `model` of the record and the `parser` class, and you will receive from the return of the parser is a list of record. 
As you can see in the code below

```dart
import 'package:lcov_parser/lcov_parser.dart';

void main() async {
    final file = 'absolute path from lcov.info file';
    final records = await Parser.parse(file);
}
```

Another option is to parse records from a list of strings:
```dart
void main() {
  final lines = [
    'SF:lib/src/interceptors/app_version_interceptor.dart',
    'DA:6,1',
    'DA:11,1',
    // ...more lines here
    'end_of_record',
  ];
  final records = Parser.parseLines(lines);
}
```

You also will find a script example in the `example/main.dart` file.

### How to contribute with the project.

Feel free to open issues in this repository or open your pull request.

#### Running the tests

In the root path

```
dart test
```
