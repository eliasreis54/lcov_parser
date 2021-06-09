class Lines {
  int line;
  int hit;

  Lines({
    this.line,
    this.hit,
  });
}

class LcovLinesDetails {
  int found;
  int hit;
  List<Lines> details;

  LcovLinesDetails({
    this.found,
    this.hit,
    this.details,
  });
}
