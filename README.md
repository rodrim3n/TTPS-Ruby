# TTPS-Ruby

### Instalación

```shell
  git clone https://github.com/rodrim3n/TTPS-Ruby

  bundle install

  rake db:migrate
  rake db:seed

  bundle exec rails s
```

## Uso

   En la barra navegadora tenemos link hacia los clientes y facturas, en ambas opciones hay un listado de todos los clientes/facturas del sistema con un link para ver mas informacion detallada sobre cada uno. Al final de los listado hay un boton de creacion de cliente/factura.
  En la creacion de clientes los datos son todos obligatorios, al cliente se le puede asignar de forma dinamica muchos contactos.
  En la creacion de facturas los campos son todos obligatorios, podemos seleccionar el cliente que emite la factura a traves de un select con filtrado donde estan todos los CUIT/CUIL de los clientes del sistema. Asimismo para la asignacion de la persona final a la que se le hace la factura, con el plus que podemos agregar una nueva en el momento.


## Seed de datos
  
  En el seed de datos se crearon 10 clientes, 10 personas finales a las cuales se le emiten facturas, y 30 facturas.

## Nota

  En cuanto a la interfaz grafica me quedaron algunas cosas desfasadas, y los test los hice a las apuradas, son cosas que reentregare en febrero.
