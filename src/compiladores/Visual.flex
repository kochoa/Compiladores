import java_cup.runtime.*;
%%
%unicode
%class Visual
%cup
%int
%column
%line
%states str,com

%{
	String st;
	private Symbol symbol(int type) {
    	return new Symbol(type, yyline, yycolumn);
  	}
  	private Symbol symbol(int type, Object value) {
    	return new Symbol(type, yyline, yycolumn, value);
  	}
%}

%init{
	st = "";
%init}

as 			= As
boolean			= Boolean
char			= Char
dim 			= Dim
do 			= Do
double			= Double
end			= End
endif			= End {space}* If
endwhile		= End {space}* While
endfor			= End {space}* For
else 			= Else
for 			= For
float			= Float
function		= Function
if 			= If
integer			= Integer
loop			= Loop
next 			= Next
structs			= Structs
string			= String
sub			= Sub
then 			= Then
to 			= To
while 			= While
private			= Private
print			= Print

letra			=[a-zA-Z]
//cadena		={comillas}{space}*}({letra}*|{space}*)

asigna			= \=
tipobool 		= true | false
endline 		= ([\n\r])+
int 			= [0-9]
entero			= {int}+
id			= {letra}({guionbajo}?{letra}?{int}?)*
ch 			= "{letra}" 
dospuntos		= \:
coma 			= \,
menor			= \<
mayor			= \>
distinto 		= <\>
potencia	 	= \^
menorigual		= <\=
mayorigual		= >\=
concatenacion   	= \&
comillas		= \"
igcomillas		= \\{comillas}
space 			= [ ]
tab			= \t
menos			= \-
mas			= \+
por			= \*
entre			= \/
divientera		= \\
parizq			= \(
parder			= \)
guionbajo		= \_
llavesder		= \{
llavesizq		= \}

comentario		= \'

%%

<YYINITIAL>{
	{dim}			{return symbol(sym.Dim);}
	{do}			{return symbol(sym.Do);}
	{if}			{return symbol(sym.If);}
	{function}		{return symbol(sym.Function);}
	{endif}			{return symbol(sym.EndIf);}
	{endwhile}		{return symbol(sym.EndWhile);}
	{endfor}		{return symbol(sym.EndFor);}
	{while}			{return symbol(sym.While);}
	{for}			{return symbol(sym.For);}
	{else}			{return symbol(sym.Else);}
	{then}			{return symbol(sym.Then);}
	{as}			{return symbol(sym.As);}
	{to}			{return symbol(sym.To);}
	{next}			{return symbol(sym.Next);}
	{loop}			{return symbol(sym.Loop);}
	{structs}		{return symbol(sym.Structs);}
	{sub}			{return symbol(sym.Sub);}
	{integer}		{return symbol(sym.Integer);}
	{float}			{return symbol(sym.Float);}
	{double}		{return symbol(sym.Double);}
	{boolean}		{return symbol(sym.Boolean);}
	{string}		{return symbol(sym.String);}
	{end}			{return symbol(sym.End);}
	{private}		{return symbol(sym.Private);}
	{print}			{return symbol(sym.Print);}
	{char}			{return symbol(sym.Char);}

	{dospuntos}		{return symbol(sym.DosPuntos);}
	{coma}			{return symbol(sym.Coma);}
	{concatenacion}	{return symbol(sym.Concatenacion);}
	{divientera}	{return symbol(sym.DiviEntera);}
	{potencia}		{return symbol(sym.Potencia);}
	{distinto}		{return symbol(sym.Distinto);}	
	{parder}		{return symbol(sym.ParDer);}
	{parizq}		{return symbol(sym.ParIzq);}
	{guionbajo}		{return symbol(sym.GuionBajo);}
	{ch}			{return symbol(sym.Ch);}
	{llavesder}		{return symbol(sym.LlaveDer);}
	{llavesizq}		{return symbol(sym.LlaveIzq);}
	{comillas}		{yybegin(str);}
	{endline}		{return symbol(sym.EndLine);}
	{entero}		{return symbol(sym.Entero);}
	{space}			{}	
	{asigna}		{return symbol(sym.Asignacion);}
	{tipobool}		{return symbol(sym.TipoBoolean);}
	{id}			{return symbol(sym.Id);}
	{menor}			{return symbol(sym.Menor);}
	{mayor}			{return symbol(sym.Mayor);}
	{menorigual}	{return symbol(sym.MenorIgual);}
	{mayorigual}	{return symbol(sym.MayorIgual);}
	{menos}			{return symbol(sym.Menos);}
	{mas}			{return symbol(sym.Suma);}
	{por}			{return symbol(sym.Mult);}
	{entre}			{return symbol(sym.Div);}
	{comentario}	{yybegin(com);}
	{tab}			{}
	.				{System.out.println("Error Lexico. Fila: "+ (yyline+1) +" Columna: " + (yycolumn+1) );}
}

<str> {
	{comillas}		{System.out.println("String: " + st);st="";yybegin(YYINITIAL);}
	{igcomillas}	{st+="\"";}
	.				{st+=yytext();}
}

<com> {
	{endline}		{System.out.println("Comentario");yybegin(YYINITIAL);}
	{comentario}	{System.out.println("String");yybegin(YYINITIAL);}
	.				{st+=yytext();}
}