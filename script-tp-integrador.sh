#!/bin/bash

clear
###########################################################################################################################################################
###########################################################################################################################################################
fibonacci(){
clear

echo -n "Ingresar un número :"
read Num

f1=0  #guardo la primeras variables 0 y 1 ya que la sucecion de fibonacci empieza con estos 
f2=1

echo "La secuencia de Fibonacci para $Num es : "

for ((i=0; i<=$Num; i++)); do
     echo -en  "$f1 " # la opcion "n" interrumpe la siguiente linea
     fn=$((f1 + f2))
     f1=$f2
     f2=$fn
done
echo
echo
echo "para regresar al menu principal presione Enter..."
read E
case $E in

1) main;;

esac
echo
}
#########################################################################################################################################################
#########################################################################################################################################################
invertido () {
# 
#invertimos el numero que ingresemos por consola 
#descubri tambien que hay un comando  llamado rev:invierte lineas de archivos
#ejemplo:#echo 345 | rev ->543  
echo "Ingrese un numero entero: "
read num
len=$num
reverse=""
for (( i=$len-1; i>=0; i-- ))
do
    reverse="$reverse${num:$i:1}"
done
   echo "el numero invertido: $reverse" 
echo
echo
   echo "para regresar al menu principal presione Enter..."
read E
case $E in

   1) main;;

esac

}
########################################################################################################################################################
########################################################################################################################################################
palindromo () {

#verificamos si la frase o palabra que ingresemos es palindromo(es aquella, palabra, una frase, #un número u otro de la secuencia de unidades que tiene la propiedad de la lectura de la misma #en cualquier dirección .) 

echo "ingrese una cadena de caracteres..."
read cha

reverse="$(echo $cha | rev )"



if [[ $cha == $reverse ]]; then
    
 echo "es palindromo"

else

 echo "NO es palindromo"

fi
echo
   echo "para regresar al menu principal presione Enter..."
read E
case $E in

   1) main;;
esac
}
#####################################################################################################################################################
#####################################################################################################################################################
directorio() {
#filtro la lista y especifico que coincida en el comienzo de la linea d(directorio)-(regular)b(bloque)c(caracter) caracter que comience -l(enlance)-s(socket)-p(pipe)

echo -e "Ingrese la ruta del directorio que desea encontrar: "
read destino
    
    tipod="$(ls -la $destino | grep '^d' | wc -l)"
   echo "cantidad de tipo  directorio: $tipod "   
    tipor="$(ls -la $destino | grep '^-' | wc -l)"
   echo "cantidad de tipo  regular: $tipor "   
    tipob="$(ls -la $destino | grep '^b' | wc -l)"
   echo "cantidad de tipo bloque: $tipob "
     tipoc="$(ls -la $destino | grep '^c' | wc -l)"
   echo "cantidad de tipo caracter: $tipoc "
     tipol="$(ls -la $destino | grep '^l' | wc -l)"
   echo "cantidad de tipo de enlace: $tipol "
     tipop="$(ls -la $destino | grep '^p' | wc -l)"
   echo "cantidad de tipo de directorio: $tipop "    

#    tipo="$(ls -la $destino | grep '^[d\-\b\c\l\s\p]') | wc -l"  
#   echo "los tipos de archivos que tiene el directorio totales: $tipo  "
   
   echo "para regresar al menu principal presione Enter..."
      read E

   case $E in
       1) main;;
   esac

}

#########################/////////////////////////PRINCIPAL\\\\\\\\\\\\\\\\\\\\##########################################

main () {



while true ;do

clear

echo -e " \t Alumno: Carlos Villalba "
echo -e " \t script de TP integrador: seleccione del 1-6 que desea hacer \n "   
  
   echo  -e "1_ingresar un numero entero para mostrar cantidad de elementos de la sucesion
de Fibonacci \n"

   echo -e "2_ingresar un numero entero y mostrar el numero invertido \n"

   echo -e "3_pedir cadena de caracteres(se evalua si es palindromo o no) \n"

   echo -e "4_Ingrese el path de un archivo de texto \n" #mostrar cantidad de lineas

   echo -e "5_Ingresar 5 numeros enteros \n" #mostrarlo en forma ordenada

   echo -e "6_Ingresar el path de un directorio \n" #mostrar cuantos archivos de c/tipo

   echo "7_Salir" #saludando a usuario que lo ejecuta

read opt_main

case $opt_main in

   1) fibonacci ;;
   2) invertido ;;
   3) palindromo ;;
   4) echo "ingrese la ruta destino del archivo que desea encontrar: " 
read destino
    lineas="$(cat $destino | wc -l)"
   echo -e "cantidad de lineas del archivo $lineas \n"  

   echo "para regresar al menu principal presione Enter..."
      read E

   case $E in
       1) main;;
   esac
;;
##################################################################################################################################   
    5) echo "debe ingresar hasta 5 numeros..."
       regla='^[0-9]+$'
      
        echo "ingrese un numero: "
           read num     
#        if [ $num -eq $regla ]; then
           var1=$num
                
#        fi
        echo "ingrese un numero: "
           read num       
#        if [ $num -eq $regla ]; then
           var2=$num
           
#        fi
        echo "ingrese un numero: "
           read num      
#        if [ $num -eq $regla ]; then
           var3=$num
#        fi
        echo "ingrese un numero: "
           read num       
#        if [ $num -eq $regla ]; then
           var4=$num
#        fi
        echo "ingrese un numero: "
          read num      
#        if [ $num -eq $regla ]; then
           var5=$num
#        fi
        

   echo -e  "ordenado:\n $var1\n $var2\n $var3\n $var4\n $var5" | sort -n
   echo 
   echo "presione Enter para ir al menu "
    read E
case $E in
    1) menu 
esac
;; 

 
   6) directorio ;;
   7) echo "adios " `whoami`                              
      exit 0 ;;                                          
   *) echo "opcion incorrecta seleccione del 1-7!" 
      sleep 2s ;;
esac
done   
   
}
main  #muestro en principal el menu...
exit 0   
###################################################################################################################
###################################################################################################################

