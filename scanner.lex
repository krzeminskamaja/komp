
%using QUT.Gppg;
%namespace GardensPoint

Cmt "//"\.*[\n]
Dou [0-9]+.[0-9]+
Int [0-9]+
Str \"([^\\\"\n]|\\.)*\"
Var [a-zA-Z]+[0-9]*



%%

{Cmt}				{  }
{Int}				{ yylval.val=yytext; return (int)Tokens.Int; }
{Dou}				{ yylval.val=yytext; return (int)Tokens.Dou; }
{Str}				{ yylval.val=yytext; return (int)Tokens.Str; }
"while"				{ return (int)Tokens.While; }
"int"				{ return (int)Tokens.IntT; }
"double"			{ return (int)Tokens.DouT; }
"bool"				{ return (int)Tokens.BooT; }
"read"				{ return (int)Tokens.Read; }
"&"					{ return (int)Tokens.BitAnd; }
"|"					{ return (int)Tokens.BitSum; }
"~"					{ return (int)Tokens.BitNeg; }
"!"					{ return (int)Tokens.Not; }
"program"			{ return (int)Tokens.Program; }
"write"				{ return (int)Tokens.Print; }
"true"				{ return (int)Tokens.True; }
"false"				{ return (int)Tokens.False; }
"if"				{ return (int)Tokens.If; }
"else"				{ return (int)Tokens.Else;}
"return"			{ return (int)Tokens.Return;}
"{"					{ return (int)Tokens.OpenBr; }
"}"					{ return (int)Tokens.CloseBr; }
";"					{ return (int)Tokens.Sc; }
"="					{ return (int)Tokens.Eq; }
"+"					{ return (int)Tokens.Plus; }
"-"					{ return (int)Tokens.Minus; }
"*"					{ return (int)Tokens.Mult; }
"/"					{ return (int)Tokens.Div; }
"("					{ return (int)Tokens.OpenPar; }
")"					{ return (int)Tokens.ClosePar; }
"||"				{ return (int)Tokens.LogSum; }
"&&"				{ return (int)Tokens.LogInt; }
"<"					{ return (int)Tokens.LE; }
">"					{ return (int)Tokens.GE; }
"<="				{ return (int)Tokens.LT; }
">="				{ return (int)Tokens.GT; }
"=="				{ return (int)Tokens.EQ; }
"!="				{ return (int)Tokens.NE; }
<<EOF>>				{ return (int)Tokens.EOF; }
" "					{ }
"\n"				{ }
"\r"				{ }
"\t"				{ }
{Var}				{ yylval.val=yytext; return (int)Tokens.Var; }