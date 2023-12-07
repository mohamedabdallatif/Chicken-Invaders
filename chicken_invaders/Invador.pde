class PInvader {
  PImage invader;

  public PInvader(String invPath) {
    this.invader = loadImage(invPath);
  }

  void display() {
    if (mouseX > 60 && mouseX < width - 60) {
      image(invader, mouseX, height - 100, 120, 200);
    } else if (mouseX <= 60) {
      image(invader, 60, height - 100, 120, 200);
    } else {
      image(invader, width - 60, height -100, 120, 200);
    }
  }
}
