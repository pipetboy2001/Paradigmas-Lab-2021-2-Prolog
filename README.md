Paradigmas Lab 2021-2 Prolog
lab 2 de paradigmas 
Felipe fernandez H.
2057568-1

Ejemplos de implementación de funciones pedidas por enunciado:

************************
Registrarse
************************
register([],"pipe","pass",GoogleDoc2).

register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3).

register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),register(GoogleDoc3,"user2","pass2",GoogleDoc4).

register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),register(GoogleDoc3,"user2","pass2",GoogleDoc4),register(GoogleDoc4,"user3","pass2",GoogleDoc5).


************************
Iniciar Sesion
************************
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3).

register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),login(GoogleDoc3,"pipe","pass",GoogleDoc4).

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4).

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),login(GoogleDoc4,"pipe","pass",GoogleDoc5).


************************
Create
************************

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),create(GoogleDoc3, "1.1.2021", "documento1", ["user1","user2"], GoogleDoc4).

register([],"user1","pass",GoogleDoc2),login(GoogleDoc2,"user1","pass",GoogleDoc3),create(GoogleDoc3, "1.3.2021", "Existe?", ["user1","user2"], GoogleDoc4).

register([],"Juan","pass",GoogleDoc2),login(GoogleDoc2,"Juan","pass",GoogleDoc3),create(GoogleDoc3, "1.3.2021", "que lindo dia", ["user1","user2"], GoogleDoc4).

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),login(GoogleDoc4,"pipe","pass",GoogleDoc5),create(GoogleDoc6, "1.3.2021", "esto es un create", ["user1","user2"], GoogleDoc7).


************************
Compartir
************************
register([],"Pipe","pass",GoogleDoc2),register(GoogleDoc2,"juan","pass2",GoogleDoc3),login(GoogleDoc3,"Pipe","pass",GoogleDoc4),create(GoogleDoc4, "1.1.2021", "documento1", ["pipe"], GoogleDoc5),login(GoogleDoc6,"juan","pass2",GoogleDoc7), share(GoogleDoc7, "2.3.2021" , 1 , "R", GoogleDoc8 ).

register([],"juan","pass",GoogleDoc2),register(GoogleDoc2,"simon","pass2",GoogleDoc3),login(GoogleDoc3,"juan","pass",GoogleDoc4),create(GoogleDoc4, "1.1.2021", "documento2", ["user1","user2"], GoogleDoc5),login(GoogleDoc6,"simon","pass2",GoogleDoc7), share(GoogleDoc7, "2.3.2022" , 2 , "W", GoogleDoc8 ).

register([],"matt","pass",GoogleDoc2),register(GoogleDoc2,"petter","pass2",GoogleDoc3),login(GoogleDoc3,"matt","pass",GoogleDoc4),create(GoogleDoc4, "1.1.2021", "documento3", ["user1","user2"], GoogleDoc5),login(GoogleDoc6,"petter","pass2",GoogleDoc7), share(GoogleDoc7, "1.2.2022" , 3 , "R", GoogleDoc8 ).

register([],"genesis","pass",GoogleDoc2),register(GoogleDoc2,"pikachu","pass2",GoogleDoc3),login(GoogleDoc3,"genesis","pass",GoogleDoc4),create(GoogleDoc4, "1.1.2021", "documento4", ["user1","user2"], GoogleDoc5),login(GoogleDoc6,"pikachu","pass2",GoogleDoc7), share(GoogleDoc7, "2.4.2021" , 4 , "W", GoogleDoc8 ).


************************
Añadir
************************
register([],"Pipe","pass",GoogleDoc2),registerregister([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),login(GoogleDoc3,"pipe","pass",GoogleDoc4),create(GoogleDoc4, "1.1.2021", "añadir1", ["user1","pipe"], GoogleDoc5),login(GoogleDoc5,"user","pass2",GoogleDoc6),add(GoogleDoc6, "2.1.2020", 1, "en efecto", ["user1","pipe"], GoogleDoc7).

register([],"juan","pass",GoogleDoc2),register(GoogleDoc2,"user2","pass2",GoogleDoc3),login(GoogleDoc3,"juan","pass",GoogleDoc4),create(GoogleDoc4, "2.1.2021", "añadir2", ["juan","user3"], GoogleDoc5),login(GoogleDoc5,"user2","pass2",GoogleDoc6),add(GoogleDoc6, "2.1.2020", 1, "sis", ["juan","user3"], GoogleDoc7).

register([],"sofia","pass",GoogleDoc2),register(GoogleDoc2,"user3","pass2",GoogleDoc3),login(GoogleDoc3,"sofia","pass",GoogleDoc4),create(GoogleDoc4, "3.1.2021", "añadir3", ["sofia","user2"], GoogleDoc5),login(GoogleDoc5,"user3","pass2",GoogleDoc6),add(GoogleDoc6, "2.1.2020", 1, "añado otra linea wii", ["sofia", "user2"], GoogleDoc7).


************************
Restorar
************************
restore([[[["user1","pass1"], "1.1.2020", "en efecto", ["w"], 1, 1]], [[["user2", "pass2"], "2.1.2020", "ola?", ["w"], 0, 1]], [["user2", "pass2"]], [["user1", "pass1", 10], ["user2", "pass2", 10]]], 1, 1, GoogleDoc2).

restore([[[["Thanatos","pass1"], "1.1.2020", "up", ["w"], 1, 1]], [[["TartarusIndominus", "pass2"], "2.1.2020", "esto es otra linea de doc?", ["w"], 0, 1]], [["TartarusIndominus", "pass2"]], [["Thanatos", "pass1", 10], ["TartarusIndominus", "pass2", 10]]], 1, 1, GoogleDoc2).

restore([[[["SovietTovarich99","pass1"], "1.1.2020", "yes", ["w"], 1, 1]], [[["BonaparteWaterloo", "pass2"], "2.1.2020", " es gratis poder editar!", ["w"], 0, 1]], [["BonaparteWaterloo", "pass2"]], [["SovietTovarich99", "pass1", 10], ["BonaparteWaterloo", "pass2", 10]]], 1, 1, GoogleDoc2).


************************
Buscar
************************
register([],"Pipe","pass",GoogleDoc2),register(GoogleDoc2,"juan","pass2",GoogleDoc3),login(GoogleDoc3,"Pipe","pass",GoogleDoc4),search(GoogleDoc5,"juan",GoogleDoc6).

register([],"simon","pass",GoogleDoc2),register(GoogleDoc2,"sofia","pass2",GoogleDoc3),login(GoogleDoc3,"simon","pass",GoogleDoc4),search(GoogleDoc5,"sofia",GoogleDoc6).

register([],"simone","pass",GoogleDoc2),register(GoogleDoc2,"sofiaa","pass2",GoogleDoc3),login(GoogleDoc3,"simone","pass",GoogleDoc4),search(GoogleDoc5,"sofiaa",GoogleDoc6).



