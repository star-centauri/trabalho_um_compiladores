/* DEFINICOES */
/* LEMBRANDO: enum TOKEN { _ID = 256, _FOR, _IF, _INT, _FLOAT, _MAIG, _MEIG, _IG, _DIF, _STRING, _STRING2, _COMENTARIO }; */

WS	[ \t\n]

_ID [$]?[_]?[a-zA-Z_]([a-zA-Z_]|[0-9])*
_INT [0-9]+
_FLOAT [0-9]+(.[0-9]+)?([E][+\-]?[0-9]+)?
_FOR (F|f)(O|o)(R|r)
_IF (I|i)(F|f)
_MAIG ">="
_MEIG "<="
_IG "=="
_DIF "!="
_COMENTARIO ((\*+[^/*])|([^*]))*\**(\*\/)
_STRING (\"|\')([^\"\n]|\\\"|(\"\"))*(\"|\')
_STRING2 (\`)([^])*(\`)

%%
/* PADROES */

{WS}	{ /* ignora espaços, tabs e '\n' */ } 

{_FOR} { return _FOR; }
{_IF} { return _IF; }
{_INT} { return _INT; }
{_FLOAT} { return _FLOAT; }
{_MAIG} { return _MAIG; }
{_IG} { return _IG; }
{_DIF} { return _DIF; }
{_STRING} { return _STRING; }
{_STRING2} { return _STRING2; }
{_COMENTARIO} { return _COMENTARIO; }
{_ID} { return _ID; }

.       { return *yytext; 
          /* Essa deve ser a última regra. Dessa forma qualquer caractere isolado será retornado pelo seu código ascii. */ }

%%
