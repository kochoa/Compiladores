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
	{dim}			{System.out.println(yytext()); return new symbol(sym.Dim);}
	{do}			{System.out.println(yytext()); return new symbol(sym.Do);}
	{if}			{System.out.println(yytext()); return new symbol(sym.If);}
	{function}		{System.out.println(yytext()); return new symbol(sym.Function);}
	{endif}			{System.out.println(yytext()); return new symbol(sym.EndIf);}
	{endwhile}		{System.out.println(yytext()); return new symbol(sym.EndWhile);}
	{endfor}		{System.out.println(yytext()); return new symbol(sym.EndFor);}
        {endselect}             {System.out.println(yytext()); return new symbol(sym.EndSelect);}
        {endsub}		{System.out.println(yytext()); return new symbol(sym.EndSub);}
	{while}			{return new symbol(sym.While);}
	{for}			{return new symbol(sym.For);}
	{else}			{return new symbol(sym.Else);}
        {elseif}		{return new symbol(sym.ElseIf);}
        {step}  		{return new symbol(sym.Step);}
        {case}                  {return new symbol(sym.Case);}
        {select}                {return new symbol(sym.Select);}
        {selectcase}            {return new symbol(sym.SelectCase);}
	{then}			{return new symbol(sym.Then);}
	{as}			{return new symbol(sym.As);}
	{to}			{return new symbol(sym.To);}
	{next}			{return new symbol(sym.Next);}
	{loop}			{return new symbol(sym.Loop);}
	{structs}		{return new symbol(sym.Structs);}
	{sub}			{return new symbol(sym.Sub);}
        {main}			{return new symbol(sym.Main);}
     	{integer}		{return new symbol(sym.Integer);}
	{float}			{return new symbol(sym.Float);}
	{double}		{return new symbol(sym.Double);}
	{boolean}		{return new symbol(sym.Boolean);}
	{string}		{return new symbol(sym.String);}
	{end}			{return new symbol(sym.End);}
	{private}		{return new symbol(sym.Private);}
	{print}			{return new symbol(sym.Print);}
	{char}			{return new symbol(sym.Char);}
        {no}                    {return new symbol(sym.Not);}
        {and}                   {return new symbol(sym.And);}
        {orinc}                 {return new symbol(sym.Or);}
        {orexc}                 {return new symbol(sym.Xor);}
        {Equivalencia}          {return new symbol(sym.Eqv);}
        {Implicacion}           {return new symbol(sym.Imp);}
        {exitfor}               {return new symbol(sym.ExitFor);}
        {exit}                  {return new symbol(sym.Exit);}
        {return}                {return new symbol(sym.Return);}
        {byref}                 {return new symbol(sym.ByRef);}
        {byval}                 {return new symbol(sym.ByVal);}
        {dospuntos}		{return new symbol(sym.DosPuntos);}
	{coma}			{return new symbol(sym.Coma);}
	{concatenacion}         {return new symbol(sym.Concatenacion);}
	{divientera}            {return new symbol(sym.DiviEntera);}
	{potencia}		{return new symbol(sym.Potencia);}
	{distinto}		{return new symbol(sym.Distinto);}	
	{parder}		{return new symbol(sym.ParDer);}
	{parizq}		{return new symbol(sym.ParIzq);}
	{guionbajo}		{return new symbol(sym.GuionBajo);}
	{ch}			{return new symbol(sym.Ch);}
	{llavesder}		{return new symbol(sym.LlaveDer);}
	{llavesizq}		{return new symbol(sym.LlaveIzq);}
	{comillas}		{yybegin(str);}
	{endline}		{return new symbol(sym.EndLine);}
	{entero}		{return new symbol(sym.Entero);}
	{space}			{}	
	{asigna}		{return new symbol(sym.Asigna);}
	{tipobool}		{return new symbol(sym.TipoBoolean);}
	{id}			{return new symbol(sym.Id);}
	{menor}			{return new symbol(sym.Menor);}
	{mayor}			{return new symbol(sym.Mayor);}
	{menorigual}    	{return new symbol(sym.MenorIgual);}
	{mayorigual}            {return new symbol(sym.MayorIgual);}
	{menos}			{return new symbol(sym.Menos);}
	{mas}			{return new symbol(sym.Suma);}
	{por}			{return new symbol(sym.Mult);}
	{entre}			{return new symbol(sym.Div);}
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