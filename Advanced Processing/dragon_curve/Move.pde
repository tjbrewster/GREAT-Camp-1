class Move {
  float xdir;
  float ydir;

  Move(float startxdir, float startydir) {
    xdir=startxdir;
    ydir=startydir;
  }

  Move rotated() {
    return new Move(-ydir, xdir);
  }




}
