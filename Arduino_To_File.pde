import processing.serial.*;
Serial myPort;
String Data;
PrintWriter output;

void setup() {
  printArray(Serial.list());  //Esta seccion imprime la lista de los puertos COM, solo elige el del Arduino y lo mete *
  String portName = Serial.list()[0]; //* aqui. Solo mete el indice del puerto que es.  
  myPort = new Serial(this, portName, 115200);
  output = createWriter( "data.txt" ); 
}

void draw() {
  if (myPort.available() > 0) {
    Data = myPort.readString(); 
    if ( Data != null ) {
      output.println( Data ); //No tengo manera de probar el sketch asi que no se si se imprime en una sola linea o
                              // con el salto de linea. Es cuestion de revisar el archivo que genera. 
    }
  }
}

void keyPressed() {
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    exit();  // Stops the program
}