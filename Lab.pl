%saber si esta lo pedido (login)
%estaObjeto(objeto a borrar, lista).
estaObjeto(X,[X|_]):-!.
estaObjeto(X,[_|R]):-estaObjeto(X,R).

%obtener el ID (post ,comment ,share)
%getId(Lista respuestas o preguntas, Id).
getId([[_,_,_,_,_,Id]|_], Id).
%revisar si concuerdan los ID (share and comment)
%estaId(Id, Facebook respuestas o preguntas).
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
post([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, Publicacion, UserList, [Restorar,Add,Share, [[[User,Pass], Fecha, Publicacion, UserList, 0, IdPost]|Create], [], Registrados]):-getId(Create, Id),IdPost is Id+1.
/**Ejemplos de uso**

register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3),post(Facebook3, "1.1.2021", "publicacion1", ["user1","user2"], Facebook4).

register([],"user1","pass",Facebook2),login(Facebook2,"user1","pass",Facebook3),post(Facebook3, "1.3.2021", "Existe?", ["user1","user2"], Facebook4).

register([],"Juan","pass",Facebook2),login(Facebook2,"Juan","pass",Facebook3),post(Facebook3, "1.3.2021", "que lindo dia", ["user1","user2"], Facebook4).

register([],"pipe","pass",Facebook2),login(Facebook2,"pipe","pass",Facebook3),register(Facebook3,"user","pass2",Facebook4),login(Facebook4,"pipe","pass",Facebook5),post(Facebook6, "1.3.2021", "esto es un post", ["user1","user2"], Facebook7).
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
share([Restorar,Add,Share, Create, [[User,Pass]], Registrados], Fecha, IdShare, UserList, [Restorar,Add,[[[User,Pass], Fecha, IdShare, UserList, 1, 1]], Create, [], Registrados]).
share([Restorar,Add,Share,Create, [[User,Pass]], Registrados], Fecha, IdShare, UserList, [Restorar,Add,[[[User,Pass], Fecha, IdShare,UserList,0,idPost]|Share],Create, [], Registrados])
:-estaId(IdShare, Create),getId(Share, Id),IdShare is Id+1.

/**ejemplo de uso**

register([],"Pipe","pass",Facebook2),register(Facebook2,"juan","pass2",Facebook3),login(Facebook3,"Pipe","pass",Facebook4),post(Facebook4, "1.1.2021", "Publicacion1", ["user1","user2"], Facebook5),login(Facebook6,"juan","pass2",Facebook7), share(Facebook7, "2.3.2021" , 1 , ["user2"], Facebook8 ).

*/

/*y como funciona?*/
%registras a pipe , registras a juan , ingresa pipe , postea pipe , ingresa juan , comparte lo de pipe
%buscador de id si existe , aplicar funcion Post
