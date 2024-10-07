String estadoJuego = "Inicio"; //Estado actual del juego

PImage fondoInicio, fondoNivel1, fondoNivel2, fondoSelect, personajeFijo;
PImage[] personajes;
int personajeActual = 0;
int fondoNivel1X = 0;
int personajeFijoX = -100; //patinadora
int personajeFijoY = 600;
int velocidadFondo = 3;
int personajeMovilX; //personaje que se mueve con el fondo
int velocidadPersonaje = 3;
int[] otrosPersonajesX = {600, 1000, 1500};

void setup() {
  size(1920, 1080);
  fondoInicio = loadImage("mainmenu4.jpg"); 
  fondoSelect = loadImage("select2.jpg");
  fondoNivel1 = loadImage("atmosphere5.png");
  fondoNivel2 = loadImage("fondoprueba.jpg");
  personajeFijo = loadImage("personajeprin4.png");
  personajes = new PImage[14];
  personajes[0] = loadImage("personaje1.png");
  noSmooth();
  fullScreen();
}

void draw() {
  if (estadoJuego.equals("Inicio")) {
    pantallaInicio(); //Mostrar pantalla inicio
  } else if (estadoJuego.equals("Select")) {
    Select();
  } else if (estadoJuego.equals("Atmosphere")) {
    Atmosphere(); //Mostrar nivel atmosphere
  } else if (estadoJuego.equals("Nivel2")) {
    Biosphere();
  }
}
void pantallaInicio() {
  image(fondoInicio, 0, 0);
  rect(150, 580, 515, 100);
  fill(255, 0);
  stroke(59, 134, 191);
}
void Select() {
  image(fondoSelect, 0, 0);
  rect(80, 115, 370, 340);
  fill(255, 0);
  noStroke();  
}
void Atmosphere() {
  image(fondoNivel1, fondoNivel1X, 0, width, height);
  image(fondoNivel1, fondoNivel1X + width, 0, width, height);
  if (fondoNivel1X <= -width) { //el bucle del fondo
    fondoNivel1X = 0;
    personajeActual = (personajeActual + 1) % personajes.length; //el personaje cambia cuando empieza otro bucle
  }
  image(personajes[personajeActual], personajeMovilX + 500, 300);
  image(personajeFijo, personajeFijoX, personajeFijoY - 200);

  //rect(200, 500, 150, 100);
  //fill(255, 255);
  if (keyPressed && keyCode == RIGHT) {
    fondoNivel1X -= velocidadFondo; //se mueve el fondo
    personajeMovilX -= velocidadPersonaje; // se mueve el personaje
  }
}
void Biosphere() {
  image(fondoNivel2, 0, 0);
  rect(200, 500, 150, 100);
  fill(255, 255);
}
void mousePressed() {
  if (estadoJuego.equals("Inicio")) {
    if (mouseX > 150 && mouseX < 150 + 515 && mouseY > 580 && mouseY < 580 + 100) {
      estadoJuego = "Select"; // Cambiar al nivel 1 60, 380, 400, 50)
    }
  }
  if (estadoJuego.equals("Select")) {
    if (mouseX > 80 && mouseX < 80 + 370 && mouseY > 115 && mouseY < 115 + 340) {
      estadoJuego = "Atmosphere";
    }
  }
}
