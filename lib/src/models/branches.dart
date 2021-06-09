class Branches {
  int line;
  int block;
  int branch;
  int taken;

  Branches({
    this.line,
    this.block,
    this.branch,
    this.taken,
  });
}

class LcovBranchesDetails {
  int found;
  int hit;
  List<Branches> details;

  LcovBranchesDetails({
    this.found,
    this.hit,
    this.details,
  });
}
