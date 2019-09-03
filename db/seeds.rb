# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
Tuning.create(nombre_afinacion:"Tono estandar",		descripcion:"Mi  La  Re  Sol  Si  Mi")
Tuning.create(nombre_afinacion:"Medio tono abajo",	descripcion:"Re#  Sol#  Do#  Fa#  La#  Re#")
Tuning.create(nombre_afinacion:"Tono abajo",		descripcion:"Re  Sol  Do  Fa  La  Re")

Genre.create(nombre:"Rock alternativo")
Genre.create(nombre:"Indie rock")
Genre.create(nombre:"Indie pop")
Genre.create(nombre:"Hard rock")
Genre.create(nombre:"Pop rock")
Genre.create(nombre:"Britpop")

Chord.create(nombre_acorde:"Do")
Chord.create(nombre_acorde:"Re")
Chord.create(nombre_acorde:"Mi")
Chord.create(nombre_acorde:"La")
Chord.create(nombre_acorde:"Sol")
Chord.create(nombre_acorde:"La")
Chord.create(nombre_acorde:"Si")

Song.create(titulo: "bohemian rapsody", autor: "Freddie Mercury", album: "A nigth of opera",anio_creacion: 1975, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 1,url_video:"vsl3gBVO2k4")


Song.create(titulo: "Maroon 5", autor: "One more night", album: "Overexposed",anio_creacion: 2012, letra: "F                  G           Am\n
I miss the taste of the sweet life\n
F                 G          Am\n
I miss the conversation\n
F                      G                Am\n
I'm searching for a song tonight\n
F                     G             Am\n
I'm changing all of the stations\n
F                 G              Am\n
I like to think that we had it all\n
F                     G          Am\n
We drew a map to a better place\n
F                       G        Am\n
But on that road I'm super fall\n
F                 G               Am\n
Oh baby why did you run away?\n
           Dm\n
I was there for you\n
                Dm\n
In your darkest times\n
              Am\n
I was there for you\n
              Am\n
In your darkest nights\n ",genre_id: 3,tuning_id: 1,url_video:"7CPYoGtI75Q")


Song.create(titulo: "bohemian rapsody", autor: "Freddie Mercury", album: "A nigth of opera",anio_creacion: 1975, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 1,url_video:"vsl3gBVO2k4",user_id: 2 )
Song.create(titulo: "another one bites the dust", autor: "Freddie Mercury", album: "A nigth of opera",anio_creacion: 1980, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 2,url_video:"rY0WxgSXdEE",user_id: 2 )
Song.create(titulo: "all my love", autor: "Led zeppelin", album: "fly of heaven",anio_creacion: 1965, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 2,url_video:"rY0WxgSXdEE",user_id: 5 )

Song.create(titulo: "<script> alert(dfsdf); </script>", autor: "Led zeppelin", album: "fly of heaven",anio_creacion: 1965, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 2,url_video:"rY0WxgSXdEE",user_id: 5 )


=end
Song.create(titulo: "besos usados", autor: "Andres Cepeda", album: "Dia Tras Dia",anio_creacion: 2010, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 1,url_video:"cZmw2lQb2oQ",user_id: 2 )
Song.create(titulo: "bajo el agua", autor: "Manuel Medrano", album: "Bajo el agua",anio_creacion: 2015, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 2,url_video:"zLX_GcXt2pI",user_id: 2 )
Song.create(titulo: "al taller del maestro", autor: "Alex Campos", album: "al taller del maestro",anio_creacion: 2007, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 1,url_video:"VlwPoKbH5tw",user_id: 2 )
Song.create(titulo: "loco", autor: "Enrique Iglesias", album: "Loco",anio_creacion: 2013, letra: "esta es la letra dela cancion",genre_id: 1,tuning_id: 2,url_video:"RSyUWjftHrs",user_id: 2 )
