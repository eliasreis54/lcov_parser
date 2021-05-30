import 'package:lcov_parser/src/models/branches.dart';
import 'package:lcov_parser/src/models/functions.dart';
import 'package:lcov_parser/src/models/lines.dart';

class Record {
  final String title;
  final String file;
  final LcovFunctionDetails functions;
  final LcovBranchesDetails branches;
  final LcovLinesDetails lines;

  Record({
    this.title,
    this.file,
    this.functions,
    this.branches,
    this.lines,
  });
}
