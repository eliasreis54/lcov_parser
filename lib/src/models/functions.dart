class Functions {
  String? name;
  int? line;
  int? hit;

  Functions({
    this.name,
    this.line,
    this.hit,
  });
}

class LcovFunctionDetails {
  int? found;
  int? hit;
  List<Functions>? details;

  LcovFunctionDetails({
    this.found,
    this.hit,
    this.details,
  });
}
