//Initializing all of my instance variables
Player player;
Bullet bullet;
Enemy alien;

ArrayList<Bullet> bullets;
ArrayList<Bullet> alienBullets;
ArrayList<Enemy> aliens;
ArrayList<Player> playerArr;

PImage explosionImg;
String explosionUrl = "https://t3.ftcdn.net/jpg/05/97/86/76/360_F_597867638_VvSFczTqjzu0T0LUfu4575ZHfivEatLm.png";

PImage brimg;
String brUrl = "https://i.imgur.com/bOWJi0l.jpeg";

boolean gameOver = false;
int numAliens = 1;
int score;

int numBullets;
void setup()
{
  //Sets size of window
  size(1000, 1080);

  player = new Player(200, 900);
  alien = new Enemy(random(400,800), random(100,400));

  //Holds all of the things that'll be printed on screen
  bullets = new ArrayList<Bullet>();
  alienBullets = new ArrayList<Bullet>();
  aliens = new ArrayList<Enemy>();
  playerArr = new ArrayList<Player>();

  //Loading images
  explosionImg = loadImage(explosionUrl, "png");
  aliens.add(alien);

  brimg = loadImage("brimg.jpg");

  playerArr.add(player);
}

void draw()
{
  //Sets background
  background(brimg);
  //If the player is still alive then it'll run continuously
  if (!gameOver)
  {
    textSize(60);
    text("SCORE: " + score * 100, 15, 55);
    //Prevents out of bounds error
    if (playerArr.size() > 0)
    {
      //Creates and allows the player to move
      playerArr.get(0).create();
      playerArr.get(0).move();
      //Creates, prints, and moves all bullets shot by the aliens
      for (int k = 0; k < alienBullets.size(); k++)
      {
        alienBullets.get(k).create();
        alienBullets.get(k).moveDown();
        //If the bullet hits the player then cause an explosion and end the game
        if (alienBullets.get(k).overlaps(player))
        {
          if(playerArr.size() > 0)
          {
            image(explosionImg, playerArr.get(0).x, playerArr.get(0).y, 300, 300);
            playerArr.remove(0);
            gameOver = true;
          }
        } 
        else if (alienBullets.get(k).y >= 1060)
        {
          alienBullets.remove(k);
        }
      }
    }
    //Creates, prints, and allows the aliens to move
    if(aliens.size() > 0)
    {
      //Prevents out of bounds error
      for (int i = 0; i < aliens.size(); i++)
      {
        aliens.get(i).create();
        aliens.get(i).move();
        //Causes the alien to shoot once every 3s
        float t = random(1,5);
        if (frameCount % 180 == 0 && aliens.size() > 0)
        {
          alienBullets.add(new Bullet(aliens.get(i).x - 6.4, aliens.get(i).y + 18, 3));
        }
        //Creates, prints, and moves all bullets shot by the aliens
        for (int j = 0; j < bullets.size(); j++)
        {
          bullets.get(j).create();
          bullets.get(j).move();
          //If the bullet hits the alien then remove it and cause an explosion
          if(aliens.size() > 0)
          {
            if (bullets.get(j).overlaps(aliens.get(i)))
            {
              image(explosionImg, aliens.get(i).x, aliens.get(i).y, 100, 100);
              aliens.remove(i);
              bullets.remove(j);
              score++;
            }
            //When the bullets go off the screen they're deleted
            else if (bullets.get(j).y <= -100)
            {
              bullets.remove(j);
            }
          }
        }
      } 
    }
    else
    {
      for(int n = 0; n < numAliens; n++)
      {
        Enemy enemy = new Enemy(random(400,800), random(100,400));
        aliens.add(enemy);
      }
    }
  } 
  else
  {
    brimg.filter(BLUR);
    background(brimg);
    textAlign(CENTER);
    textSize(150);
    text("GAME OVER", 500, 540);
    textSize(60);
    text("SCORE: " + score * 100, 500, 600);
  }
}

void keyPressed()
{
  if (key == 'd')
  {
    player.goingRight = true;
  }
  if (key == 'a')
  {
    player.goingLeft = true;
  }
}
void keyReleased()
{
  if (key == 'd')
  {
    player.goingRight = false;
  }
  if (key == 'a')
  {
    player.goingLeft = false;
  }
}
void mousePressed()
{
  if (playerArr.size() > 0)
  {
    if(bullets.size() < 5)
    {
      bullets.add(new Bullet(player.x - 5, player.y - 155));
    }
  }
}
