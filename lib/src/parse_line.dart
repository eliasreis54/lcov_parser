import 'models/enum.dart';
import 'models/line.dart';

const endOfRecord = 'end_of_record';

class ParseLine {
  static bool isEndOfRecord(String type) {
    return type == endOfRecord;
  }

  static Line parse(String line) {
    final lineSplited = line.split(':');
    return Line(
      type: toLineType(lineSplited[0]),
      data: lineSplited[1].split(','),
    );
  }
}
