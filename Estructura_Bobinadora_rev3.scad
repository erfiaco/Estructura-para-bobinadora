// ejemplo de modulo

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

module rectangulo_vacio_bordes_redondeados(ancho, profundidad, altura, grosor, diametro, alt_c)
{
    //translate([diametro/2, diametro/2, 0])
        difference()
        {
            minkowski()
            {
                cube([ancho-diametro, profundidad-diametro, altura-alt_c], center = true);
                cylinder(d=diametro, h=alt_c, $fn=60, center = false);
                
            }
            //translate([1,1,0])
            scale([0.98,0.98,1])
            minkowski()
            {
                cube([ancho-diametro, profundidad-diametro, altura], center = true);
                cylinder(d=diametro, h=alt_c, $fn=60, center = false);
                
            }
            
        }
    
}

module mirror_copy ( v = [1,0,0]){
    children();
    mirror(v) children();
}

// Crear solo un cuarto del cilindro vacío

difference(){
    
    union(){
        translate([0,0,Altura/2])
        rectangulo_vacio_bordes_redondeados(Ancho, Ancho, Altura, Grosor, 14, 2);
        
        //Tacos Sujecion Repisa1
        
            for (i = [0:3]) {
                
                rotate([0, 0, i * 90]) {
                    
                    mirror_copy() {
                        translate([-Ancho/2 + Grosor, -Ancho/4 + Grosor, Repisa1 - Taco])
                        cube(size = Taco, center = false);
                        
                        translate([-Ancho/2 + Grosor, -Ancho/4 + Grosor, Repisa2 - Taco])
                        cube(size = Taco, center = false);
                    }
                    
                }
}

              
        }     
        
        //Hueco Motor Nema17
        translate([0, Ancho/2 + Grosor, Repisa1 + 1/2 * Altura_Nema17])
        rotate([90, 0, 0])
        cylinder(h=Grosor*2, d=5);
    
        
        //Hueco LCD
        translate([Ancho/2-1, -Hueco_LCD_w/2, Altura - Hueco_LCD_h - 2])
        cube([Grosor*2, Hueco_LCD_w, Hueco_LCD_h], center = false);
    
          //Abertura en paredes Suelo
        translate([-Ancho/2+Abertura,-Ancho/2,0])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
        translate([-Ancho/2+Abertura,Ancho/2-1,0])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
        translate([-Ancho/2,-Ancho/2 + Abertura,0])
        cube([Grosor,Ancho-Abertura*2,Abertura_h], center = false);
        
        translate([Ancho/2-1,-Ancho/2 + Abertura,0])
        cube([Grosor,Ancho-Abertura*2,Abertura_h], center = false);
        
        //Abertura en pared Trasera
        translate([-Ancho/2+Abertura,-Ancho/2,Repisa2+Grosor])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
        
        //Abertura en pared Trasera
        translate([-Ancho/2+Abertura,-Ancho/2,Repisa1+Grosor])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
}