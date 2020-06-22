
%using QUT.Gppg;
%namespace GardensPoint

Cmt "//".*[\n]
Int [0-9]+
Str \"([^\\\"\n]|\\.)*\"
Dou  [0-9]+\.[0-9]+
Var [a-z]



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
"{"					{ return (int)Tokens.OpenBr; }
"}"					{ return (int)Tokens.CloseBr; }
";"					{ return (int)Tokens.Sc; }
<<EOF>>				{ return (int)Tokens.EOF; }
" "					{ }
"\n"				{ }
"\r"				{ }
"\t"				{ }
{Var}				{ yylval.val=yytext; return (int)Tokens.Var; }