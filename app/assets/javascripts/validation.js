function validarEmailCorrecto(email){
      var nom = $(email).val();
      var errores="";     
      
    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El correo electronico es requerido \n";
          email.style.borderColor='#FF0000';
          $("#error_email").text(errores);          
          $("#error_email").fadeIn();          
          return false;
    }else{        
           if(!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z\-])+\.)+([a-zA-Z]{2,4})+$/.test(nom))){
              errores = "El correo electronico es invalido \n";
              email.style.borderColor='#FF0000';
            $("#error_email").text(errores);           
            $("#error_email").fadeIn();
              return false;
          }else{
            email.style.borderColor='#00FF00';
            $("#error_email").fadeOut();            
          }
      }          
      return true;
}


/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z\-])+\.)+([a-zA-Z]{2,4})+$/

function validarNombreCorrecto(nombre){
      var nom = $(nombre).val();
      var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El nombre es requerido \n";
          nombre.style.borderColor='#FF0000';
          $("#error_nombre").text(errores);
          $("#error_nombre").fadeIn();
          return false;
    }else{
          if(!(/^[a-zA-ZñÑáéíóú´ ]+$/.test(nom))){
              errores = "Utiliza solo letras \n";
              nombre.style.borderColor='#FF0000';
            $("#error_nombre").text(errores);            
            $("#error_nombre").fadeIn();
              return false;
          }else{
           $("#error_nombre").text("");  
           nombre.style.borderColor='#00FF00';
           $("#error_nombre").fadeOut();          
          }
      }
       return true;
          
}

function validarApellidoCorrecto(apellido){
      var nom = $(apellido).val();
    var errores="";    

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El apellido es requerido \n";
          apellido.style.borderColor='#FF0000';
          $("#error_apellido").text(errores);          
          $("#error_apellido").fadeIn();
          return false;
    }else{
         if(!(/^[a-zA-ZñÑáéíóú´ ]+$/.test(nom))){
              errores = "Utiliza solo letras \n";
              apellido.style.borderColor='#FF0000';
            $("#error_apellido").text(errores);            
            $("#error_apellido").fadeIn();
              return false;
          }else{
            $("#error_apellido").text("");
            apellido.style.borderColor='#00FF00';
            $("#error_apellido").fadeOut();
            return true;
        }
      }
}

function validarApodoCorrecto(apodo){
      var nom = $(apodo).val();
      var errores="";   

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El apodo es requerido \n";
          apodo.style.borderColor='#FF0000';
          $("#error_apodo").text(errores);          
          $("#error_apodo").fadeIn();
          return false;
      }else {
          if(!(/^[a-zA-Z0-9_ñÑáéíóú\-]+$/.test(nom))){
              errores = "Utiliza solo letras, numeros, guiones y guion bajo \n";
              apodo.style.borderColor='#FF0000';
            $("#error_apodo").text(errores);            
            $("#error_apodo").fadeIn();
              return false;
          }else{
            $("#error_apodo").text(""); 
            apodo.style.borderColor='#00FF00';
            $("#error_apodo").fadeOut();
            return true;
        }
      }
}


function validarContrasenaCorrecto(contrasena){
      var nom = $(contrasena).val();
      var errores="";    

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "La contraseña es requerida\n";
          contrasena.style.borderColor='#FF0000';
          $("#error_contrasena").text(errores);
          $("#error_contrasena").fadeIn();
          return false;
      }else{
          if(!(/^[a-zA-Z0-9ñÑáéíóú_.,+*&%\-]+$/.test(nom))){
              errores = "Contraseña invalida \n";
              contrasena.style.borderColor='#FF0000';
            $("#error_contrasena").text(errores);            
            $("#error_contrasena").fadeIn();
              return false;
          }else{
            if(nom.length<8 || nom.length>15){
                errores = "La contraseña debe contener minimo 8 caracteres y maximo 15 \n";
                contrasena.style.borderColor='#FF0000';
                $("#error_contrasena").text(errores);
                $("#error_contrasena").fadeIn();
                return false;
            }else{
               contrasena.style.borderColor='#00FF00';
               $("#error_contrasena").fadeOut();
               return true;
            }            
          }
      }
}

function validarCContrasenaCorrecto(Ccontrasena){
    var nom = $(Ccontrasena).val();    
    var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "La confirmacion de contraseña es requerida \n";
          Ccontrasena.style.borderColor='#FF0000';
          $("#error_Ccontrasena").text(errores);
          $("#error_Ccontrasena").fadeIn();
          return false;
      }else{ 
          if(!(/^[a-zA-Z0-9ñÑáéíóú_.,+*&%\-]+$/.test(nom))){
            errores = "Confirmacion invalida \n";
            Ccontrasena.style.borderColor='#FF0000';
            $("#error_Ccontrasena").text(errores);
            $("#error_Ccontrasena").fadeIn();
            return false;
        }else{
          if(nom.length<8 || nom.length>15){
                errores = "La confirmacio de contraseña debe contener minimo 8 caracteres y maximo 15  \n";
                Ccontrasena.style.borderColor='#FF0000';
                $("#error_Ccontrasena").text(errores);
                $("#error_Ccontrasena").fadeIn();
                return false;
            }else{
              Ccontrasena.style.borderColor='#00FF00';
               $("#error_Ccontrasena").fadeOut();
               return true;
            }
        }
     }
}

function validarCurrentContrasenaCorrecto(Cucontrasena){
    var nom = $(Cucontrasena).val();
    var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "La confirmacion de contraseña es requerida \n";
          Cucontrasena.style.borderColor='#FF0000';
          $("#error_Cucontrasena").text(errores);
          $("#error_Cucontrasena").fadeIn();
          return false;
      }else{ 
          if(!(/^[a-zA-Z0-9ñÑáéíóú_.,+*&%\-]+$/.test(nom))){
            errores = "Confirmacion invalida \n";
            Cucontrasena.style.borderColor='#FF0000';
            $("#error_Cucontrasena").text(errores);
            $("#error_Cucontrasena").fadeIn();
            return false;
        }else{
          if(nom.length<8 || nom.length>15){
                errores = "La confirmacio de contraseña debe contener minimo 8 caracteres y maximo 15  \n";
                Cucontrasena.style.borderColor='#FF0000';
                $("#error_Cucontrasena").text(errores);
                $("#error_Cucontrasena").fadeIn();
                return false;
            }else{
              Cucontrasena.style.borderColor='#00FF00';
               $("#error_Cucontrasena").fadeOut();
               return true;
            }
        }
     }
}

function validarTitulo(nombre){
      var nom = $(nombre).val();
      var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El titulo es requerido \n";
          nombre.style.borderColor='#FF0000';
          $("#error_titulo").text(errores);
          $("#error_titulo").fadeIn();
          return false;
    }else{
          if(!(/^[a-zA-Z0-9ñÑáéíóú´ ]+$/.test(nom))){
              errores = "Utiliza solo letras y numeros \n";
              nombre.style.borderColor='#FF0000';
            $("#error_titulo").text(errores);            
            $("#error_titulo").fadeIn();
              return false;
          }else{
           $("#error_titulo").text("");  
           nombre.style.borderColor='#00FF00';
           $("#error_titulo").fadeOut();          
          }
      }
       return true;
          
}

function validarAutor(nombre){
      var nom = $(nombre).val();
      var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El autor es requerido \n";
          nombre.style.borderColor='#FF0000';
          $("#error_autor").text(errores);
          $("#error_autor").fadeIn();
          return false;
    }else{
          if(!(/^[a-zA-ZñÑáéíóú´ ]+$/.test(nom))){
              errores = "Utiliza solo letras\n";
              nombre.style.borderColor='#FF0000';
            $("#error_autor").text(errores);            
            $("#error_autor").fadeIn();
              return false;
          }else{
           $("#error_autor").text("");  
           nombre.style.borderColor='#00FF00';
           $("#error_autor").fadeOut();          
          }
      }
       return true;          
}

function validarAño(nombre){
      var nom = $(nombre).val();
      var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El año es requerido \n";
          nombre.style.borderColor='#FF0000';
          $("#error_año").text(errores);
          $("#error_año").fadeIn();
          return false;
    }else{
          if(!(/^[0-9]+$/.test(nom))){
              errores = "Utilice solo numeros\n";
              nombre.style.borderColor='#FF0000';
            $("#error_año").text(errores);            
            $("#error_año").fadeIn();
              return false;
          }else{
              if(nom<1900 || nom>2016){
                 errores = "Año invalido\n";
                nombre.style.borderColor='#FF0000';
                $("#error_año").text(errores);            
                $("#error_año").fadeIn();
              }else{
               $("#error_año").text("");  
               nombre.style.borderColor='#00FF00';
               $("#error_año").fadeOut(); 
             }         
          }
      }
       return true;          
}

function validarAlbum(nombre){
      var nom = $(nombre).val();
      var errores="";  

    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "El album es requerido \n";
          nombre.style.borderColor='#FF0000';
          $("#error_album").text(errores);
          $("#error_album").fadeIn();
          return false;
    }else{
          if(!(/^[a-zA-Z0-9ñÑáéíóú´ ]+$/.test(nom))){
              errores = "Utilice solo letras y numeros\n";
              nombre.style.borderColor='#FF0000';
            $("#error_album").text(errores);            
            $("#error_album").fadeIn();
              return false;
          }else{
               $("#error_album").text("");  
               nombre.style.borderColor='#00FF00';
               $("#error_album").fadeOut();                      
          }
      }
       return true;          
}

function validarLetra(nombre){
      var nom = $(nombre).val();
      var errores="";  
    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "Debe digitar la letra de la cancion\n";
          nombre.style.borderColor='#FF0000';
          $("#error_letra").text(errores);
          $("#error_letra").fadeIn();
          return false;
    }else{
          if(!(/^[a-zA-Z0-9ñÑáéíóú_\-+*,.;:¡!"?¿'()#$%&={}º\[\]\\^´\n… ]+$/.test(nom))){
              errores = "No utilice caracteres como < > \n";
              nombre.style.borderColor='#FF0000';
              $("#error_letra").text(errores);            
              $("#error_letra").fadeIn();
              return false;
          }else{
            if(nom.length<10){
                errores = "Letra de cancion muy corta\n";
                nombre.style.borderColor='#FF0000';
                $("#error_letra").text(errores);            
                $("#error_letra").fadeIn();             
            }else{
                $("#error_letra").text("");  
                nombre.style.borderColor='#FFFFFF';
                $("#error_letra").fadeOut();  
             }                                           
          }
      }
       return true;          
}

function validarUrl(nombre){
      var nom = $(nombre).val();
      var errores="";  
    if(nom.length == 0 || nom == null || /^\s*$/.test(nom)){
          errores = "Debe suministrar la url\n";
          nombre.style.borderColor='#FF0000';
          $("#error_url").text(errores);
          $("#error_url").fadeIn();
          return false;
    }else{
          if(!(/^[a-zA-Z0-9ñÑáéíóú_\-+*,.;:¡!"?¿'()#$%&={}º\[\]\\^´\n… ]+$/.test(nom))){
              errores = "No utilice caracteres como < > \n";
              nombre.style.borderColor='#FF0000';
              $("#error_url").text(errores);            
              $("#error_url").fadeIn();
              return false;
          }else{
                $("#error_url").text("");  
                nombre.style.borderColor='#FFFFFF';
                $("#error_url").fadeOut();                                                        
          }
      }
       return true;          
}