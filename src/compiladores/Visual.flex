package compiladores;
import compiladores.sym;
import java_cup.runtime.*;
import java.util.ArrayList;

%%
%unicode
%class lexer
%caseless
%ignorecase
%cup
%int
%column
%line
%states str,com

%{
    
        ArrayList<Visual_Error> erroresLexicos = new ArrayList<Visual_Error>();

	String st;
	private Symbol symbol(int type) {
    	return new Symbol(type, yyline, yycolumn, yytext());
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
endfunction             = End {space}+ Function
endtype                 = End {space}+ Type
else 			= Else 
elseif                  = Else {space}+ If 
step                    = Step
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
type                    = Type
string			= String 
sub			= Sub 
function                = Function
call                    = Call
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
read                    = Input

omitir                  = {space}+{guionbajo}{space}*{endline}
letra			= [a-zA-Z]
asigna                  = \= 
tipobool 		= true | false 
endline 		= ([\n\r]|[\n]|[\r])+
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
resta			= \- 
suma			= \+ 
mult			= \* 
div			= \/ 
divientera		= \\ 
parizq			= \( 
parder			= \) 
guionbajo		= \_ 
llavesder		= \{ 
llavesizq		= \} 
punto                   = \.
comentario		= \' 

%%

<YYINITIAL>{
        {read}                  {return symbol(sym.Input);}
	{dim}			{return symbol(sym.Dim);}
	{do}			{return symbol(sym.Do);}
	{if}			{return symbol(sym.If);}
	{function}		{return symbol(sym.Function);}
        {call}                  {return symbol(sym.Call);}
	{endif}			{return symbol(sym.EndIf);}
	{endwhile}		{return symbol(sym.EndWhile);}
	{endfor}		{return symbol(sym.EndFor);}
        {endselect}             {return symbol(sym.EndSelect);}
        {endsub}		{return symbol(sym.EndSub);}
        {endfunction}		{return symbol(sym.EndFunction);}
        {endtype}               {return symbol(sym.EndType);}
	{while}			{return symbol(sym.While);}
	{for}			{return symbol(sym.For);}
	{else}			{return symbol(sym.Else);}
        {elseif}		{return symbol(sym.ElseIf);}
        {step}  		{return symbol(sym.Step);}
        {case}                  {return symbol(sym.Case);}
        {select}                {return symbol(sym.Select);}
        {selectcase}            {return symbol(sym.SelectCase);}
	{then}			{return symbol(sym.Then);}
	{as}			{return symbol(sym.As);}
	{to}			{return symbol(sym.To);}
	{next}			{return symbol(sym.Next);}
	{loop}			{return symbol(sym.Loop);}
	{structs}		{return symbol(sym.Structs);}
        {type}                  {return symbol(sym.Type);}
	{sub}			{return symbol(sym.Sub);}
        {main}			{return symbol(sym.Main);}
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
        {byref}                 {return symbol(sym.ByRef);}
        {byval}                 {return symbol(sym.ByVal);}
        {dospuntos}		{return symbol(sym.EndLine);}
	{coma}			{return symbol(sym.Coma);}
	{concatenacion}         {}
	{divientera}            {return symbol(sym.DiviEntera);}
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
	{menorigual}    	{return symbol(sym.MenorIgual);}
	{mayorigual}            {return symbol(sym.MayorIgual);}
	{resta}			{return symbol(sym.Resta);}
	{suma}			{return symbol(sym.Suma);}
	{mult}			{return symbol(sym.Mult);}
	{div}			{return symbol(sym.Div);}
	{comentario}            {yybegin(com);}
	{tab}			{}
        {omitir}                {}
        {punto}                 {return symbol(sym.Punto);}
	.                       {System.out.println("Errores lexicos:" + erroresLexicos.add(new Visual_Error( yyline +1 , yycolumn +1, "Caracter invalido en la linea " + (yyline +1) +", columna " + (yycolumn +1) + ". No se esperaba :" + yytext() )));}	
 //{System.out.println("Error Lexico. Fila: "+ (yyline+1) +" Columna: " + (yycolumn+1) );}
}

<str> {
	{comillas}		{System.out.println("String: " + st);st="";yybegin(YYINITIAL); return symbol(sym.str);}
	{igcomillas}            {st+="\"";}
	{omitir}                {}
        .				{st+=yytext();}
}

<com> {
	{endline}		{System.out.println("Comentario");yybegin(YYINITIAL);}
        {omitir}                {}
        .				{st+=yytext();}
}