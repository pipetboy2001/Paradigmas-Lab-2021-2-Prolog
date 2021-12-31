%LAB 2 FELIPE FERNANDEZ

%TDAs
/*TDA Doc general:
- Representación: doc que contiene los listados de creacion de doc y los usuarios en sesión activa y usuarios registrados.
  TDA Usuario:
- Representación: lista que contiene los strings usuario, contraseña.
  TDA Create:
- Representación: doc que contiene autor, string fecha, string de lo que se escriba, lista de usuarios que lo ven, estado (Abierto 0 o cerrado 1), id pregunta.
- Modificadores: cambiarEstado(Id del doc, usuario autor, contraseña,nuevo doc, doc de preguntas editada).
- Selectores: getId(stackPregunta, IdObtenido). getAutor(Id de la pregunta, stackPreguntas, Nombre de usuario del autor, contraseña).
  TDA Respuesta:
- Representación: doc que contiene autor, string fecha, string respuesta, lista de usuarios, id de la pregunta respondida, id de la respuesta.
- Selectores: getId(stackRespuesta, IdObtenido). getAutor(Id de la respuesta, stackRespuestas, Nombre de usuario del autor, contraseña).
*/

%Predicados secundarios
/*
estaObjeto(objeto a borrar, lista).
getId(Lista Doc creado, Id).
getAutor(Id, stack Doc creado, nombre de usuario, contraseña del usuario).
borrarObjeto(objeto a borrar, lista, lista sin objeto).
cambiarEstado(Id de la pregunta, Usuario autor, contraseña, CreateCambiado, CreateCambiado, Create Cambiado con la pregunta cerrada).
cambioDocActual(Usuario, contraseña, nuevo cambio, lista de usuario, lista de usuario, lista de usuario con el cambio del usuario).
estaId(Id, stack Doc creado).
*/
/*
register(Docinicial, nombre de usuario, contraseña, DocFinal).
login(Docinicial, nombre de usuario, contraseña, DocFinal).
Create(Docinicial, fecha, pregunta, lista de tags, DocFinal).
Share(DocInicial,fecha,id del doc, permiso,DocFinal)
Add(Docinicial, fecha, id del doc, agregar palabra, lista de usuario, DocFinal).
Restore(Docinicial, id de doc actual, id del doc nuevo, DocFinal).
*/
%Cláusulas secundarias

%saber si esta lo pedido (login)
%estaObjeto(objeto a borrar, lista).
estaObjeto(X,[X|_]):-!.
estaObjeto(X,[_|R]):-estaObjeto(X,R).

%obtener el ID (post ,Add ,share)
%getId(Lista Doc creado, Id).
getId([[_,_,_,_,_,Id]|_], Id).
%revisar si concuerdan los ID (share and Add)
%estaId(Id, GoogleDoc Doc creado).
estaId(Id,[[_,_,_,_,_,Id]|_]):-!.
estaId(Id,[_|Resto]):-estaId(Id,Resto).

%cambiar el estado 
%cambiarEstado(Id de la pregunta, Usuario autor, contraseña, CreateCambiado, CreateCambiado, Create Cambiado con la pregunta cerrada).
cambiarEstado(Id, User, Pass, ListaOriginal, [[[User, Pass],Fecha,Pregunta,Tags, _, Id]|_], [[[User, Pass],Fecha,Pregunta,Tags, 1, Id]|PreguntasEdit]):-borrarObjeto([[User, Pass],Fecha,Pregunta,Tags, _, Id], ListaOriginal, PreguntasEdit),!.
cambiarEstado(Id, User, Pass, ListaOriginal, [_|Create], Resultado):-cambiarEstado(Id, User, Pass, ListaOriginal,Create, Resultado).

%obtener el autor o creador (como se le quiera decir)
%GetAutor(Id, stack Doc creado, nombre de usuario, contraseña del usuario)
getAutor(Id, [[[User, Pass], _,_,_,_,Id]|_], User, Pass):-!.
getAutor(Id, [_|Resto], User, Pass):-getAutor(Id, Resto, User, Pass).

%BORRA ANTERIOR
%borrarObjeto(objeto a borrar, lista, lista sin objeto).
borrarObjeto(X, [X|T], T).
borrarObjeto(X, [H|T], [H|TailEdit]):-borrarObjeto(X, T, TailEdit).

%cambia el estado al anterior segun el ID que se le indique
%cambioDocActual(Usuario, contraseña, nuevo cambio, lista de usuario, lista de usuario, lista de usuario con el cambio del usuario).
cambioDocActual(User, Pass, Cantidad, ListaOriginal, [[User, Pass, Rep]|_], [[User,Pass,RepEdit]|UsuariosEditado]):-borrarObjeto([User, Pass, Rep], ListaOriginal, UsuariosEditado), RepEdit is Cantidad + Rep, !.
cambioDocActual(User, Pass, Cantidad, ListaOriginal, [_|Registrados], Resultado):-cambioDocActual(User,Pass,Cantidad,ListaOriginal,Registrados, Resultado).



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
register([Restorar,Add,Share,Create,UsuariosActivos,Registrados], User, Pass, [Restorar,Add,Share,Create,UsuariosActivos,[[User,Pass,10]|Registrados]]).
/**Ejemplo de uso: **

register([],"pipe","pass",GoogleDoc2).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),register(GoogleDoc4,"user","pass2",GoogleDoc5).

*/

%-----------------------------------------------------------------------------------
%login (socialNetworkLogin)
%---------------------------------------------------------------------------------
%funcionalidad:GoogleDoc que permite a un usuario ingresar en la red social
%Dom: User(String) , Pass(String)
%Rec: User(String) , Pass (String)

login([_,_,_,_,_,[]], _, _, _):-false.
login([Restorar,Add,Share,Create, UsuariosActivos, Registrados], User, Pass, [Restorar,Add,Share,Create, [[User,Pass]|UsuariosActivos], Registrados]):-estaObjeto([User,Pass,_], Registrados).
/**Ejemplos de uso**

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3).
register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),login(GoogleDoc3,"pipe","pass",GoogleDoc4).
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4).
register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),login(GoogleDoc4,"pipe","pass",GoogleDoc5).
*/

%-----------------------------------------------------------------------------------
%post (socialNetworkLogin)
%---------------------------------------------------------------------------------

%Funcionalidad:GoogleDoc que permite publicar una publicacion
%DOM : Fecha (String ), Publicacion(String), UserList(Lista de String)
%REC : Fecha (String) , Publicacion (String)

post([[_],[_],[_],[_],[],[_]], _, _, _, _):-false.
post([Restorar,Add,Share, [], [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Share,[[[User,Pass], Fecha, Publicacion, UserList, 0, 1]], [], Registrados]).
post([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Share, [[[User,Pass], Fecha, Publicacion, UserList, 0, IdPost]|Create], [], Registrados]):-getId(Create, Id),IdPost is Id+1.
/**Ejemplos de uso**

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),post(GoogleDoc3, "1.1.2021", "publicacion1", ["user1","user2"], GoogleDoc4).

register([],"user1","pass",GoogleDoc2),login(GoogleDoc2,"user1","pass",GoogleDoc3),post(GoogleDoc3, "1.3.2021", "Existe?", ["user1","user2"], GoogleDoc4).

register([],"Juan","pass",GoogleDoc2),login(GoogleDoc2,"Juan","pass",GoogleDoc3),post(GoogleDoc3, "1.3.2021", "que lindo dia", ["user1","user2"], GoogleDoc4).

register([],"pipe","pass",GoogleDoc2),login(GoogleDoc2,"pipe","pass",GoogleDoc3),register(GoogleDoc3,"user","pass2",GoogleDoc4),login(GoogleDoc4,"pipe","pass",GoogleDoc5),post(GoogleDoc6, "1.3.2021", "esto es un post", ["user1","user2"], GoogleDoc7).
**

*/
/*y como funciona?*/
%registras a pipe , login pipe , post pipe

%------------------------------------------------------------------------------------
%Share
%------------------------------------------------------------------------------------
%funcionalidad:GoogleDoc que permite a un usuario compatir un post de otra persona 
%Dom: fecha(string) , ID(Number) , UserList(Lista de string)
%Rec: Post(String)

share([_,_,[],_, _, _], _, _, _, _):-false.
share([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, IdShare, Permiso, [Restorar,Add,[[[User,Pass], Fecha, IdShare, Permiso, 1, 1]|Share], Create, [], Registrados]).
share([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Fecha, IdShare, Permiso, [Restorar,Add,[[[User,Pass], Fecha, IdShare,Permiso,0,idPost]|Share],Create, [], Registrados])
:-estaId(IdShare, Create),getId(Share, Id),IdShare is Id+1.

/**ejemplo de uso**

register([],"Pipe","pass",GoogleDoc2),register(GoogleDoc2,"juan","pass2",GoogleDoc3),login(GoogleDoc3,"Pipe","pass",GoogleDoc4),post(GoogleDoc4, "1.1.2021", "Publicacion1", ["user1","user2"], GoogleDoc5),login(GoogleDoc6,"juan","pass2",GoogleDoc7), share(GoogleDoc7, "2.3.2021" , 1 , "R", GoogleDoc8 ).

*/

/*y como funciona?*/
%registras a pipe , registras a juan , ingresa pipe , postea pipe , ingresa juan , comparte lo de pipe
%buscador de id si existe , aplicar funcion Post

%----------------------------------
%add 
%----------------------------------
%funcionalidad:GoogleDoc que permite a un usuario comentar un post de otra persona  
%Dom: idPost x UserList (list de string) x fecha
%Rec: date X postID X string (comentario)

add([_,[],_,_, _, _], _, _, _, _, _):-false.
add([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, IdPost, Comenta, UserList, [Restorar,[[[User,Pass], Fecha, Comenta, UserList, IdPost, 1]|Add],Share,Create, [], Registrados]).
add([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Fecha, IdPost, Comenta, UserList, [Restorar,[[[User,Pass], Fecha, Comenta, UserList, IdPost, IdRespuesta]|Add],Share,Create, [], Registrados])
:-estaId(IdPost, Create),getId(Add, Id), IdRespuesta is Id+1.
/**Ejemplos de uso**

register([],"pipe","pass",GoogleDoc2),register(GoogleDoc2,"user","pass2",GoogleDoc3),login(GoogleDoc3,"pipe","pass",GoogleDoc4),post(GoogleDoc4, "1.1.2021", "pregunta1", ["user1","user2"], GoogleDoc5),login(GoogleDoc5,"user","pass2",GoogleDoc6),add(GoogleDoc6, "2.1.2020", 1, "en efecto", ["user1", "user2", "user3"], GoogleDoc7).

*/

%----------------------------------
%Restorar
%----------------------------------
%funcionalidad
%Dom ParadigmaDocs X int X int X ParadigmaDocs 
restorar([[],_,_,[], _, _], _, _, _, _):-false.
restorar([_,Add,_, Create, [[User,Pass]], Registrados], IdPost, NewId, [Add, CreateEditado, [], RegistradosEditado2] ):-
estaId(IdPost, Create), estaId(NewId, Add),
  cambiarEstado(IdPost, User, Pass, Create, Create, CreateEditado), getAutor(NewId, Add, UserAutorRespuesta, PassAutorRespuesta),
  cambioDocActual(UserAutorRespuesta, PassAutorRespuesta, 15, Registrados, Registrados, RegistradosEditado), cambioDocActual(User,Pass,2,RegistradosEditado, RegistradosEditado, RegistradosEditado2).

%primero el idPost a
%luego que devuelvemos
%parametros 0 a 1
/*ejemplo de uso 

restorar([[[["user1","pass1"], "1.1.2020", "Pregunta1", ["tag1"]]], [[["user2", "pass2"], "2.1.2020", "ola?", ["tag1"], 0, 1]], [["user2", "pass2"]], [["user1", "pass1"], ["user2", "pass2"]]], 1, 1, GoogleDoc2).

*/


%-------------------------------------
% paradigmaDocsSearch:
%...................................
%dom paradigmaDocs X string X List Document 

search([_,_,_,[],_,_],_,_):-false.
search([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Buscar, [Restorar,Add,[[[User,Pass], Buscar]],Create, Registrados]).
search([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Buscar , [Restorar,Add,[[[User,Pass], Buscar]],Create, Registrados])
:-(estaUser(Buscar,Follow)).

%revisar si estab el string (search)
%estaUser(Usuario en encontrar, lista de usuario).
estaUser(Seguidor,[_,_,Seguidor]|_ ):-!.
estaUser(Seguidor,[_|Resto]):-estaUser(Seguidor,Resto).

/*
register([],"Pipe","pass",Facebook2),register(Facebook2,"juan","pass2",Facebook3),login(Facebook3,"Pipe","pass",Facebook4),search(Facebook5,"juan",Facebook6).

*/

