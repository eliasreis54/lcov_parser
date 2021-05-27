class Functions {
  String name;
  int line;
  int hit;

  Functions({
    this.name,
    this.line,
    this.hit,
  });
}

class LcovFunctionDetails {
  final int found;
  final int hit;
  final List<Functions> details;

  LcovFunctionDetails({
    this.found,
    this.hit,
    this.details,
  });
}
