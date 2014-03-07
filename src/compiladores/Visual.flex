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

as 			= As  //ya
boolean			= Boolean //ya
char			= Char //ya
dim 			= Dim //ya
do 			= Do  //ya
double			= Double //ya
end			= End //ya
endif			= End {space}+ If //ya
endwhile		= End {space}+ While  //ya
endfor			= End {space}+ For //ya
endselect               = End {space}+ Select //ya
else 			= Else //ya
case                    = Case //ya
select                  = Select //ya
selectcase              = Select {space}+ Case //ya
for 			= For //ya
float			= Float //ya
function		= Function //ya
if 			= If //ya
integer			= Integer //ya
loop			= Loop //ya
next 			= Next //ya
structs			= Structs //ya
string			= String //ya
sub			= Sub //ya
then 			= Then //ya
to 			= To //ya
while 			= While
private			= Private //ya
print			= Print //ya
no                      = Not //ya
and                     = And //ya
orinc                   = Or //ya
orexc                   = Xor //ya
Equivalencia            = Eqv //ya
Implicacion             = Imp //ya
exitfor                 = Exit {space}* For //ya
exit                    = Exit //ya
return                  = Return


letra			=[a-zA-Z]


asigna                  = \= //ya
tipobool 		= true | false //ya
endline 		= ([\n\r])+ //ya
int 			= [0-9]
entero			= {int}+ //ya
id			= {letra}({guionbajo}?{letra}?{int}?)* //ya
ch 			= "{letra}"  //ya
dospuntos		= \: //ya
coma 			= \, //ya
menor			= \< //ya
mayor			= \> //ya
distinto 		= <\> //ya
potencia	 	= \^ //ya
menorigual		= <\= //ya
mayorigual		= >\= //ya
concatenacion   	= \& //ya
comillas		= \" //ya
igcomillas		= \\{comillas}
space 			= [ ] //ya
tab			= \t //ya
menos			= \- //ya
mas			= \+ //ya
por			= \* //ya
entre			= \/ //ya
divientera		= \\ //ya
parizq			= \( //ya
parder			= \) //ya
guionbajo		= \_ //ya
llavesder		= \{ //ya
llavesizq		= \} //ya

comentario		= \' //ya

%%

<YYINITIAL>{
	{dim}			{return symbol(sym.Dim);}
	{do}			{return symbol(sym.Do);}
	{if}			{return symbol(sym.If);}
	{function}		{return symbol(sym.Function);}
	{endif}			{return symbol(sym.EndIf);}
	{endwhile}		{return symbol(sym.EndWhile);}
	{endfor}		{return symbol(sym.EndFor);}
        {endselect}             {return symbol(sym.EndSelect);}
	{while}			{return symbol(sym.While);}
	{for}			{return symbol(sym.For);}
	{else}			{return symbol(sym.Else);}
        {case}                  {return symbol(sym.Case);}
        {select}                {return symbol(sym.Select);}
        {selectcase}            {return symbol(sym.SelectCase);}
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
        {no}                    {return symbol(sym.Not);}
        {and}                   {return symbol(sym.And);}
        {orinc}                 {return symbol(sym.Or);}
        {orexc}                 {return symbol(sym.Xor);}
        {Equivalencia}          {return symbol(sym.Eqv);}
        {Implicacion}           {return symbol(sym.Imp);}
        {exitfor}               {return symbol(sym.ExitFor);}
        {exit}                  {return symbol(sym.Exit);}
        {return}                {return symbol(sym.Return);}
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
	{asigna}		{return symbol(sym.Asigna);}
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