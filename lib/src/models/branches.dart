class Branches {
  final int line;
  final int block;
  final int branch;
  final int taken;

  Branches({
    this.line,
    this.block,
    this.branch,
    this.taken,
  });
}

class LcovBranchesDetails {
  final int found;
  final int hit;
  final List<Branches> details;

  LcovBranchesDetails({
    this.found,
    this.hit,
    this.details,
  });
}
