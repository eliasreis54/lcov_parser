import 'package:lcov_parser/src/models/enum.dart';
import 'package:lcov_parser/src/models/functions.dart';
import 'package:lcov_parser/src/models/line.dart';
import 'package:lcov_parser/src/models/record.dart';
import 'package:lcov_parser/src/transformer.dart';
import 'package:test/test.dart';

void main() {
  final data = ['1'];

  test('Should transform LineType.TN', () {
    final line = Line(type: LineType.TN, data: data);
    final record = Record.empty();

    expect(record.title, null);

    Transformer.transform(record, line);

    expect(record.title, data[0]);
  });

  test('Should transform LineType.SF', () {
    final line = Line(type: LineType.SF, data: data);
    final record = Record.empty();

    expect(record.file, null);

    Transformer.transform(record, line);

    expect(record.file, data[0]);
  });

  test('Should transform LineType.FN', () {
    final fn = ['1', 'fn'];
    final line = Line(type: LineType.FN, data: fn);
    final record = Record.empty();

    expect(record.functions.details, []);

    Transformer.transform(record, line);

    expect(record.functions.details.length, 1);
  });

  test('Should transform LineType.FNDA', () {
    final fnOne = ['1', 'fn'];
    final lineOne = Line(type: LineType.FNDA, data: fnOne);
    final record = Record.empty();

    record.functions.details.add(
      Functions(hit: 0, name: fnOne[1]),
    );

    Transformer.transform(record, lineOne);

    expect(record.functions.details[0].hit, 1);

    final fnTwo = ['2', 'fnTwo'];
    final lineTwo = Line(type: LineType.FNDA, data: fnTwo);
    Transformer.transform(record, lineTwo);

    expect(record.functions.details[0].hit, 1);
  });

  test('Should transform LineType.FNF', () {
    final line = Line(type: LineType.FNF, data: data);
    final record = Record.empty();

    expect(record.functions.found, null);

    Transformer.transform(record, line);

    expect(record.functions.found, 1);
  });

  test('Should transform LineType.FHN', () {
    final line = Line(type: LineType.FHN, data: data);
    final record = Record.empty();

    expect(record.functions.hit, null);

    Transformer.transform(record, line);

    expect(record.functions.hit, 1);
  });

  test('Should transform LineType.BRDA', () {
    final fnOne = ['1', '2', '3', '-'];
    final lineOne = Line(type: LineType.BRDA, data: fnOne);
    final record = Record.empty();

    expect(record.branches.details, []);

    Transformer.transform(record, lineOne);

    expect(record.branches.details[0].line, 1);
    expect(record.branches.details[0].block, 2);
    expect(record.branches.details[0].branch, 3);
    expect(record.branches.details[0].taken, 0);

    final fnTwo = ['4', '5', '6', '7'];
    final lineTwo = Line(type: LineType.BRDA, data: fnTwo);

    Transformer.transform(record, lineTwo);
    expect(record.branches.details[1].line, 4);
    expect(record.branches.details[1].block, 5);
    expect(record.branches.details[1].branch, 6);
    expect(record.branches.details[1].taken, 7);
  });

  test('Should transform LineType.BRF', () {
    final line = Line(type: LineType.BRF, data: data);
    final record = Record.empty();

    expect(record.branches.found, null);

    Transformer.transform(record, line);

    expect(record.branches.found, 1);
  });

  test('Should transform LineType.BRH', () {
    final line = Line(type: LineType.BRH, data: data);
    final record = Record.empty();

    expect(record.branches.hit, null);

    Transformer.transform(record, line);

    expect(record.branches.hit, 1);
  });

  test('Should transform LineType.DA', () {
    final line = Line(type: LineType.DA, data: ['1', '2']);
    final record = Record.empty();

    expect(record.lines.details, []);

    Transformer.transform(record, line);

    expect(record.lines.details.length, 1);
  });

  test('Should transform LineType.LF', () {
    final line = Line(type: LineType.LF, data: data);
    final record = Record.empty();

    expect(record.lines.found, null);

    Transformer.transform(record, line);

    expect(record.lines.found, 1);
  });

  test('Should transform LineType.LH', () {
    final line = Line(type: LineType.LH, data: data);
    final record = Record.empty();

    expect(record.lines.hit, null);

    Transformer.transform(record, line);

    expect(record.lines.hit, 1);
  });
}
