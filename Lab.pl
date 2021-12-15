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
