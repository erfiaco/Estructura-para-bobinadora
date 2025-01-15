// ejemplo de modulo

Altura = 130;
Ancho = 100;
Grosor = 2;

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
                cylinder(d=diametro, h=alt_c, , center = false);
                
            }
            //translate([1,1,0])
            //scale([1-Grosor/Ancho,1-Grosor/Ancho,1])
            resize([Ancho-Grosor*2, Ancho-Grosor*2,Altura*2])
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

module encaje_h(altura_encaje,diametro_encaje)
{
    
    difference()
    {
        cylinder(h=altura_encaje, d=diametro_encaje, $fn=60);
        translate([0,0,altura_encaje*0.2])
        cylinder(h=altura_encaje*0.8, d=diametro_encaje*0.5, $fn=60);
    }
}

module encaje_m(altura_encaje,diametro_encaje)
{
    translate([0,0,altura_encaje*1.5])
    rotate([180,0,0])
    
    union()
    {
        cylinder(h=altura_encaje*0.5, d=diametro_encaje, $fn=60);
        translate([0,0,0.5*altura_encaje])
        cylinder(h=altura_encaje*0.7, d=diametro_encaje*0.4, $fn=60);
    }
}

module encaje_hembra(altura_encaje,diametro_encaje)
{
    
    difference()
    {
        cylinder(h=altura_encaje, d=diametro_encaje, $fn=60);
        translate([0,0,altura_encaje*0.2])
        cylinder(h=altura_encaje*0.8, d=diametro_encaje*0.5, $fn=60);
    }
}

module encaje_macho(altura_encaje,diametro_encaje)
{
    translate([0,0,altura_encaje*1.5])
    rotate([180,0,0])
    
    union()
    {
        cylinder(h=altura_encaje*0.5, d=diametro_encaje, $fn=60);
        translate([0,0,0.5*altura_encaje])
        cylinder(h=altura_encaje*0.7, d=diametro_encaje*0.4, $fn=60);
    }
}

Encaje_h = 10;
Encaje_d = 5;

//Par entender dónde poner el encaje, piensa que, el redondeado del borde viene de un cilindro de radio x. si diseñamos un cuadrado en el ángulo de lados = 7, y hacemos un triángulo rectángulo, su h² = x² + x². Una vez conocemos la h, por regla de 3, encontramos el valor de los catetos del triángulo cuya hipotenusa es h-7.


// Crear solo un cuarto del cilindro vacío

hipo = sqrt(7^2 + 7^2); // hipotenusa
cateto = sqrt(((hipo - 7)^2)/2); // cateto


difference(){
    
    union(){
        translate([0,0,Altura/2])
        rectangulo_vacio_bordes_redondeados(Ancho, Ancho, Altura, Grosor, 14, 2);
        
        //Tacos Sujecion
        
            for (i = [0:3]) {
                
                rotate([0, 0, i * 90]) {
                    
                    mirror_copy() {
                        translate([-Ancho/2 + Grosor, -Ancho/4 + Grosor, Repisa1 - Taco])
                        cube(size = Taco, center = false);
                        
                        translate([-Ancho/2 + Grosor, -Ancho/4 + Grosor, Repisa2 - Taco])
                        cube(size = Taco, center = false);
                    }    
                        //enganche_hembra
                        translate([-Ancho/2+Grosor+Encaje_d/2+cateto/2, -Ancho/2+Grosor+Encaje_d/2+cateto/2, Altura/2-Encaje_h])
                        encaje_hembra(Encaje_h, Encaje_d);
                    
                    
                }
}

              
        }     
        
        //Hueco Motor Nema17
        translate([0, Ancho/2 + Grosor, Repisa1 + 1/2 * Altura_Nema17])
        rotate([90, 0, 0])
        cylinder(h=Grosor*2, d=5);
    
        
        //Hueco LCD
        translate([Ancho/2-Grosor, -Hueco_LCD_w/2, Altura - Hueco_LCD_h - 2])
        cube([Grosor*2, Hueco_LCD_w, Hueco_LCD_h], center = false);
    
          //Abertura en paredes Suelo
        translate([-Ancho/2+Abertura,-Ancho/2,0])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
        translate([-Ancho/2+Abertura,Ancho/2-Grosor,0])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
    
        translate([-Ancho/2,-Ancho/2 + Abertura,0])
        cube([Grosor,Ancho-Abertura*2,Abertura_h], center = false);
        
        translate([Ancho/2-Grosor,-Ancho/2 + Abertura,0])
        cube([Grosor,Ancho-Abertura*2,Abertura_h], center = false);
        
        //Abertura en pared Trasera
        translate([-Ancho/2+Abertura,-Ancho/2,Repisa2+Grosor])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);
        
        //Abertura en pared Trasera
        translate([-Ancho/2+Abertura,-Ancho/2,Repisa1+Grosor])
        cube([Ancho-Abertura*2,Grosor,Abertura_h], center = false);

        translate([0,0,250+Altura/2])
        cube([500,500,500], center = true);
       
}