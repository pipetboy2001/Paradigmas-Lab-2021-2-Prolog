%saber si esta lo pedido (login)
%estaObjeto(objeto a borrar, lista).
estaObjeto(X,[X|_]):-!.
estaObjeto(X,[_|R]):-estaObjeto(X,R).

%obtener el ID (post ,comment ,share)
%getId(Lista respuestas o preguntas, Id).
getId([[_,_,_,_,_,Id]|_], Id).


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

register([],"pipe","pass",Facebook2).
register([],"pipe","pass",Facebook2),register(Facebook2,"user","pass2",Facebook3).
register([],"pipe","pass",Facebook2),register(Facebook2,"user","pass2",Facebook3),register(Facebook3,"user","pass2",Facebook4).
register([],"pipe","pass",Facebook2),register(Facebook2,"user","pass2",Facebook3),register(Facebook3,"user","pass2",Facebook4),register(Facebook4,"user","pass2",Facebook5).

*/

%-----------------------------------------------------------------------------------
%login (socialNetworkLogin)
%---------------------------------------------------------------------------------
%funcionalidad:Stack que permite a un usuario ingresar en la red social
%Dom: User(String) , Pass(String)
%Rec: User(String) , Pass (String)

login([_,_,_,_,_,[]], _, _, _):-false.
login([Restorar,Add,Share,Create, UsuariosActivos, Registrados], User, Pass, [Restorar,Add,Share,Create, [[User,Pass]|UsuariosActivos], Registrados]):-estaObjeto([User,Pass,_], Registrados).
/**Ejemplos de uso**

register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3).
register([],"pipe","pass",Facebook2),register(Facebook2,"user","pass2",Facebook3),login(Facebook3,"pipe","pass",Facebook4).
register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3),register(Facebook3,"user","pass2",Facebook4).
register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3),register(Facebook3,"user","pass2",Facebook4),login(Facebook4,"pipe","pass",Facebook5).
*/

%-----------------------------------------------------------------------------------
%post (socialNetworkLogin)
%---------------------------------------------------------------------------------

%Funcionalidad:stack que permite publicar una publicacion
%DOM : Fecha (String ), Publicacion(String), UserList(Lista de String)
%REC : Fecha (String) , Publicacion (String)

post([[_],[_],[_],[_],[],[_]], _, _, _, _):-false.
post([Restorar,Add,Share, [], [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Share,[[[User,Pass], Fecha, Publicacion, UserList, 0, 1]], [], Registrados]).
post([Restorar,Add,Share, Publicaciones, [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Share, [[[User,Pass], Fecha, Publicacion, UserList, 0, IdPost]|Publicaciones], [], Registrados]):-getId(Publicaciones, Id),IdPost is Id+1.
/**Ejemplos de uso**

register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3),post(Facebook3, "1.1.2021", "publicacion1", ["user1","user2"], Facebook4).

register([],"user1","pass",Facebook2),login(Facebook2,"user1","pass",Facebook3),post(Facebook3, "1.3.2021", "Existe?", ["user1","user2"], Facebook4).

register([],"Juan","pass",Facebook2),login(Facebook2,"Juan","pass",Facebook3),post(Facebook3, "1.3.2021", "que lindo dia", ["user1","user2"], Facebook4).

register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3),register(Facebook3,"user","pass2",Facebook4),login(Facebook4,"pipe","pass",Facebook5),post(Facebook6, "1.3.2021", "esto es un post", ["user1","user2"], Facebook7).
**

*/
/*y como funciona?*/
%registras a pipe , login pipe , post pipe
