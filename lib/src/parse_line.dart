enum LineType {
  TN,
  SF,
  FN,
  FNDA,
  FNF,
  FHN,
  BRDA,
  BRF,
  BRH,
  DA,
  LF,
  LH,
}

LineType toLineType(String stringType) {
  return LineType.values.firstWhere(
    (type) => type.toString() == 'LineType.$stringType',
    orElse: () => null,
  );
}

class Line {
  LineType type;
  String data;

  Line({
    this.type,
    this.data,
  });
}

const endOfRecord = 'end_of_record';

class ParseLine {
  static bool isEndOfRecord(String type) {
    return type == endOfRecord;
  }

  static Line parse(String line) {
    final lineSplited = line.split(':');

    return Line(
      type: toLineType(lineSplited[0]),
      data: lineSplited[1],
    );
  }
}
