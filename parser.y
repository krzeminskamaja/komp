﻿
// Uwaga: W wywołaniu generatora gppg należy użyć opcji /gplex

%namespace GardensPoint


%union
{
public string  val;
public char    type;
}

%token  Program OpenBr CloseBr EOF Print Sc IntT DouT BooT Eq True False Plus OpenPar ClosePar Minus Mult Div LogSum LogInt LE GE LT GT EQ NE
%type <type> content print dek idef exp asn term factor log bool rel 
%token <val> Int Str Dou Var 

%%

start	  : Program OpenBr content CloseBr EOF
		  | error EOF { yyerrok();  Compiler.errors++;}
		  | EOF { yyerrok();  Compiler.errors++;}
		  ;
content   : print Sc content
		  | dek content
		  | asn content
		  | exp Sc content
		  | log Sc content
		  | error { yyerrok(); Console.WriteLine("unmatched content"); Compiler.errors++; YYACCEPT;  }
		  |
		  ;
print	  : Print Str  { 
Compiler.EmitCode("ldstr {0}",$2); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode("");
						}
		  | Print log  {
			Compiler.EmitCode("call void [mscorlib]System.Console::Write(bool)"); 
															Compiler.EmitCode("");
		  }
		  | Print rel  {
			Compiler.EmitCode("call void [mscorlib]System.Console::Write(bool)"); 
															Compiler.EmitCode("");
		  }
		   
		  | Print exp { if($2=='i') { Compiler.EmitCode("call void [mscorlib]System.Console::Write(int32)"); 
													Compiler.EmitCode("");  }
									else if($2=='d'){ 
										if(!variables.Contains("temp"))
										{	
											Compiler.EmitCode(".locals init(float64 temp)");Compiler.EmitCode("ldc.r8 {0}",0);
													Compiler.EmitCode("stloc temp");Compiler.EmitCode(""); variables.Add("temp");
										}
										Compiler.EmitCode("stloc temp");
										Compiler.EmitCode("call class [mscorlib]System.Globalization.CultureInfo [mscorlib]System.Globalization.CultureInfo::get_InvariantCulture()");
												Compiler.EmitCode("ldstr \"{0:0.000000}\"");
												Compiler.EmitCode("ldloc temp");
												Compiler.EmitCode("box [mscorlib]System.Double");
												Compiler.EmitCode("call string [mscorlib]System.String::Format(class [mscorlib]System.IFormatProvider,string, object)");
												Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)");
															Compiler.EmitCode("");
															
									}
									else
									{
										Compiler.EmitCode("call void [mscorlib]System.Console::Write(bool)"); 
															Compiler.EmitCode("");
									}
							}
		  | Print error { yyerrok();  Compiler.errors++;}
		  ;
dek		  : idef Var Sc { if(!variables.Contains("temp")){ Compiler.EmitCode(".locals init(float64 temp)");Compiler.EmitCode("ldc.r8 {0}",0);
											Compiler.EmitCode("stloc temp");Compiler.EmitCode(""); variables.Add("temp");}
						 if(!variables.Contains("tempInt")){ Compiler.EmitCode(".locals init(int32 tempInt)");Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc tempInt");Compiler.EmitCode(""); variables.Add("tempInt");}
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
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
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
								yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
							}

						}
		| Var Eq log Sc { string nameb="b_"+$1;
							if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc {0}",nameb);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
							}

						}
		  | Var Eq rel Sc { string nameb="b_"+$1;
							if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc {0}",nameb);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
							}

						}
		  | Var Eq Minus exp Sc { string namei="i_"+$1, named="d_"+$1;
							if(variables.Contains(namei) && $4!='i')
							{
								 Console.WriteLine("  line {0,3}:  semantic error - cannot convert double to int",lineno);
								 ++Compiler.errors;
							}
							else if(variables.Contains(named))
							{
								if($4!='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("neg");
								Compiler.EmitCode("stloc {0}",named);
							}
							else if(variables.Contains(namei))
							{
								if($4=='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("neg");
								Compiler.EmitCode("stloc {0}",namei);
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
							}
		  
		  }
		  ;
rel		  : exp LE exp { Compiler.EmitCode("clt"); Compiler.EmitCode(""); }
		  | exp LT exp { Compiler.EmitCode("cgt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
		  | exp GE exp { Compiler.EmitCode("cgt"); Compiler.EmitCode(""); }
		  | exp GT exp { Compiler.EmitCode("clt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
		  | exp EQ exp { Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
		  | exp NE exp { Compiler.EmitCode("ceq"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
		  | bool EQ bool { Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
		  | bool NE bool { Compiler.EmitCode("ceq"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
		  | OpenPar log ClosePar
		  ;
log		  : bool LogSum bool { if($1=='0' && $3=='0')
								{
									Compiler.EmitCode("ldc.i4.s {0}",0);
									 Compiler.EmitCode("");
								}
								else
								{
									Compiler.EmitCode("ldc.i4.s {0}",1);
									 Compiler.EmitCode("");
								} }
		  | bool LogInt bool { if($1=='0' || $3=='0')
								{
									Compiler.EmitCode("ldc.i4.s {0}",0);
									 Compiler.EmitCode("");
								}
								else
								{
									Compiler.EmitCode("ldc.i4.s {0}",1);
									 Compiler.EmitCode("");
								}
								}
		  | rel {	Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelTrue = "IL_"+n.ToString();
					Compiler.EmitCode("brtrue {0}",Compiler.labelTrue); 
					}  LogSum rel 
					{ 
					 Compiler.EmitCode("brtrue {0}",Compiler.labelTrue); 
					  Compiler.EmitCode("{0}: ldc.i4.s 1",Compiler.labelTrue);
					 Compiler.EmitCode("ldc.i4.s 0"); 
					
					
					
					}
		  | rel {	Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelFalse= "IL_"+n.ToString();
					 Console.WriteLine(Compiler.labelFalse);
					Compiler.EmitCode("brfalse {0}",Compiler.labelFalse);
					} 
					LogInt rel 
					{ 
					Compiler.EmitCode("brfalse {0}", Compiler.labelFalse); 
					Compiler.EmitCode("brtrue {0}", Compiler.labelTrue); 
					Compiler.EmitCode("{0}: ldc.i4.s 0",Compiler.labelFalse);
					Compiler.EmitCode("ldc.i4.s 1",Compiler.); 
					
					}
		  | Var LogSum Var { string name1 = "b_"+$1,name2="b_"+$3;
							if(variables.Contains(name1) && variables.Contains(name2))
							{
								Compiler.EmitCode("ldloc {0}",name1);
								Compiler.EmitCode("ldloc {0}",name2);
								Compiler.EmitCode("or");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0} or {1}",$1,$3); Compiler.errors++;
							} }
		  | Var LogInt Var { string name1 = "b_"+$1,name2="b_"+$3;
							if(variables.Contains(name1) && variables.Contains(name2))
							{
								Compiler.EmitCode("ldloc {0}",name1);
								Compiler.EmitCode("ldloc {0}",name2);
								Compiler.EmitCode("and");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0} or {1}",$1,$3); Compiler.errors++;
							} }
		  ;

bool	  : True { $$ = '1'; Compiler.EmitCode("ldc.i4.s 1"); Compiler.EmitCode(""); }
		  | False { $$ = '0'; Compiler.EmitCode("ldc.i4.s 0"); Compiler.EmitCode(""); }
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

factor    : Int
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
			   string namei="i_"+$1, named="d_"+$1,nameb="b_"+$1; 
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
				  else if(variables.Contains(nameb))
				  {
					 Compiler.EmitCode("ldloc {0}",nameb);
					 $$ = 'b'; 
				  }
				  else
				  {
					 yyerrok(); Console.WriteLine("wrong instruction"); Compiler.errors++; YYACCEPT;
				  }
		  
               }
			| OpenPar exp ClosePar
               { $$ = $2; }
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
		if(!variables.Contains("temp"))
								{	
									Compiler.EmitCode(".locals init(float64 temp)");Compiler.EmitCode("ldc.r8 {0}",0);
											Compiler.EmitCode("stloc temp");Compiler.EmitCode(""); variables.Add("temp");
								}
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