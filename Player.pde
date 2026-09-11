class Player 
{
  float size;
  float x;
  float y;
  float speed;
  
  PImage playerImg;
  
  String url = "https://preview.redd.it/yct20hubfk061.png?auto=webp&s=32226b397578b664ed794b64938ce40adf3298fe";
  
  boolean goingLeft;
  boolean goingRight;
  boolean clicked;
  
  Player(float posX, float posY)
  {
    x = posX;
    y = posY;
    //size = 250;
    playerImg = loadImage("playerImg.png");
    goingLeft = false;
    goingRight = false;
    speed = 10;
  }
  void create()
  {
    image(playerImg, x,y, 200,200);
  }
  void move()
  {
    if(goingLeft)
    {
      if(x >= 100)
      {
        x -= speed;
      }
    }
    if(goingRight)
    {
      if(x <= width - 101)
      {
        //System.out.println("a");
        x += speed;
      }
    }
  }
}
