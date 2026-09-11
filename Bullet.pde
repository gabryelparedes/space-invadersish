class Bullet 
{
  float x; 
  float y;
  float speed;
  
  PImage bulletImg;
  
  Bullet(float xPos, float yPos)
  {
    x = xPos;
    y = yPos;
    speed = 8;
  }
  
  Bullet(float xPos, float yPos, float speed)
  {
    x = xPos;
    y = yPos;
    this.speed = speed;
  }
  
  void create()
  {
    rect(x,y,10,60);
  }
  
  void move()
  {
    y -= speed;
  }
  void moveDown()
  {
    y += speed;
  }
  
  
  boolean overlaps(Enemy alien)
  {
    boolean overlapped = dist(x,y, alien.x,alien.y) <= 30;
    return overlapped;
  }
  boolean overlaps(Player player)
  {
    boolean overlapped = dist(x,y, player.x,player.y) <= 110;
    return overlapped;
  }
}
