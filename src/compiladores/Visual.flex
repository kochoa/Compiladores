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
endif			= End {space}+ If 
endwhile		= End {space}+ While  
endfor			= End {space}+ For 
endselect               = End {space}+ Select 
endsub                  = End {space}+ Sub 
else 			= Else 
elseif                  = Else {space}+ If 
step                    =Step 
case                    = Case 
select                  = Select 
selectcase              = Select {space}+ Case 
for 			= For 
float			= Float 
if 			= If 
integer			= Integer 
loop			= Loop 
next 			= Next 
structs			= Structs
string			= String 
sub			= Sub 
function                = Function
main                    = Main 
then 			= Then 
to 			= To 
while 			= While
private			= Private 
print			= Print 
no                      = Not 
and                     = And 
orinc                   = Or 
orexc                   = Xor 
Equivalencia            = Eqv 
Implicacion             = Imp 
exitfor                 = Exit {space}* For 
exit                    = Exit 
return                  = Return
byref                   = ByRef
byval                   = ByVal


letra			=[a-zA-Z]


asigna                  = \= 
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
	{dim}			{return symbol(sym.Dim, yyline, yycolumn, yytext());}
	{do}			{return symbol(sym.Do, yyline, yycolumn, yytext());}
	{if}			{return symbol(sym.If, yyline, yycolumn, yytext());}
	{function}		{return symbol(sym.Function, yyline, yycolumn, yytext());}
	{endif}			{return symbol(sym.EndIf, yyline, yycolumn, yytext());}
	{endwhile}		{return symbol(sym.EndWhile, yyline, yycolumn, yytext());}
	{endfor}		{return symbol(sym.EndFor, yyline, yycolumn, yytext());}
        {endselect}             {return symbol(sym.EndSelect, yyline, yycolumn, yytext());}
        {endsub}		{return symbol(sym.EndSub, yyline, yycolumn, yytext());}
	{while}			{return symbol(sym.While, yyline, yycolumn, yytext());}
	{for}			{return symbol(sym.For, yyline, yycolumn, yytext());}
	{else}			{return symbol(sym.Else, yyline, yycolumn, yytext());}
        {elseif}		{return symbol(sym.ElseIf, yyline, yycolumn, yytext());}
        {step}  		{return symbol(sym.Step, yyline, yycolumn, yytext());}
        {case}                  {return symbol(sym.Case, yyline, yycolumn, yytext());}
        {select}                {return symbol(sym.Select, yyline, yycolumn, yytext());}
        {selectcase}            {return symbol(sym.SelectCase, yyline, yycolumn, yytext());}
	{then}			{return symbol(sym.Then, yyline, yycolumn, yytext());}
	{as}			{return symbol(sym.As, yyline, yycolumn, yytext());}
	{to}			{return symbol(sym.To, yyline, yycolumn, yytext());}
	{next}			{return symbol(sym.Next, yyline, yycolumn, yytext());}
	{loop}			{return symbol(sym.Loop, yyline, yycolumn, yytext());}
	{structs}		{return symbol(sym.Structs, yyline, yycolumn, yytext());}
	{sub}			{return symbol(sym.Sub, yyline, yycolumn, yytext());}
        {main}			{return symbol(sym.Main, yyline, yycolumn, yytext());}
     	{integer}		{return symbol(sym.Integer, yyline, yycolumn, yytext());}
	{float}			{return symbol(sym.Float, yyline, yycolumn, yytext());}
	{double}		{return symbol(sym.Double, yyline, yycolumn, yytext());}
	{boolean}		{return symbol(sym.Boolean, yyline, yycolumn, yytext());}
	{string}		{return symbol(sym.String, yyline, yycolumn, yytext());}
	{end}			{return symbol(sym.End, yyline, yycolumn, yytext());}
	{private}		{return symbol(sym.Private, yyline, yycolumn, yytext());}
	{print}			{return symbol(sym.Print, yyline, yycolumn, yytext());}
	{char}			{return symbol(sym.Char, yyline, yycolumn, yytext());}
        {no}                    {return symbol(sym.Not, yyline, yycolumn, yytext());}
        {and}                   {return symbol(sym.And, yyline, yycolumn, yytext());}
        {orinc}                 {return symbol(sym.Or, yyline, yycolumn, yytext());}
        {orexc}                 {return symbol(sym.Xor, yyline, yycolumn, yytext());}
        {Equivalencia}          {return symbol(sym.Eqv, yyline, yycolumn, yytext());}
        {Implicacion}           {return symbol(sym.Imp, yyline, yycolumn, yytext());}
        {exitfor}               {return symbol(sym.ExitFor, yyline, yycolumn, yytext());}
        {exit}                  {return symbol(sym.Exit, yyline, yycolumn, yytext());}
        {return}                {return symbol(sym.Return, yyline, yycolumn, yytext());}
        {byref}                 {return symbol(sym.ByRef, yyline, yycolumn, yytext());}
        {byval}                 {return symbol(sym.ByVal, yyline, yycolumn, yytext());}
        {dospuntos}		{return symbol(sym.DosPuntos, yyline, yycolumn, yytext());}
	{coma}			{return symbol(sym.Coma, yyline, yycolumn, yytext());}
	{concatenacion}         {return symbol(sym.Concatenacion, yyline, yycolumn, yytext());}
	{divientera}            {return symbol(sym.DiviEntera, yyline, yycolumn, yytext());}
	{potencia}		{return symbol(sym.Potencia, yyline, yycolumn, yytext());}
	{distinto}		{return symbol(sym.Distinto, yyline, yycolumn, yytext());}	
	{parder}		{return symbol(sym.ParDer, yyline, yycolumn, yytext());}
	{parizq}		{return symbol(sym.ParIzq, yyline, yycolumn, yytext());}
	{guionbajo}		{return symbol(sym.GuionBajo, yyline, yycolumn, yytext());}
	{ch}			{return symbol(sym.Ch, yyline, yycolumn, yytext());}
	{llavesder}		{return symbol(sym.LlaveDer, yyline, yycolumn, yytext());}
	{llavesizq}		{return symbol(sym.LlaveIzq, yyline, yycolumn, yytext());}
	{comillas}		{yybegin(str, yyline, yycolumn, yytext());}
	{endline}		{return symbol(sym.EndLine, yyline, yycolumn, yytext());}
	{entero}		{return symbol(sym.Entero, yyline, yycolumn, yytext());}
	{space}			{}	
	{asigna}		{return symbol(sym.Asigna, yyline, yycolumn, yytext());}
	{tipobool}		{return symbol(sym.TipoBoolean, yyline, yycolumn, yytext());}
	{id}			{return symbol(sym.Id, yyline, yycolumn, yytext());}
	{menor}			{return symbol(sym.Menor, yyline, yycolumn, yytext());}
	{mayor}			{return symbol(sym.Mayor, yyline, yycolumn, yytext());}
	{menorigual}    	{return symbol(sym.MenorIgual, yyline, yycolumn, yytext());}
	{mayorigual}            {return symbol(sym.MayorIgual, yyline, yycolumn, yytext());}
	{menos}			{return symbol(sym.Menos, yyline, yycolumn, yytext());}
	{mas}			{return symbol(sym.Suma, yyline, yycolumn, yytext());}
	{por}			{return symbol(sym.Mult, yyline, yycolumn, yytext());}
	{entre}			{return symbol(sym.Div, yyline, yycolumn, yytext());}
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