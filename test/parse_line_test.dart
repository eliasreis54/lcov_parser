import 'package:lcov_parser/src/models/enum.dart';
import 'package:lcov_parser/src/parse_line.dart';
import 'package:test/test.dart';

void main() {
  test('Should parse correct LineType enum when value came from string', () {
    expect(toLineType('TN'), LineType.TN);
    expect(toLineType('SF'), LineType.SF);
    expect(toLineType('FN'), LineType.FN);
    expect(toLineType('FNDA'), LineType.FNDA);
    expect(toLineType('FNF'), LineType.FNF);
    expect(toLineType('FHN'), LineType.FHN);
    expect(toLineType('BRDA'), LineType.BRDA);
    expect(toLineType('BRF'), LineType.BRF);
    expect(toLineType('BRH'), LineType.BRH);
    expect(toLineType('DA'), LineType.DA);
    expect(toLineType('LF'), LineType.LF);
    expect(toLineType('LH'), LineType.LH);
  });

  test('Should have the correct end of record', () {
    expect(endOfRecord, 'end_of_record');
  });

  test('Should return true when is endOfRecord', () {
    expect(ParseLine.isEndOfRecord('end_of_record'), true);
  });

  test('Should return false when is endOfRecord', () {
    expect(ParseLine.isEndOfRecord('LN'), false);
  });

  test('Should parse line correct', () {
    final line = 'FN:12';

    final parsed = ParseLine.parse(line);

    expect(parsed.type, LineType.FN);
    expect(parsed.data, ['12']);
  });
}
