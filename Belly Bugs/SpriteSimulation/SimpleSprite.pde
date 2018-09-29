import processing.core.PImage;

/**
 * CLASS FOR INTERNAL USE ONLY <br>
 * 
 * used to remember the details about the image to prevent multiple copies
 * of same image being loaded and stored.
 * 
 * @author Peter Lager
 *
 */
class ImageInfo {
  public int nbrRows;
  public int nbrCols;
  public PImage image;
  public PImage alphaMask;

  /**
   * INTERNAL USE ONLY
   * @param img
   * @param c
   * @param r
   */
  public ImageInfo(PImage img, int c, int r) {
    image = img;
    alphaMask = null;
    nbrRows = r;
    nbrCols = c;
  }

  /**
   * INTERNAL USE ONLY
   * @param img
   * @param mask
   * @param c
   * @param r
   */
  public ImageInfo(PImage img, PImage mask, int c, int r) {
    image = img;
    alphaMask = mask;
    nbrRows = r;
    nbrCols = c;
  }
}

// A sprite holds a sequence of images that are drawn for animation. The sprite should be in a single image with
// an alpha channel.
// Collisions happen by first checking for bounding box overlap and then checking for overlapped non-transparent pixels

class SimpleSprite {
  // This is really the only part of the sprite that is important for use. It holds the position of the sprite
  public PVector pos;


  PImage[] frames;    // The actual images
  PImage[] aframes;   // Some collision stuff 
  int frameCurrent;
  int maxFrames;
  int width, height, halfHeight, halfWidth, colRadius;
  int hit_x, hit_y;
  int[] nbrPixels = null;

  //-------------------------------------------
  //CONSTRUCTOR
  //-------------------------------------------
  // The constructor. Takes in a position, a sprite sheet filename and the layout of the sprite
  SimpleSprite(int initialX, int initialY, String imageFileName, int numberOfCols, int numberOfRows) {
    // Set the initial position
    pos = new PVector(initialX, initialY );

    // load in the image
    PImage image = loadImage(imageFileName);
    ImageInfo info = new ImageInfo(image, numberOfCols, numberOfRows);
    int nframes = info.nbrCols * info.nbrRows;
    frames = new PImage[nframes];
    int dw = info.image.width / info.nbrCols;
    int dh = info.image.height / info.nbrRows;
    int fn = 0;
    for (int y = 0; y < info.nbrRows; y++) {
      for (int x = 0; x < info.nbrCols; x++) {
        frames[fn] = new PImage(dw, dh, ARGB);
        frames[fn].copy(info.image, x*dw, y*dh, dw, dh, 0, 0, dw, dh);
        fn++;
      }
    }
    width = frames[0].width;
    height = frames[0].height;
    // Next are used in collision detection
    halfWidth = width/2;
    halfHeight = height/2;
    colRadius = (width + height)/4;

    // see if there is an alpha mask for collision
    if (info.alphaMask != null) {
      aframes = makeAlphaMaskFrames(info, dw, dh);
      int afn = 0;
      for (int i = 0; i < frames.length; i++) {
        frames[i].loadPixels();
        aframes[afn].loadPixels();
        for (int p = 0; p < frames[i].pixels.length; p++) {
          frames[i].pixels[p] &= 0x00ffffff;
          frames[i].pixels[p] |= (aframes[afn].pixels[p] << 24);
        }
        frames[i].updatePixels();
        afn = (afn + 1)%aframes.length;
      }
    }
    frameCurrent = 0;
    maxFrames = nframes;
  }

  //----------------------------------------
  //DISPLAY
  //----------------------------------------
  // Draw the sprite and update the frame sequence
  void display() {
    image( frames[frameCurrent], pos.x, pos.y );
    frameCurrent = (frameCurrent + 1)%maxFrames;
  }


  //----------------------------------------------
  //COLLISION DETECTION
  //----------------------------------------------
  // Pixel-level collision between this and spriteB
  boolean collision(SimpleSprite spriteB) {
    int topA, botA, leftA, rightA;
    int topB, botB, leftB, rightB;
    int topO, botO, leftO, rightO;
    int ax, ay;
    int bx, by;
    int APx, APy, ASx, ASy;
    @SuppressWarnings("unused")
      int BPx, BPy, BSx, BSy;

    //    if(!visible || !spriteB.visible) return false;

    topA   = (int) (pos.y - halfHeight);
    botA   = (int) (pos.y + halfHeight);
    leftA  = (int) (pos.x - halfWidth);
    rightA = (int) (pos.x + halfWidth);
    topB   = (int) (spriteB.pos.y - spriteB.halfHeight);
    botB   = (int) (spriteB.pos.y + spriteB.halfHeight);
    leftB  = (int) (spriteB.pos.x - spriteB.halfWidth);
    rightB = (int) (spriteB.pos.x + spriteB.halfWidth);
    //  System.out.println("A " + topA + " " + botA);
    //  System.out.println("B " + topB + " " + botB);
    if (botA <= topB  || botB <= topA || rightA <= leftB || rightB <= leftA)
      return false;

    // If we get here, we know that there is an overlap
    // So we work out where the sides of the overlap are
    leftO = (leftA < leftB) ? leftB : leftA;
    rightO = (rightA > rightB) ? rightB : rightA;
    botO = (botA > botB) ? botB : botA;
    topO = (topA < topB) ? topB : topA;


    // P is the top-left, S is the bottom-right of the overlap
    APx = leftO-leftA;   
    APy = topO-topA;
    ASx = rightO-leftA;  
    ASy = botO-topA-1;
    BPx = leftO-leftB;   
    BPy = topO-topB;
    BSx = rightO-leftB;  
    BSy = botO-topB-1;

    int widthO = rightO - leftO;
    boolean foundCollision = false;

    // Images to test
    PImage imgA = frames[frameCurrent];
    PImage imgB = spriteB.frames[spriteB.frameCurrent];
    // loadPixels
    imgA.loadPixels();
    imgB.loadPixels();

    // These are widths in BYTES. They are used inside the loop
    //  to avoid the need to do the slow multiplications
    int surfaceWidthA = frames[frameCurrent].width;
    int surfaceWidthB = spriteB.frames[spriteB.frameCurrent].width;

    boolean pixelAtransparent = true;
    boolean pixelBtransparent = true;

    // Get start pixel positions
    int pA = (APy * surfaceWidthA) + APx;
    int pB = (BPy * surfaceWidthB) + BPx;

    ax = APx; 
    ay = APy;
    bx = BPx; 
    by = BPy;
    for (ay = APy; ay < ASy; ay++) {
      bx = BPx;
      for (ax = APx; ax < ASx; ax++) {
        pixelAtransparent = alpha(imgA.pixels[pA]) < 100;
        pixelBtransparent = alpha(imgB.pixels[pB]) < 100;

        if (!pixelAtransparent && !pixelBtransparent) {
          hit_x = ax;
          hit_y = ay;
          spriteB.hit_x = bx;
          spriteB.hit_y = by;
          foundCollision = true;
          break;
        }
        pA ++;
        pB ++;
        bx++;
      }
      if (foundCollision) break;
      pA = pA + surfaceWidthA - widthO;
      pB = pB + surfaceWidthB - widthO;
      by++;
    }
    return foundCollision;
  }


  // Internal code for collision
  PImage[] makeAlphaMaskFrames(ImageInfo info, int dw, int dh) {
    int a, r, g, b;

    info.alphaMask.loadPixels();
    int[] org = info.alphaMask.pixels;
    int[] p = new int[org.length];
    for (int i = 0; i < p.length; i++) {
      b = org[i] & 0xff;
      g = (org[i] >> 8) & 0xff;
      r = (org[i] >> 16) & 0xff;
      a = (r+g+b)/3;
      p[i] = a; // << 24;
    }
    // Calculate number of alpha masks based on the main image height and width
    int cols = info.alphaMask.width / dw;
    int rows = info.alphaMask.height / dh;
    int nframes = cols * rows;
    PImage[] aframes = new PImage[nframes];
    int fn = 0;
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        aframes[fn] = new PImage(dw, dh, ARGB);
        aframes[fn].copy(info.alphaMask, x*dw, y*dh, dw, dh, 0, 0, dw, dh);
        fn++;
      }
    }
    return aframes;
  }

  //----------------------------------------
  //MOVE RANDOMLY
  //----------------------------------------
  // Allow for random movement of the sprite
  void move(int speed) {
    int dir = (int)random(0, 4);
    if ( dir == 0 ) {
      pos.x += speed;
    }
    if ( dir == 1 ) {
      pos.x -= speed;
    }
    if ( dir == 2 ) {
      pos.y += speed;
    }
    if ( dir == 3 ) {
      pos.y -= speed;
    }
  }
}