%saber si esta lo pedido (login)
%estaObjeto(objeto a borrar, lista).
estaObjeto(X,[X|_]):-!.
estaObjeto(X,[_|R]):-estaObjeto(X,R).

%obtener el ID (post ,Add ,share)
%getId(Lista respuestas o preguntas, Id).
getId([[_,_,_,_,_,Id]|_], Id).
%revisar si concuerdan los ID (share and Add)
<<<<<<< HEAD
%estaId(Id, GoogleDoc respuestas o preguntas).
=======
%estaId(Id, Google respuestas o preguntas).
>>>>>>> main
estaId(Id,[[_,_,_,_,_,Id]|_]):-!.
estaId(Id,[_|Resto]):-estaId(Id,Resto).

%------------------------------------------------------------------------
%REGISTER
%------------------------------------------------------------------------
%
%funcionalidad:permite a un usuario registrarse en una red social
%Dom: User(String) , Pass(String)
%Rec: User(String) , Pass (String)

%(
register([], User, Pass, [[],[],[],[],[],[[User,Pass,10]]]).
register([[_],[_],[_],[_],[_],[[User,Pass]]], User, Pass, [[_],[_],[_],[_],[_],[_],[[User,Pass,10]]]).
register([Restorar,Add,Add,Create,UsuariosActivos,Registrados], User, Pass, [Restorar,Add,Add,Create,UsuariosActivos,[[User,Pass,10]|Registrados]]).
/**Ejemplo de uso: **

<<<<<<< HEAD
register([],"pipe","pass",GoogleDoc2).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),register(GoogleDoc4,"user","pass2",GoogleDoc5).
=======
register([],"pipe","pass",Google2).
register([],"pipe","pass",Google2),register(Google2,"user","pass2",Google3).
register([],"pipe","pass",Google2),register(Google2,"user","pass2",Google3),register(Google3,"user","pass2",Google4).
register([],"pipe","pass",Google2),register(Google2,"user","pass2",Google3),register(Google3,"user","pass2",Google4),register(Google4,"user","pass2",Google5).
>>>>>>> main

*/

%-----------------------------------------------------------------------------------
%login (socialNetworkLogin)
%---------------------------------------------------------------------------------
%funcionalidad:Stack que permite a un usuario ingresar en la red social
%Dom: User(String) , Pass(String)
%Rec: User(String) , Pass (String)

login([_,_,_,_,_,[]], _, _, _):-false.
login([Restorar,Add,Add,Create, UsuariosActivos, Registrados], User, Pass, [Restorar,Add,Add,Create, [[User,Pass]|UsuariosActivos], Registrados]):-estaObjeto([User,Pass,_], Registrados).
/**Ejemplos de uso**

<<<<<<< HEAD
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),login(GoogleDoc3,"pipe","pass",GoogleDoc4).
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4).
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),login(GoogleDoc4,"pipe","pass",GoogleDoc5).
=======
register([],"pipe","pass",Google2),login(Google2,"pipe","pass",Google3).
register([],"pipe","pass",Google2),register(Google2,"user","pass2",Google3),login(Google3,"pipe","pass",Google4).
register([],"pipe","pass",Google2),login(Google2,"pipe","pass",Google3),register(Google3,"user","pass2",Google4).
register([],"pipe","pass",Google2),login(Google2,"pipe","pass",Google3),register(Google3,"user","pass2",Google4),login(Google4,"pipe","pass",Google5).
>>>>>>> main
*/

%-----------------------------------------------------------------------------------
%post (socialNetworkLogin)
%---------------------------------------------------------------------------------

%Funcionalidad:stack que permite publicar una publicacion
%DOM : Fecha (String ), Publicacion(String), UserList(Lista de String)
%REC : Fecha (String) , Publicacion (String)

post([[_],[_],[_],[_],[],[_]], _, _, _, _):-false.
post([Restorar,Add,Add, [], [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Add,[[[User,Pass], Fecha, Publicacion, UserList, 0, 1]], [], Registrados]).
post([Restorar,Add,Add, Create, [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Add, [[[User,Pass], Fecha, Publicacion, UserList, 0, IdPost]|Create], [], Registrados]):-getId(Create, Id),IdPost is Id+1.
/**Ejemplos de uso**

<<<<<<< HEAD
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),post(GoogleDoc3, "1.1.2021", "publicacion1", ["user1","user2"], GoogleDoc4).

register([],"user1","pass",GoogleDoc2),login(GoogleDoc2,"user1","pass",GoogleDoc3),post(GoogleDoc3, "1.3.2021", "Existe?", ["user1","user2"], GoogleDoc4).

register([],"Juan","pass",GoogleDoc2),login(GoogleDoc2,"Juan","pass",GoogleDoc3),post(GoogleDoc3, "1.3.2021", "que lindo dia", ["user1","user2"], GoogleDoc4).

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),login(GoogleDoc4,"pipe","pass",GoogleDoc5),post(GoogleDoc6, "1.3.2021", "esto es un post", ["user1","user2"], GoogleDoc7).
=======
register([],"pipe","pass",Google2),login(Google2,"pipe","pass",Google3),post(Google3, "1.1.2021", "publicacion1", ["user1","user2"], Google4).

register([],"user1","pass",Google2),login(Google2,"user1","pass",Google3),post(Google3, "1.3.2021", "Existe?", ["user1","user2"], Google4).

register([],"Juan","pass",Google2),login(Google2,"Juan","pass",Google3),post(Google3, "1.3.2021", "que lindo dia", ["user1","user2"], Google4).

register([],"pipe","pass",Google2),login(Google2,"pipe","pass",Google3),register(Google3,"user","pass2",Google4),login(Google4,"pipe","pass",Google5),post(Google6, "1.3.2021", "esto es un post", ["user1","user2"], Google7).
>>>>>>> main
**

*/
/*y como funciona?*/
%registras a pipe , login pipe , post pipe

%------------------------------------------------------------------------------------
%Share
%------------------------------------------------------------------------------------
%funcionalidad:Stack que permite a un usuario compatir un post de otra persona 
%Dom: fecha(string) , ID(Number) , UserList(Lista de string)
%Rec: Post(String)

share([_,_,[],_, _, _], _, _, _, _):-false.
<<<<<<< HEAD
share([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, IdShare, UserList, [Restorar,Add,[[[User,Pass], Fecha, IdShare, UserList, 1, 1]|Share], Create, [], Registrados]).
share([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Fecha, IdShare, UserList, [Restorar,Add,[[[User,Pass], Fecha, IdShare,UserList,0,idPost]|Share],Create, [], Registrados])
:-estaId(IdShare, Create),getId(Share, Id),IdShare is Id+1.

/**ejemplo de uso**

register([],"Pipe","pass",GoogleDoc2),register(GoogleDoc2,"juan","pass2",GoogleDoc3),login(GoogleDoc3,"Pipe","pass",GoogleDoc4),post(GoogleDoc4, "1.1.2021", "Publicacion1", ["user1","user2"], GoogleDoc5),login(GoogleDoc6,"juan","pass2",GoogleDoc7), share(GoogleDoc7, "2.3.2021" , 1 , ["user2"], GoogleDoc8 ).
=======
share([Restorar,Add,Add, Create, [[User,Pass]], Registrados], Fecha, IdShare, UserList, [Restorar,Add,[[[User,Pass], Fecha, IdShare, UserList, 1, 1]], Create, [], Registrados]).
share([Restorar,Add,Add,Create, [[User,Pass]], Registrados], Fecha, IdShare, UserList, [Restorar,Add,[[[User,Pass], Fecha, IdShare,UserList,0,idPost]|Add],Create, [], Registrados])
:-estaId(IdShare, Create),getId(Add, Id),IdShare is Id+1.

/**ejemplo de uso**

register([],"Pipe","pass",Google2),register(Google2,"juan","pass2",Google3),login(Google3,"Pipe","pass",Google4),post(Google4, "1.1.2021", "Publicacion1", ["user1","user2"], Google5),login(Google6,"juan","pass2",Google7), share(Google7, "2.3.2021" , 1 , ["user2"], Google8 ).
>>>>>>> main

*/

/*y como funciona?*/
%registras a pipe , registras a juan , ingresa pipe , postea pipe , ingresa juan , comparte lo de pipe
%buscador de id si existe , aplicar funcion Post

%----------------------------------
<<<<<<< HEAD
%add 
=======
%Add 
>>>>>>> main
%----------------------------------
%funcionalidad:Stack que permite a un usuario comentar un post de otra persona  
%Dom: idPost x UserList (list de string) x fecha
%Rec: date X postID X string (comentario)

<<<<<<< HEAD
add([_,[],_,_, _, _], _, _, _, _, _):-false.
add([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, IdPost, Comenta, UserList, [Restorar,[[[User,Pass], Fecha, Comenta, UserList, IdPost, 1]|Add],Share,Create, [], Registrados]).
add([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Fecha, IdPost, Comenta, UserList, [Restorar,[[[User,Pass], Fecha, Comenta, UserList, IdPost, IdRespuesta]|Add],Share,Create, [], Registrados])
:-estaId(IdPost, Create),getId(Add, Id), IdRespuesta is Id+1.
/**Ejemplos de uso**

register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),login(GoogleDoc3,"pipe","pass",GoogleDoc4),post(GoogleDoc4, "1.1.2021", "pregunta1", ["user1","user2"], GoogleDoc5),login(GoogleDoc5,"user","pass2",GoogleDoc6),add(GoogleDoc6, "2.1.2020", 1, "en efecto", ["user1", "user2", "user3"], GoogleDoc7).

*/

=======
Add([_,[],_,_, _, _], _, _, _, _, _):-false.
Add([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, IdPost, Comenta, UserList, [Restorar,[[[User,Pass], Fecha, Comenta, UserList, IdPost, 1]],Share, Create, [], Registrados]).
Add([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Fecha, IdPost, Comenta, UserList, [[[[User,Pass], Fecha, Comenta, UserList, IdPost, IdRespuesta]|Restorar],Add,Share,Create, [], Registrados])
:-estaId(IdPost, Create),getId(Restorar, Id), IdRespuesta is Id+1.
/**Ejemplos de uso**

register([],"pipe","pass",Google2),register(Google2,"user","pass2",Google3),login(Google3,"pipe","pass",Google4),post(Google4, "1.1.2021", "pregunta1", ["user1","user2"], Google5),login(Google5,"user","pass2",Google6),Add(Google6, "2.1.2020", 1, "en efecto", ["user1", "user2", "user3"], Google7).

*/

/*y como funciona?*/
%registras a pipe y user , ingresa pipe , postea pipe ,ingresa user , comenta user
%revisar si esta el id , y luego aplicar el y aumenta+1


>>>>>>> main
