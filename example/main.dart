import 'package:args/args.dart';
import 'package:lcov_parser/lcov_parser.dart';

void main(List<String> args) async {
  final parser = ArgParser();

  parser.addOption('file');

  final arguments = parser.parse(args);

  final file = arguments['file'] ?? '';
  try {
    final records = await Parser.parse(file);

    var totalHits = 0;
    var totalFinds = 0;
    records.forEach((rec) {
      totalFinds += rec.lines?.found ?? 0;
      totalHits += rec.lines?.hit ?? 0;
    });

    final coverage = (totalHits / totalFinds) * 100;
    print('Total coverage is : $coverage');
  } on FileMustBeProvided {
    print('You need provide a file to parse');
  } catch (e) {
    print(e);
  }
}
