#lang racket

#|-Fecha de publicación 4/17/2024
-Hora 6:40 a.m
- Versión de su código 8.9
-Autor. Ing(c): Jose Daniel Gómez Buriticá
- Nombre del lenguaje utilizado: Racket
- Versión del lenguaje utilizado: 8.12
- Presentado a: Doctor Ricardo Moreno Laverde
- Universidad Tecnológica de Pereira
- Programa de Ingeniería de Sistemas y Computación
- Este programa permite a un usuario jugar a El ahoracado de forma gráfica  
- Salvedades si las hubiese. Ejemplo: Salvedad: Para valores fuera de este rango, no garantizamos los resultados.|#

( require graphics/graphics )
( open-graphics )
( define game ( open-viewport "Ahorcado" 800 460 ) )
( ( draw-pixmap game ) "fondo.png"  (make-posn 0 0 )  )

( ( draw-pixmap game ) "a.png" ( make-posn 500 40 ) )
( ( draw-pixmap game ) "á.png" ( make-posn 550 40 ) )
( ( draw-pixmap game ) "b.png" ( make-posn 600 40 ) )
( ( draw-pixmap game ) "c.png" ( make-posn 650 40 ) )
( ( draw-pixmap game ) "d.png" ( make-posn 700 40 ) )

( ( draw-pixmap game ) "e.png" ( make-posn 500 90 ) )
( ( draw-pixmap game ) "é.png" ( make-posn 550 90 ) )
( ( draw-pixmap game ) "f.png" ( make-posn 600 90 ) )
( ( draw-pixmap game ) "g.png" ( make-posn 650 90 ) )
( ( draw-pixmap game ) "h.png" ( make-posn 700 90 ) )

( ( draw-pixmap game ) "i.png" ( make-posn 500 140 ) )
( ( draw-pixmap game ) "í.png" ( make-posn 550 140 ) )
( ( draw-pixmap game ) "j.png" ( make-posn 600 140 ) )
( ( draw-pixmap game ) "k.png" ( make-posn 650 140 ) )
( ( draw-pixmap game ) "l.png" ( make-posn 700 140 ) )

( ( draw-pixmap game ) "m.png" ( make-posn 500 190 ) )
( ( draw-pixmap game ) "n.png" ( make-posn 550 190 ) )
( ( draw-pixmap game ) "ñ.png" ( make-posn 600 190 ) )
( ( draw-pixmap game ) "o.png" ( make-posn 650 190 ) )
( ( draw-pixmap game ) "ó.png" ( make-posn 700 190 ) )

( ( draw-pixmap game ) "p.png" ( make-posn 500 240 ) )
( ( draw-pixmap game ) "q.png" ( make-posn 550 240 ) )
( ( draw-pixmap game ) "r.png" ( make-posn 600 240 ) )
( ( draw-pixmap game ) "s.png" ( make-posn 650 240 ) )
( ( draw-pixmap game ) "t.png" ( make-posn 700 240 ) )

( ( draw-pixmap game ) "u.png" ( make-posn 500 290 ) )
( ( draw-pixmap game ) "ú.png" ( make-posn 550 290 ) )
( ( draw-pixmap game ) "udieresis.png" ( make-posn 600 290 ) )
( ( draw-pixmap game ) "v.png" ( make-posn 650 290 ) )
( ( draw-pixmap game ) "w.png" ( make-posn 700 290 ) )

( ( draw-pixmap game ) "x.png" ( make-posn 550 340 ) )
( ( draw-pixmap game ) "y.png" ( make-posn 600 340 ) )
( ( draw-pixmap game ) "z.png" ( make-posn 650 340 ) )

( ( draw-pixmap game ) "soil.png" ( make-posn 80 300 ) )

#|Estas funciones imprimen las imagnes necesarias para el inicio del juego, en este caso son las letras.|#

( define mainString " aábcdeéfghiíjklmnñoópqrstuúüvwxyz" );string que se usa para verificar si una letra ya ha sido jugada
;----------------------------------------------------------------------------------------------------------------------------------------------
( define ( Spaces word number pos )
   ( if (< number ( string-length word ) )
        ( begin 
           ( ( draw-line game ) ( make-posn (+ pos 6 ) 400 ) ( make-posn (- (+ pos 100 ) 55 ) 400 ) "white" )
           ( Spaces word (+ number 1 ) (+ pos 50 ) )
           );fin begin
        ;else
        ( void )
        ); fin if
   );fin definicion funcion Spaces 

;Esta funcion se usa para que se dibujen las lineas guia para poder adivinar las palabras, se le entrega "word" que es el string aleatorio, number para el ancla
;y pos para la ubicacion de las lineas
;----------------------------------------------------------------------------------------------------------------------------------------------
( define ( Comparer numbString string )
   ( if ( = numbString   (string-length string ))
        #t
        ;else
        #f
        );fin if
   );fin definicion funcion comparer

;Esta funcion se usa para saber si el jugador ya ha ganado, usa un numbString y un string length de la palabra aleatoria para esto.
;Al final retornará un booleano para poder usarlo y verificar si se han cumplido los requisitos.
;----------------------------------------------------------------------------------------------------------------------------------------------
( define ( StringIndex string char pos )
   ( if ( < pos ( string-length string ) )
        ( if ( char=? char ( string-ref string pos ) )
             pos
             ;else
             ( StringIndex string char (+ pos 1 )  ) )
        ;else
        pos ); fin if
   );fin definicion funcion StringIndex

;Esta funcion se usa en diferentes partes del codigo para encontrar la posicion de un caracter en un string, a esta funcion se le entrega un string,
;el caracter que queremos encontrar y una posicion para que cada vez que se repita la funcion, vaya aumentando la posicion en la que se busca el caracter.
;----------------------------------------------------------------------------------------------------------------------------------------------

( define ( ChangeChar string letter pos  )
   ( string-append
     ( substring string 0 pos )
     ( ~a letter )
     ( substring string  (+ pos 1 )
                 )
     );fin string-append
   ); fin definicion funcion ChangeChar

;Esta funcion sirve para cambiar un caracter en un string, usa los parametros string, letter y pos, donde string es la cadena que queremos cambiar, letter la letra que
;por la que se va a cambiar otra en el string y pos, que es la posicion en la que se quiere hacer esto.
;-----------------------------------------------------------------------------------------------------------------------------------------------

( define ( RandomWords randomNum )
   ( if (= randomNum 1 )
        ( begin
        ( Spaces "pizza" 0 0 )
        "pizza" );fin begin
        ;else
        ( if (= randomNum 2 )
             ( begin
                ( Spaces "amor" 0 0 )
             "amor" );fin begin
             ;else
             ( if (= randomNum 3 )
                  ( begin
                     ( Spaces "caja" 0 0 )
                     "caja" );fun
                  ;else
                  ( if (= randomNum 4 )
                       ( begin
                          ( Spaces "universo" 0 0 )
                          "universo" )
                       ;else
                       ( begin
                          ( Spaces "carretera" 0 0 )
                          "carretera");fin begin
                       );fin if randomNum 1
                  );fin if randomNum 2
             );fin if randomNum 3
        );fin if randomNum 4
   );fin definicion funcion RandomWords

;Esta funcion, se encarga de que al ser llamada, de acuerdo a un numero aleatorio nos de una de 5 palabras que tiene dentro de su structura, que a la vez kkaman a otra
;funcion que es Spaces, para dibujar las lineas de guia.
;------------------------------------------------------------------------------------------------------------------------------------------------

( define ( MainStringChecker word letter string savedString deathNumber counter )
   ( if  ( boolean=? ( Comparer counter word ) #t )
         ( begin
            ( ( draw-string game ) (make-posn 350 200 ) "Ganaste." "white" )
            1
             );fin begin
         ;else
         ( if  ( char=?  ( string-ref savedString ( StringIndex string letter 0 )  ) #\+ )
                ( GameFunction word ( CheckLetter ( MouseClick ) ) deathNumber savedString counter )
                ;else
               ( WordReader word letter 0 0 counter deathNumber ( ChangeChar savedString #\+ ( StringIndex string letter 0 ) ) ) )
         );fin if
   );fin definicion funcion MainStringCheck

;Esta funcion llama a Comparer y le entrega de parametros counter que es la acumulacion de aciertos del jugador y word que es la palabra, para
;despues compara que tipo de booleano devuelve la funcion que llama antes y si es #t entonces se mostrará qie el juego ha terminado, si el booleano es #f
;entomces salta a la proxima funcion que seria la funcion principal, despues de que se cumpla otra condicion.
;esta funcion devuelve 1 porque si se deja solo el display este devolvera un void y este no se acepta como valor dentro de la funcion.
;-----------------------------------------------------------------------------------------------------------------------------------------------

( define ( CheckLetter position )
   ( if ( and (>= ( posn-x position ) 500 ) (< ( posn-x position ) 546 ) (>= ( posn-y position ) 40 ) (< ( posn-y position ) 86 ) )
        ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 500 40 ) ) #\a ); fin brgin           ;else
        ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 40 ) (< ( posn-y position ) 86 ) )
            ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 40 ) ) #\á ); fin begin              ;else 
             ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 40 ) (< ( posn-y position ) 86 ) )
                  ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 40 ) ) #\b ); fin begin           ;else
                  ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 40 ) (< ( posn-y position ) 86 ) )
                       ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 40 ) ) #\c ); fin begin         ;else
                       ( if ( and (>= ( posn-x position ) 700 ) (< ( posn-x position ) 746 ) (>= ( posn-y position ) 40 ) (< ( posn-y position ) 86 ) )
                            ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 700 40 ) ) #\d ); fin begin         ;else
                            ( if ( and (>= ( posn-x position ) 500 ) (< ( posn-x position ) 546 ) (>= ( posn-y position ) 90 ) (< ( posn-y position ) 136 ) )
                                ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 500 90 ) ) #\e ) ; fin begin         ;else
                                 ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 90 ) (< ( posn-y position ) 136 ) )
                                     ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 90 ) ) #\é ) ; fin begin         ;else
                                      ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 90 ) (< ( posn-y position ) 136 ) )
                                          ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 90 ) ) #\f ) ; fin begin         ;else
                                           ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 90 ) (< ( posn-y position ) 136 ) )
                                                ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 90 ) ) #\g ); fin begin         ;else
                                                ( if ( and (>= ( posn-x position ) 700 ) (< ( posn-x position ) 746 ) (>= ( posn-y position ) 90 ) (< ( posn-y position ) 136 ) )
                                                    ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 700 90 ) ) #\h ) ; fin begin         ;else
                                                     ( if ( and (>= ( posn-x position ) 500 ) (< ( posn-x position ) 546 ) (>= ( posn-y position ) 140 ) (< ( posn-y position ) 186 ) )
                                                         ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 500 140 ) ) #\i ) ; fin begin         ;else
                                                          ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 140 ) (< ( posn-y position ) 186 ) )
                                                              ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 140 ) ) #\í ) ; fin begin         ;else
                                                               ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 140 ) (< ( posn-y position ) 186 ) )
                                                                   ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 140 ) ) #\j ) ; fin begin         ;else
                                                                    ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 140 ) (< ( posn-y position ) 186 ) )
                                                                        ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 140 ) ) #\k ) ; fin begin         ;else
                                                                         ( if ( and (>= ( posn-x position ) 700 ) (< ( posn-x position ) 746 ) (>= ( posn-y position ) 140 ) (< ( posn-y position ) 186 ) )
                                                                              ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 700 140 ) ) #\l ); fin begin         ;else
                                                                              ( if ( and (>= ( posn-x position ) 500 ) (< ( posn-x position ) 546 ) (>= ( posn-y position ) 190 ) (< ( posn-y position ) 236 ) )
                                                                                  ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 500 190 ) ) #\m ); fin begin         ;else
                                                                                   ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 190 ) (< ( posn-y position ) 236 ) )
                                                                                       ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 190 ) ) #\n ); fin begin         ;else
                                                                                        ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 190 ) (< ( posn-y position ) 236 ) )
                                                                                            ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 190 ) ) #\ñ ); fin begin         ;else
                                                                                             ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 190 ) (< ( posn-y position ) 236 ) )
                                                                                                  ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 190 ) ) #\o ); fin begin         ;else
                                                                                                  ( if ( and (>= ( posn-x position ) 700 ) (< ( posn-x position ) 746 ) (>= ( posn-y position ) 190 ) (< ( posn-y position ) 236 ) )
                                                                                                       ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 700 190 ) ) #\ó ); fin begin         ;else
                                                                                                       ( if ( and (>= ( posn-x position ) 500 ) (< ( posn-x position ) 546 ) (>= ( posn-y position ) 240 ) (< ( posn-y position ) 286 ) )
                                                                                                            ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 500 240 ) ) #\p ); fin begin         ;else
                                                                                                            ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 240 ) (< ( posn-y position ) 286 ) )
                                                                                                                 ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 240 ) ) #\q ); fin begin         ;else
                                                                                                                 ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 240 ) (< ( posn-y position ) 286 ) )
                                                                                                                      ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 240 ) ) #\r ); fin begin         ;else
                                                                                                                      ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 240 ) (< ( posn-y position ) 286 ) )
                                                                                                                           ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 240 ) ) #\s ); fin begin         ;else
                                                                                                                           ( if ( and (>= ( posn-x position ) 700 ) (< ( posn-x position ) 746 ) (>= ( posn-y position ) 240 ) (< ( posn-y position ) 286 ) )
                                                                                                                                ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 700 240 ) ) #\t ); fin begin         ;else
                                                                                                                                ( if ( and (>= ( posn-x position ) 500 ) (< ( posn-x position ) 546 ) (>= ( posn-y position ) 290 ) (< ( posn-y position ) 336 ) )
                                                                                                                                     ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 500 290 ) ) #\u ); fin begin         ;else
                                                                                                                                     ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 290 ) (< ( posn-y position ) 336 ) )
                                                                                                                                          ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 290 ) ) #\ú ); fin begin         ;else
                                                                                                                                          ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 290 ) (< ( posn-y position ) 336 ) )
                                                                                                                                               ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 290 ) ) #\ü ); fin begin         ;else
                                                                                                                                               ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 290 ) (< ( posn-y position ) 336 ) )
                                                                                                                                                    ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 290 ) ) #\v ); fin begin         ;else
                                                                                                                                                    ( if ( and (>= ( posn-x position ) 700 ) (< ( posn-x position ) 746 ) (>= ( posn-y position ) 290 ) (< ( posn-y position ) 336 ) )
                                                                                                                                                         ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 700 290 ) ) #\w ); fin begin         ;else
                                                                                                                                                         ( if ( and (>= ( posn-x position ) 550 ) (< ( posn-x position ) 596 ) (>= ( posn-y position ) 340 ) (< ( posn-y position ) 386 ) )
                                                                                                                                                              ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 550 340 ) ) #\x ); fin begin         ;else
                                                                                                                                                              ( if ( and (>= ( posn-x position ) 600 ) (< ( posn-x position ) 646 ) (>= ( posn-y position ) 340 ) (< ( posn-y position ) 386 ) )
                                                                                                                                                                   ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 600 340 ) ) #\y ); fin begin         ;else
                                                                                                                                                                   ( if ( and (>= ( posn-x position ) 650 ) (< ( posn-x position ) 696 ) (>= ( posn-y position ) 340 ) (< ( posn-y position ) 386 ) )
                                                                                                                                                                        ( begin  ( ( draw-pixmap game ) "tapa.png" ( make-posn 650 340 ) ) #\z ); fin begin         ;else
                                                                                                                                                                        0  );fin if
                                                                                                                                                                   );fin if
                                                                                                                                                              );fin if
                                                                                                                                                         );fin if
                                                                                                                                                    );fin if
                                                                                                                                               );fin if
                                                                                                                                          );fin if
                                                                                                                                     );fin if
                                                                                                                                );fin if
                                                                                                                           );fin if
                                                                                                                      );fin if
                                                                                                                 
                                                                                                                 );fin if
                                                                                                            );fin if
                                                                                                       );fin if
                                                                                                  );fin if
                                                                                             );fin if
                                                                                        );fin if
                                                                                   );fin if
                                                                              );fin if
                                                                         );fin if
                                                                    );fin if
                                                               );fin if
                                                          );fin if
                                                     );fin if
                                                );fin if
                                           );fin if
                                      );fin if
                                 );fin if
                            );fin if
                       );fin if
                  ;fin if
                  );fin if
             );fin if
        );fin if
   );fin definicion funcion

;Esta funcion determina, dependeidendo de en que posicion se dio click que caracter se quiere usar, además despues de hacer click se pone una imgen que hará el efecto
;de que la letra desaparece.
;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

( define ( DeadGame number word str counter )
   ( if (= number 1 )
        ( begin
           ( ( draw-pixmap game ) "pole.png" (make-posn 80 140 ) )
           ( GameFunction word ( CheckLetter ( MouseClick ) ) number str counter ) );fin begin
        ;else
        ( if (= number 2 )
             ( begin
                ( ( draw-pixmap game ) "roof.png" (make-posn 80 140 ) )
                ( GameFunction word ( CheckLetter ( MouseClick ) ) number str counter)  );fin begin
             ;else
             ( if (= number 3 )
                  ( begin
                     ( ( draw-pixmap game ) "stomach.png" (make-posn 80 140 ) )
                     ( GameFunction word ( CheckLetter ( MouseClick ) ) number str counter) );fin begin
                  ;else
                  ( if (= number 4 )
                       ( begin
                          ( ( draw-pixmap game ) "left.png" (make-posn 80 140 ) )
                          ( GameFunction word ( CheckLetter ( MouseClick ) ) number str counter) );fin begin
                       ;else
                       ( if (= number 5 )
                            ( begin
                               ( ( draw-pixmap game ) "leftyright.png" (make-posn 80 140 ) )
                               ( GameFunction word ( CheckLetter ( MouseClick ) ) number str counter) );fin begin
                            ;else
                            ( if (= number 6 )
                                 ( begin
                                    ( ( draw-pixmap game ) "corpse.png" (make-posn 80 140 ) )
                                    ( GameFunction word ( CheckLetter ( MouseClick ) ) number str counter) );fin begin
                                 ;else
                                 ( if (= number 7 )
                                      ( begin                                         
                                         ( ( draw-pixmap game ) "fondo.png" ( make-posn 0 0 ) )
                                         ( ( draw-string game ) (make-posn 350 200 ) "Ahorcado" "white" )
                                         ( ( draw-pixmap game ) "ahorcado.png" ( make-posn 90 100 ) )
                                          number )
                                      
                                      number ) ) ) ) ) ) ) );fin definicion funcion DeadGmae

;Esta funcion determina en que momento acava el juego, es decir, cada vez que el jugador se equivoque, se llamará esta funcion para que sepa que fallos ha tenido,
;cuando los fallos llegan a 7, el juego se acaba.
;En esta funcion se usa un number que seria las veces que ha perdido, word, para que se vaya pasando de funcion en funcion al igual que str y counter.
;----------------------------------------------------------------------------------------------------------------------------------------------------------------

( define ( MouseClick )
   ( define ubication ( get-mouse-click game ) )
   ( make-posn ( posn-x ( mouse-click-posn ubication ) ) ( posn-y ( mouse-click-posn ubication )
                                                                  ) ) );fin definicion funcion MouseCLick

;Esta funcion es la que toma la posicion del click en el viewport y la convierte en un posn, para que despues podamos dividirlo y tomar estos valores para las
;casillas de las letras.
;----------------------------------------------------------------------------------------------------------------------------------------------------------------

( define ( WordReader word letter number verificator counter deathNumber savedStr )
        ( if (< number ( string-length word ) )
        ( if ( char=? ( string-ref word number ) letter )
             ( begin
                ( display counter )
                ( ( draw-pixmap game ) ( string-append (~a letter ) ".png" ) ( make-posn (* 50 number ) 350 ) ) 
                ( WordReader word letter (+ number 1 ) (+ verificator 1 ) (+ counter 1 ) deathNumber savedStr )                                
                );fin begin                
             ( begin                
                ( WordReader word letter (+ number 1 ) verificator counter deathNumber savedStr )
                );fin begin
             );fin if
   ( if (> verificator 0 )
        ( begin
            (if (= counter ( string-length word ) )
           ( MainStringChecker word letter mainString savedStr deathNumber counter  )
           ( GameFunction word ( CheckLetter ( MouseClick ) ) deathNumber savedStr counter ) ) );fin begin
        ( begin
           ( DeadGame (+ deathNumber 1 ) word savedStr counter ) );fin begin
        );fin if
   );fin if
   );fin definicion funcion WordReader

;Esta funcion es una de las funciones principales del codigo, ya que se encarga de realizar las operaciones para determinar que si la letra que se ha intentado usar
;se puede usar, esta funcion toma los valores de word, letter, number, verificator, counter, deathNumber y savedStr para poder encontrar caracteres repetidos, sin usar, usados... etc.
;---------------------------------------------------------------------------------------------------------------------------------------------------------------
                 
( define ( GameFunction word letter deathNumber savedString counter )
   ( if ( number? letter )
           ( GameFunction word ( CheckLetter ( MouseClick ) ) deathNumber savedString counter )
           ( MainStringChecker word letter mainString savedString deathNumber counter) );fin if
   );fin definicion funcion Gamefunction

 ;Etsa funcion se encarga de manejar todo el juego llamando a las funciones importantes como MainStringChecker y verficando que se cumplan los requisitos.                                                                                        
;-------------------------------------------------------------------------------------------------------------------

( define ( RandomNumber )  
   ( random 1 6 ) );fin definicion funcion RandomNumber

;funcion que se usa para randomizar las palabras
;---------------------------------------------------------------------

( GameFunction ( RandomWords ( RandomNumber ) ) ( CheckLetter ( MouseClick ) ) 0 mainString 0 );llamada de la funcion GameFunction