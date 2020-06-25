
%using QUT.Gppg;
%namespace GardensPoint

Cmt "//".*[\n]
Int [0-9]+
Str \"([^\\\"\n]|\\.)*\"
Dou  [0-9]+\.[0-9]+
Var [a-zA-Z]+[0-9]*



%%

{Cmt}				{  }
{Int}				{ yylval.val=yytext; return (int)Tokens.Int; }
{Dou}				{ yylval.val=yytext; return (int)Tokens.Dou; }
{Str}				{ yylval.val=yytext; return (int)Tokens.Str; }
"int"				{ return (int)Tokens.IntT; }
"double"			{ return (int)Tokens.DouT; }
"bool"				{ return (int)Tokens.BooT; }
"program"			{ return (int)Tokens.Program; }
"write"				{ return (int)Tokens.Print; }
"true"				{ return (int)Tokens.True; }
"false"				{ return (int)Tokens.False; }
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