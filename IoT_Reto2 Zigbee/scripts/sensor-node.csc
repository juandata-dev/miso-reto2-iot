set ant 999
set it 0
battery set 100

atget id id
getpos2 lonSen latSen

loop
wait 20

inc it
print it

if (it >= 1000)
   cprint "Overflow, id," id
   data mens "stop" id bat it
   send mens ant
   stop
end

battery bat
if(bat < 5)
   data mens "critico" id bat it
   send mens ant
   stop
end

read mens
rdata mens tipo valor

if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   send mens ant
end

if(tipo=="stop")
   cprint "Detenido:," id
   wait 1000
   stop
end

delay 1000

areadsensor tempSen

rdata tempSen SensTipo idSens temp

if( temp > 30)
   data mens "alerta" id bat it
   send mens ant
end
