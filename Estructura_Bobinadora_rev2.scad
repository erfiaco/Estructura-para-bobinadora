Altura = 130;
Ancho = 100;
Grosor = 1;

Hueco_motor_diametro = 5.5;

Hueco_LCD_h = 24;
Hueco_LCD_w = 71;

Hueco_base_w = 50;
Hueco_base_h = 86;

Soporte = Ancho;
Correccion_soporte_largo = Ancho - 40;
Correccion_soporte_ancho = 10;

Repisa1 = Altura-50;
Repisa2 = Altura-100;

Altura_Nema17 = 42.3;

Taco = 2;

Abertura = 10;
Abertura_h = 20;
/*
rotate([0,0,90])
translate([-20, -4 , Repisa1])
import("/home/javier/Downloads/Raspberry.stl");
*/
/*
difference(){

union(){
    
    //Paredes
    
    //Perpendiculares al eje y (frente y fondo)
    
    translate([-Ancho/2,-Ancho/2,0])
    cube([Ancho,Grosor,Altura], center = false);
    
    translate([-Ancho/2, Ancho/2,0])
    cube([Ancho,Grosor,Altura], center = false);
        
        
    //Perpendiculares al eje x (lados)
    translate([-Ancho/2,-Ancho/2,0])
    cube([Grosor,Ancho,Altura], center = false);
    
    translate([Ancho/2,-Ancho/2,0])
    cube([Grosor,Ancho+Grosor,Altura], center = false);


    
    //Tacos Sujecion Repisa1
        
        
    translate([-Ancho/2 + Grosor, -Ancho/2 + Grosor, Repisa1-Taco])
    cube([Taco,Taco,Taco], center = false);
    translate([-Ancho/2 + Grosor, Ancho/2-Taco, Repisa1-Taco])
    cube([Taco,Taco,Taco], center = false);
    translate([Ancho/2 - Taco, -Ancho/2+Grosor, Repisa1-Taco])
    cube([Taco,Taco,Taco], center = false);
    translate([Ancho/2 - Taco, Ancho/2-Taco, Repisa1-Taco])
    cube([Taco,Taco,Taco], center = false);  
      
    //Tacos Sujecion Repisa2
        
        
    translate([-Ancho/2 + Grosor, -Ancho/2 + Grosor, Repisa2-Taco])
    cube([Taco,Taco,Taco], center = false);
    translate([-Ancho/2 + Grosor, Ancho/2-Taco, Repisa2-Taco])
    cube([Taco,Taco,Taco], center = false);
    translate([Ancho/2 - Taco, -Ancho/2+Grosor, Repisa2-Taco])
    cube([Taco,Taco,Taco], center = false);
    translate([Ancho/2 - Taco, Ancho/2-Taco, Repisa2-Taco])
    cube([Taco,Taco,Taco], center = false);      
    


    };
    
        
        //Hueco Motor Nema17
        translate([0, Ancho/2 + Grosor, Repisa1 + 1/2 * Altura_Nema17])
        rotate([90, 0, 0])
        cylinder(h=Grosor, d=5);
    
        
        //Hueco LCD
        translate([Ancho/2, -Hueco_LCD_w/2, Altura - Hueco_LCD_h - 2])
        cube([Grosor, Hueco_LCD_w, Hueco_LCD_h], center = false);
        
        //Abertura en paredes Suelo
        translate([-Ancho/2+Abertura,-Ancho/2,0])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
        translate([-Ancho/2+Abertura,Ancho/2,0])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
        translate([-Ancho/2,-Ancho/2 + Abertura,0])
        cube([Grosor,Ancho-Abertura*2,Abertura_h], center = false);
        
        translate([Ancho/2,-Ancho/2 + Abertura,0])
        cube([Grosor,Ancho-Abertura*2,Abertura_h], center = false);
        
        //Abertura en pared Trasera
        translate([-Ancho/2+Abertura,-Ancho/2,Repisa2+Grosor])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
        
        //Abertura en pared Trasera
        translate([-Ancho/2+Abertura,-Ancho/2,Repisa1+Grosor])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
        
        
    
};
   

        
   
*/
/*
    
    //creacion de Repisa1
    difference(){
        translate([-Ancho/2, -Ancho/2, Repisa1])
            cube([Soporte, Soporte, Grosor], center = false);
        translate([-Ancho/2+20, -Ancho/2, Repisa1])
            cube([Correccion_soporte_largo, Correccion_soporte_ancho, Grosor], center = false);
        translate([-Ancho/2, -Ancho/2 +20, Repisa1])
            cube([Correccion_soporte_ancho, Correccion_soporte_largo, Grosor], center = false);
        translate([Ancho/2-10, -Ancho/2 +20, Repisa1])
            cube([Correccion_soporte_ancho, Correccion_soporte_largo, Grosor], center = false);
        translate([0, 0, Repisa1])
            cylinder(h=Grosor, d = 15);
        };        
   
*/    
    //creacion de Repisa2
    difference(){
        translate([-Ancho/2, -Ancho/2, Repisa2])
            cube([Soporte, Soporte, Grosor], center = false);
        translate([-Ancho/2+20, -Ancho/2, Repisa2])
            cube([Correccion_soporte_largo, Correccion_soporte_ancho, Grosor], center = false);
        translate([-Ancho/2+20, Ancho/2 -10, Repisa2])
            cube([Correccion_soporte_largo, Correccion_soporte_ancho, Grosor], center = false);
        translate([-Ancho/2, -Ancho/2 +20, Repisa2])
            cube([Correccion_soporte_ancho, Correccion_soporte_largo, Grosor], center = false);
        translate([Ancho/2-10, -Ancho/2 +20, Repisa2])
            cube([Correccion_soporte_ancho, Correccion_soporte_largo, Grosor], center = false);
        };
      


