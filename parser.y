
// Uwaga: W wywołaniu generatora gppg należy użyć opcji /gplex

%namespace GardensPoint


%union
{
public string  val;
public char    type;
}

%token  Program OpenBr CloseBr EOF Print Sc IntT DouT BooT Eq True False
%type <type> content print dek idef expr 
%token <val> Int Str Dou Var 

%%

start	  : Program OpenBr content CloseBr EOF
		  | error EOF { yyerrok();  Compiler.errors++;}
		  | EOF { yyerrok();  Compiler.errors++;}
		  ;
content   : print content
		  | dek content
		  | expr content
		  |
		  ;
print	  : Print Str Sc { 
Compiler.EmitCode("ldstr {0}",$2); Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(string)"); Compiler.EmitCode("");
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
		  | Print error { yyerrok();  Compiler.errors++;}
		  ;
dek		  : idef Var Sc { string name = "";
									switch($1){
									
									case 'i':
										name = "i_"+$2;
										if(!variables.Contains(name)){
											Compiler.EmitCode(".locals init (int32 i_{0})",$2);
											Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc i_{0}",$2);
											Compiler.EmitCode("ldloc i_{0}",$2);
											Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(int32)"); 
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
										Compiler.EmitCode("ldloc b_{0}",$2);
										Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(bool)"); 
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
										Compiler.EmitCode("ldloc d_{0}",$2);
										Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(float64)"); 
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

expr	  : Var Eq expr Sc { string namei="i_"+$1, nameb="b_"+$1,named="d_"+$1;
							if(variables.Contains(namei))
							{
								Compiler.EmitCode("stloc i_{0}",$1);
								Compiler.EmitCode("");
							}
							else if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc b_{0}",$1);
								Compiler.EmitCode("");
							}
							else if(variables.Contains(named))
							{
								Compiler.EmitCode("stloc d_{0}",$1);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$2); Compiler.errors++;
							}
						}
		  | Var { Compiler.EmitCode("ldloc {0}",$1); }
		  | Int { Compiler.EmitCode("ldc.i4 {0}",$1); }
		  | Dou { Compiler.EmitCode("ldc.r8 {0}",$1); }
		  | True { Compiler.EmitCode("ldc.i4.s {0}", 1); }
		  | False { Compiler.EmitCode("ldc.i4.s {0}", 0); }
		  ;
%%

int lineno=1;



public Parser(Scanner scanner) : base(scanner) { }

List<string> variables = new List<string>();