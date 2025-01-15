// placa longitudinal de union entre las dos bobinas
// Se hace primero la estructura sólida, y después se resta el cilindro longitudinal interior para crear el hueco para la tuerca de fijacióno
// La estructura sólida se hace superponiendo cilindros
Altura = 15;
Cilindro_hueco_h = 15;
Cilindro_hueco_d = 3;
Cilindro_interno_base_d = 5;
Cilindro_externo_1 = 1;
Cilindro_externo_2 = 3;
Husillo = 1;
Distancia_cilindros = 70;
Temp = -4;

difference() {

    translate([0, Temp, 1]){
    cube([70, 8, 0.9], center = false);
    };    
    //translate([0, Temp, 13]){
    //cube([70, 8, 0.9], center = false);
    //};

difference() {

    union() {
        
        
        cylinder(h = Altura, d = Cilindro_interno_base_d, center = false);
        
    
        cylinder(h = 1, d = 12, center = false);
        translate([0,0,1]){
            cylinder(h = 1, d = 11, center = false);
            };
        translate([0,0,2]){
            cylinder(h = 3, d = 12, center = false);
            };
            
            translate([0,0,10]){
                    cylinder(h = 3, d = 12, center = false);
                    translate([0,0,3]){
                        cylinder(h = 1, d = 11, center = false);
                            };
                    translate([0,0,4]){
                    cylinder(h = 1, d = 12, center = false);
                    };
            }           
    };
//cylinder(h = 15, d = 3, center = false);
    
};

translate([Distancia_cilindros,0,0]) {
difference() {

    union() {
        
        
        cylinder(h = 15, d = 5, center = false);
        
    
        cylinder(h = 1, d = 12, center = false);
        translate([0,0,1]){
            cylinder(h = 1, d = 11, center = false);
            };
        translate([0,0,2]){
            cylinder(h = 3, d = 12, center = false);
            };
            
            translate([0,0,10]){
                    cylinder(h = 3, d = 12, center = false);
                    translate([0,0,3]){
                        cylinder(h = 1, d = 11, center = false);
                            };
                    translate([0,0,4]){
                    cylinder(h = 1, d = 12, center = false);
                    };
            }           
    };
//cylinder(h = 15, d = 3, center = false);
    
};
};
};






   


    
