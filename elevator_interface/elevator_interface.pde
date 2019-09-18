PImage background_img;
PImage selection_screen;
PImage full_company_screen;
PImage floor_two_selection_screen;
PImage floor_three_selection_screen;
PImage floor_two_arrow;
PImage floor_two_no_arrow;
PImage floor_three_arrow;
PImage floor_three_no_arrow;
boolean id_scanned = false;
boolean load_selection_screen = false;
boolean ready_for_floor = false;
boolean floor_three_selected = false;
boolean floor_two_selected = false;
boolean floor_two_selected_animation = false;
boolean floor_three_selected_animation = false;
boolean finished = false;

void mouseClicked() 
{
  if ((mouseX >= 82 && mouseX <= 401) && (mouseY > 540 && mouseY < 773) && (id_scanned == false)) 
  {
    id_scanned = true;
    image(full_company_screen, 0, 0);
    load_selection_screen = true;
    println("clicked!");
  }
  
  if (ready_for_floor == true)
  {
    if ((mouseX > 264 && mouseX < 344) && (mouseY > 268 && mouseY < 343))
    {
      floor_three_selected = true;
      ready_for_floor = false;
    }
    if ((mouseX > 264 && mouseX < 344) && (mouseY > 360 && mouseY < 435))
    {
      floor_two_selected = true;
      ready_for_floor = false;
    }
  }
  
}


void setup()
{
  size(485, 843);
  background_img = loadImage("background.png");
  full_company_screen = loadImage("full_company_screen.png");
  selection_screen = loadImage("selection_screen.png");
  floor_two_selection_screen = loadImage("floor_two_selection_screen.png");
  floor_three_selection_screen = loadImage("floor_three_selection_screen.png");
  floor_three_arrow = loadImage("floor_three_arrow.png");
  floor_three_no_arrow = loadImage("floor_three_no_arrow.png");
  floor_two_arrow = loadImage("floor_two_arrow.png");
  floor_two_no_arrow = loadImage("floor_two_no_arrow.png");
  background(background_img);
}

int alpha = 0;
int flash_count = 0;
void draw()
{
  if (load_selection_screen == true && alpha < 255)
  {
    if (alpha == 0)
    {
      delay(250);
    }
    if (alpha > 50)
    {
      alpha = 255;
    }
    tint(255,255,255,alpha);
    image(selection_screen, 0, 0);
    delay(30);
    alpha++;
  }
  if (load_selection_screen == true && alpha >= 255)
  {
    load_selection_screen = false;
    ready_for_floor = true;
    alpha = 0;
  }
  println(alpha);
  if ((floor_three_selected == true || floor_two_selected == true) && alpha < 255)
  {
    if (alpha > 25)
    {
      alpha = 255;
    }
    tint(255,255,255,alpha);
    if (floor_three_selected == true)
    {
    image(floor_three_selection_screen, 0, 0);
    }
    else
    {
      image(floor_two_selection_screen, 0, 0);
    }
    alpha++;
  }
  if ((floor_three_selected == true || floor_two_selected == true) && alpha >= 255)
  {
    delay(500);
    if (floor_two_selected == true)
    {
      println("here");
      floor_two_selected = false;
      floor_two_selected_animation = true;
    }
    else
    {
      floor_three_selected = false;
      floor_three_selected_animation = true;
    }
    alpha = 0;
  }
  
  if (floor_three_selected_animation == true && flash_count < 10)
  {
    if (flash_count % 2 == 1)
    {
    image(floor_three_arrow,0,0);
    }
    else
    {
      image(floor_three_no_arrow,0,0);
    }
    delay(300);
    flash_count++;
  }
  if (floor_three_selected_animation == true && flash_count >= 10)
  {
    floor_three_selected_animation = false;
    flash_count = 0;
    delay(2000);
    finished = true;
  }
  if (floor_two_selected_animation == true && flash_count < 11)
  {
    print("!!!!", flash_count);
    if (flash_count % 2 == 1)
    {
    image(floor_two_arrow,0,0);
    }
    else
    {
      image(floor_two_no_arrow,0,0);
    }
    delay(300);
    flash_count++;
  }
  if (floor_two_selected_animation == true && flash_count >= 11)
  {
    floor_two_selected_animation = false;
    flash_count = 0;
    delay(2000);
    finished = true;
  }
  
  if (finished == true)
  {
    image(background_img,0,0);
    finished = false;
    id_scanned = false;
  }
}
