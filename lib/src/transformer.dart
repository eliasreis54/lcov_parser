import 'models/branches.dart';
import 'models/enum.dart';
import 'models/functions.dart';
import 'models/line.dart';
import 'models/lines.dart';
import 'models/record.dart';

class Transformer {
  static void transform(Record record, Line line) {
    switch (line.type) {
      case LineType.TN:
        record.title = line.data[0];
        break;
      case LineType.SF:
        record.file = line.data[0];
        break;
      case LineType.FN:
        final fn = Functions(
          name: line.data[1].toString(),
          line: int.parse(line.data[0]),
        );
        record.functions.details.add(fn);
        break;
      case LineType.FNDA:
        final hit = line.data[0];
        final name = line.data[1].toString();
        record.functions.details.map((fn) {
          if (fn.name == name) {
            fn.hit = int.parse(hit);
          }
        });
        break;
      case LineType.FNF:
        record.functions.found = int.parse(line.data[0]);
        break;
      case LineType.FHN:
        record.functions.hit = int.parse(line.data[0]);
        break;
      case LineType.BRDA:
        final ln = int.parse(line.data[0]);
        final block = int.parse(line.data[0]);
        final branch = int.parse(line.data[0]);
        final taken = line.data[0].toString();
        record.branches.details.add(
          Branches(
            line: ln,
            block: block,
            branch: branch,
            taken: taken == '-' ? 0 : int.parse(taken),
          ),
        );
        break;
      case LineType.BRF:
        record.branches.found = int.parse(line.data[0]);
        break;
      case LineType.BRH:
        record.branches.hit = int.parse(line.data[0]);
        break;
      case LineType.DA:
        final ln = int.parse(line.data[0]);
        final hit = int.parse(line.data[1]);
        record.lines.details.add(
          Lines(line: ln, hit: hit),
        );
        break;
      case LineType.LF:
        record.lines.found = int.parse(line.data[0]);
        break;
      case LineType.LH:
        record.lines.hit = int.parse(line.data[0]);
        break;
    }
  }
}
