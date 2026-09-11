class Enemy
{
  float x;
  float y;
  float speed;
  PImage alienImg;
  String url = "https://png.pngtree.com/png-vector/20220623/ourmid/pngtree-space-invaders-character-game-play-png-image_5173025.png";
  Enemy(float xPos, float yPos)
  {
    x = xPos;
    y = yPos;
    speed = 1;
    alienImg = loadImage(url, "png");
  }
  void create()
  {
    imageMode(CENTER);
    image(alienImg, x,y, 75,75);
  }
  void move()
  {
    if(x >= width - 30)
    {
      speed *= -1;
    }
    else if(x <= 30)
    {
      speed *= -1;
    }
    x += speed;
  }
  boolean overlaps(Bullet bullet)
  {
    if(x == bullet.x && y == alien.y)
    {
      return true;
    }
    return false;
  }
}
