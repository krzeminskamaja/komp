
// Uwaga: W wywołaniu generatora gppg należy użyć opcji /gplex

%namespace GardensPoint


%union
{
public string  val;
public char    type;
}

%token  Program OpenBr CloseBr EOF Print Sc IntT DouT BooT Eq True False Plus OpenPar ClosePar Minus Mult Div
%type <type> content print dek idef exp asn term factor
%token <val> Int Str Dou Var 

%%

start	  : Program OpenBr content CloseBr EOF
		  | error EOF { yyerrok();  Compiler.errors++;}
		  | EOF { yyerrok();  Compiler.errors++;}
		  ;
content   : print content
		  | dek content
		  | asn content
		  | exp Sc content
		  | error { yyerrok(); Console.WriteLine("unmatched content"); Compiler.errors++; YYACCEPT;  }
		  |
		  ;
print	  : Print Str Sc { 
Compiler.EmitCode("ldstr {0}",$2); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode("");
						}
		   | Print Var Sc { string namei="i_"+$2, nameb="b_"+$2,named="d_"+$2;
									if(variables.Contains(namei))
									{
										Compiler.EmitCode("ldloc {0}",namei);
													Compiler.EmitCode("call void [mscorlib]System.Console::Write(int32)"); 
													Compiler.EmitCode("");
									}
									else if(variables.Contains(nameb))
									{
										Compiler.EmitCode("ldloc {0}",nameb);
													Compiler.EmitCode("call void [mscorlib]System.Console::Write(bool)"); 
													Compiler.EmitCode("");
									}
									else if(variables.Contains(named))
									{
										Compiler.EmitCode("ldloc {0}",named);
													Compiler.EmitCode("call void [mscorlib]System.Console::Write(float64)"); 
													Compiler.EmitCode("");
									}
									else
									{
									yyerrok(); Console.WriteLine("undeclared variable {0}",$2); Compiler.errors++;
									}
								
							}
		  | Print exp   { if($2=='i') { Compiler.EmitCode("call void [mscorlib]System.Console::Write(int32)"); 
													Compiler.EmitCode("");  }
							else { Compiler.EmitCode("call void [mscorlib]System.Console::Write(float64)"); 
													Compiler.EmitCode(""); }
							}
		  | Print error { yyerrok();  Compiler.errors++;}
		  ;
dek		  : idef Var Sc { if(!variables.Contains("temp")){ Compiler.EmitCode(".locals init(float64 temp)");Compiler.EmitCode("ldc.r8 {0}",0);
											Compiler.EmitCode("stloc temp");Compiler.EmitCode(""); variables.Add("temp");}
string name = "";
									switch($1){
									
									case 'i':
										name = "i_"+$2;
										if(!variables.Contains(name)){
											Compiler.EmitCode(".locals init (int32 i_{0})",$2);
											Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc i_{0}",$2);
											Compiler.EmitCode("");
											
											variables.Add(name);
											Console.WriteLine("dodane variable {0}",name);
										}
										else{
											yyerrok(); Console.WriteLine("variable already declared"); Compiler.errors++;
										}
									break;
									case 'b':
										name = "b_"+$2;
										if(!variables.Contains(name)){
										Compiler.EmitCode(".locals init (bool b_{0})",$2);
										Compiler.EmitCode("ldc.i4.s {0}",0);
										Compiler.EmitCode("stloc b_{0}",$2);
										Compiler.EmitCode("");
										
										variables.Add(name);
										Console.WriteLine("dodane variable {0}",name);
										}
										else{
											yyerrok(); Console.WriteLine("variable already declared"); Compiler.errors++;
										}

									break;
									case 'd':
										name = "d_"+$2;
										if(!variables.Contains(name)){
										Compiler.EmitCode(".locals init (float64 d_{0})",$2);
										Compiler.EmitCode("ldc.r8 {0}",0);
										Compiler.EmitCode("stloc d_{0}",$2);
										Compiler.EmitCode("");
										
										variables.Add(name);
										Console.WriteLine("dodane variable {0}",name);
										}
										else{
											yyerrok(); Console.WriteLine("variable already declared"); Compiler.errors++;
										}

									break;
									default:
									break;
									}}
		  ;
idef	  : IntT { $$ = 'i';} 
		  | DouT { $$ = 'd';} 
		  | BooT { $$ = 'b';} 
		  ;

asn	  : Var Eq exp Sc { string namei="i_"+$1, named="d_"+$1;
							if(variables.Contains(namei) && $3!='i')
							{
								 Console.WriteLine("  line {0,3}:  semantic error - cannot convert double to int",lineno);
								 ++Compiler.errors;
							}
							else if(variables.Contains(named))
							{
								if($3!='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("stloc {0}",named);
							}
							else if(variables.Contains(namei))
							{
								if($3=='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("stloc {0}",namei);
							}
						}
		  | Var Eq bool Sc { string nameb="b_"+$1;
							if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc {0}",nameb);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$2); Compiler.errors++;
							}

						}
		  ;

bool	  : True { Compiler.EmitCode("ldc.i4.s {0}", 1); Compiler.EmitCode("");}
		  | False { Compiler.EmitCode("ldc.i4.s {0}", 0); Compiler.EmitCode("");}
		  ;

exp       : exp Plus term
               { $$ = BinaryOpGenCode(Tokens.Plus, $1, $3); }
          | exp Minus term
               { $$ = BinaryOpGenCode(Tokens.Minus, $1, $3); }
          | term
               { $$ = $1; }
          ;

term      : term Mult factor
               { $$ = BinaryOpGenCode(Tokens.Mult, $1, $3); }
          | term Div factor
               { $$ = BinaryOpGenCode(Tokens.Div, $1, $3); }
          | factor
               { $$ = $1; }
          ;

factor    : OpenPar exp ClosePar
               { $$ = $2; }
          | Int
               {

               Compiler.EmitCode("ldc.i4 {0}",int.Parse($1));
               $$ = 'i'; 
               }
          | Dou
               {

               double d = double.Parse($1,System.Globalization.CultureInfo.InvariantCulture) ;
               Compiler.EmitCode(string.Format(System.Globalization.CultureInfo.InvariantCulture,"ldc.r8 {0}",d));
               $$ = 'd'; 
               }
          | Var
               {   
			   string namei="i_"+$1, named="d_"+$1; 
				  if(variables.Contains(namei))
				  {
					Compiler.EmitCode("ldloc {0}",namei);
					 $$ = 'i';
				  }
				  else if(variables.Contains(named))
				  {
				  Compiler.EmitCode("ldloc {0}",named);
					$$ = 'd'; 
				  }
				  else
				  {
					 yyerrok(); Console.WriteLine("wrong instruction"); Compiler.errors++; YYABORT;
				  }
		  
               }
          ;

%%

int lineno=1;


public Parser(Scanner scanner) : base(scanner) { }

List<string> variables = new List<string>();

private char BinaryOpGenCode(Tokens t, char type1, char type2)
    {
    char type = ( type1=='i' && type2=='i' ) ? 'i' : 'd' ;
    if ( type1!=type )
        {
        Compiler.EmitCode("stloc temp");
        Compiler.EmitCode("conv.r8");
        Compiler.EmitCode("ldloc temp");
        }
    if ( type2!=type )
        Compiler.EmitCode("conv.r8");
    switch ( t )
        {
        case Tokens.Plus:
            Compiler.EmitCode("add");
            break;
        case Tokens.Minus:
            Compiler.EmitCode("sub");
            break;
        case Tokens.Mult:
            Compiler.EmitCode("mul");
            break;
        case Tokens.Div:
            Compiler.EmitCode("div");
            break;
        default:
            Console.WriteLine($"  line {lineno,3}:  internal gencode error");
            ++Compiler.errors;
            break;
        }
    return type;
    }