atget id id

data p "hola" id id
send p

loop
read mens
rdata mens tipo id bat it

if( tipo == "alerta")
   cprint "Alerta, id:," id ",batt:," bat ",iteracion:," it
end

if( tipo == "critico")
   cprint "Critico, id:," id ",batt:," bat ",iteracion:," it
   data p "stop"
   send p
   wait 1000
   stop
end

wait 100
