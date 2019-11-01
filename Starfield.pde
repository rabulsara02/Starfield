Particle [] explode;
int myColor;
void setup()
{
	size(700, 700);
	explode = new Particle[1000];
	for(int i = 0; i < explode.length; i++)
 	{
 		explode[i] = new Particle();
 		explode[0] = new OddballParticle();
 	}
 	myColor = color((int)(Math.random()* 255),(int)(Math.random()* 255),(int)(Math.random()* 255));
}
void draw()
{
	background(0);
 	
 	for(int i = 0; i < explode.length; i++)
 	{
 		explode[i].move();
 		explode[i].show();
 	}

}
//Whenever mouse is pressed, restarts at cursor location
void mousePressed()
{
	myColor = color((int)(Math.random()* 255),(int)(Math.random()* 255),(int)(Math.random()* 255));
	for(int i = 0; i < explode.length; i++)
 	{
 		explode[i] = new Particle(mouseX, mouseY);
 		explode[0] = new OddballParticle();
 	}
}

class Particle
{
	double myX, myY, mySpeed, myAngle;
	int siz = 10;
	Particle()
	{
		myX = 350;
		myY = 350;
		mySpeed = Math.random()*10;
		myAngle = Math.random()*2 * Math.PI;
	}
	Particle(int x, int y)
	{
		myX = x;
		myY = y;
		mySpeed = Math.random()*10;
		myAngle = Math.random()*2 * Math.PI;
	}

	//Tells the explosion particles where to go
	void move()
	{
		myX = myX + Math.cos(myAngle) * mySpeed;
	 	myY = myY + Math.sin(myAngle) * mySpeed;
	 	myAngle = myAngle + 0.01;
	 	/*
	 	if( frameCount > 50 )
	 	{
	 	myX = myX + Math.cos(myAngle) * -1;
	 	myY = myY + Math.sin(myAngle) * -1;
	 	}
	 	*/
	}

	//Creates the particles for explosion
	void show()
	{
		noStroke();
		fill(myColor);
		ellipse((float)myX, (float)myY, siz, siz);
	}
}

class OddballParticle extends Particle
{

	OddballParticle()
	{
		myX = 350;
		myY = 350;
		mySpeed = Math.random()*50;
		myAngle = Math.random()*2 * Math.PI;
	}

	void move()
	{
		myX = myX + Math.cos(myAngle) * mySpeed;
	 	myY = myY + Math.sin(myAngle) * mySpeed;
	 	myAngle = myAngle + 0.01;
	}	

	void show()
	{

		noStroke();
		fill((int)(Math.random()* 255),(int)(Math.random()* 255),(int)(Math.random()* 255));
		rect((float)myX, (float)myY, 30, 30);
	}


}


