class Lines {
  final int line;
  final int hit;

  Lines({
    this.line,
    this.hit,
  });
}

class LcovLinesDetails {
  final int found;
  final int hit;
  final List<Lines> details;

  LcovLinesDetails({
    this.found,
    this.hit,
    this.details,
  });
}
