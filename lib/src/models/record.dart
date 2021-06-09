import 'package:lcov_parser/src/models/branches.dart';
import 'package:lcov_parser/src/models/functions.dart';
import 'package:lcov_parser/src/models/lines.dart';

class Record {
  String title;
  String file;
  LcovFunctionDetails functions;
  LcovBranchesDetails branches;
  LcovLinesDetails lines;

  Record({
    this.title,
    this.file,
    this.functions,
    this.branches,
    this.lines,
  });

  factory Record.empty() {
    final functionsDetails = LcovFunctionDetails(details: []);
    final branchesDetails = LcovBranchesDetails(details: []);
    final linesDetails = LcovLinesDetails(details: []);

    final rec = Record(
      functions: functionsDetails,
      branches: branchesDetails,
      lines: linesDetails,
    );

    return rec;
  }
}
