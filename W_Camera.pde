class Camera {
  private final PVector positionInDisplay;
  private PVector position;
  private final float followMargin = 100.0;
  public  float Margin;
  float Xmargin;

  Camera(PVector position) {
    positionInDisplay = new PVector(width / 2, height / 2);
    this.position = position.copy();
  }

  void reset() {
    position.add(PVector.sub(player.position(), position).mult(0.05));
  }

  void update() {
    Xmargin= position.x-player.position().x;

    PVector playerPosition = player.position();
    if (position.x > playerPosition.x + followMargin) {
      position.x = playerPosition.x + followMargin;
    } else if (position.x < playerPosition.x - followMargin) {
      position.x = playerPosition.x - followMargin;
    }
    if (position.y > playerPosition.y + followMargin) {
      position.y = playerPosition.y + followMargin;
    } else if (position.y < playerPosition.y - followMargin) {
      position.y = playerPosition.y - followMargin;
    }


    printLinesArchive();
  }

  void mpfmftr() { //playing wallking "to-right" case of teleportation
    PVector playerPosition = player.position();
    position = new PVector(playerPosition.x+Xmargin, playerPosition.y-followMargin);
  }

  void mpfmftl() { //playing wallking "to-left" case of teleportation
    PVector playerPosition = player.position();
    position = new PVector( playerPosition.x+Xmargin, playerPosition.y-followMargin);
  }

  void apply() {
    PVector originInWorld = originInWorld();
    translate(-originInWorld.x, -originInWorld.y);
  }

  PVector originInWorld() {
    return PVector.sub(position, positionInDisplay);
  }

  PVector asWorld(PVector display) {
    return PVector.add(display, originInWorld());
  }

  PVector asDisplay(PVector world) {
    return PVector.sub(world, originInWorld());
  }

  PVector mouseInDisplay() {
    return new PVector(mouseX, mouseY);
  }

  PVector mouse() {
    return asWorld(mouseInDisplay());
  }

  void printLinesArchive() {
    //println("CameraPosition ", position.copy());
    //println(originInWorld());
  }
}