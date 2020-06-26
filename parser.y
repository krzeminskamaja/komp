
// Uwaga: W wywołaniu generatora gppg należy użyć opcji /gplex

%namespace GardensPoint


%union
{
public string  val;
public char    type;
}

%token  Program OpenBr CloseBr EOF Print Sc IntT DouT BooT Eq True False Plus OpenPar ClosePar Minus Mult Div LogSum LogInt LE GE LT GT EQ NE If Else Return While Read BitSum BitAnd BitNeg Not
%type <type> content print dek idef exp asn term factor deklar blok ifs log single return els loop read bit una inside
%token <val> Int Str Dou Var 

%%

start	  : Program OpenBr inside CloseBr EOF
		  | error EOF { yyerrok();  Compiler.errors++;}
		  | EOF { yyerrok();  Compiler.errors++;}
		  ;
inside	  : deklar content
		  | error { yyerrok(); Console.WriteLine("unmatched content"); Compiler.errors++; YYACCEPT;  }
		  ;
deklar	  : dek deklar
		  |
		  ;
content   : print Sc content
		  | asn Sc content
		  | blok content
		  | ifs content
		  | loop content
		  | read Sc content
		  | return
		  |
		  ;
read	  : Read Var { 
							Compiler.EmitCode("call string [mscorlib]System.Console::ReadLine()");
							
							string namei = "i_"+$2,nameb ="b_"+$2,named="d_"+$2;
							if(variables.Contains(namei))
							{	
								Compiler.EmitCode("ldloca {0}",namei);
								Compiler.EmitCode("call bool [mscorlib]System.Int32::TryParse(string, int32&)");
							}
							else if(variables.Contains(nameb))
							{
								Compiler.EmitCode("ldloca {0}",nameb);
								Compiler.EmitCode("call bool [mscorlib]System.Boolean::TryParse(string, bool&)");
							}
							else if(variables.Contains(named))
							{
								Compiler.EmitCode("ldloca {0}",named);
								Compiler.EmitCode("call bool [mscorlib]System.Double::TryParse(string, float64&)");
							}
							else
							{
							yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
							}
							}
		  ;
ifs		  : If OpenPar log ClosePar { Compiler.licznikIf++;
									Random r = new Random();
									int n = 0;
									while(Compiler.labelSet.Contains(n) || n<1)
										n=r.Next();
									Compiler.labelSet.Add(n);
									 Compiler.labelIf.Add("IL_"+n.ToString());
									 while(Compiler.labelSet.Contains(n) || n<1)
										n=r.Next();
									Compiler.labelSet.Add(n);
									 Compiler.labelEndIf.Add("IL_"+n.ToString());
									Compiler.EmitCode("brfalse {0}",Compiler.labelIf[Compiler.licznikIf]);
									} 
									single { Compiler.EmitCode("br {0}", Compiler.labelEndIf[Compiler.licznikIf]); } els 
		  ;
els		  : Else { Compiler.EmitCode("{0}: nop ",Compiler.labelIf[Compiler.licznikIf]); }   single { Compiler.EmitCode("{0}: nop ",Compiler.labelEndIf[Compiler.licznikIf]); Compiler.licznikIf--; Compiler.labelEndIf.RemoveAt(Compiler.labelEndIf.Count - 1); }
		  | { Compiler.EmitCode("{0}: nop ",Compiler.labelIf[Compiler.licznikIf]);  Compiler.EmitCode("{0}: nop ",Compiler.labelEndIf[Compiler.licznikIf]); Compiler.licznikIf--; Compiler.labelEndIf.RemoveAt(Compiler.labelEndIf.Count - 1); }  
		  ;
loop	  : 
									 While 
							{ Compiler.licznikPetli++; 
							Random r = new Random();
									int n = 0;
									while(Compiler.labelSet.Contains(n) || n<1)
										n=r.Next();
									Compiler.labelSet.Add(n);
									 Compiler.labelWhileAfter.Add("IL_"+n.ToString());
									while(Compiler.labelSet.Contains(n) || n<1)
										n=r.Next();
									Compiler.labelSet.Add(n);
									 Compiler.labelWhileBefore.Add("IL_"+n.ToString());
									 Compiler.EmitCode("{0}: nop",Compiler.labelWhileBefore[Compiler.licznikPetli]);} 
									 OpenPar log ClosePar
									 { Compiler.EmitCode("brfalse {0}",Compiler.labelWhileAfter[Compiler.licznikPetli]); } 
									 single
									 { Compiler.EmitCode("br {0}",Compiler.labelWhileBefore[Compiler.licznikPetli]); Compiler.EmitCode("{0}: nop",Compiler.labelWhileAfter[Compiler.licznikPetli]); Compiler.licznikPetli--; Compiler.labelWhileAfter.RemoveAt(Compiler.labelWhileAfter.Count - 1);Compiler.labelWhileBefore.RemoveAt(Compiler.labelWhileBefore.Count - 1);}
							;
return    : Return Sc { Random r = new Random();
									int n = 0;
									while(Compiler.labelSet.Contains(n) || n<1)
										n=r.Next();
									Compiler.labelSet.Add(n);
									 Compiler.labelReturn= "IL_"+n.ToString();
									 Console.WriteLine(Compiler.labelReturn); Compiler.EmitCode("br {0}",Compiler.labelReturn); }
		  ;
single	  : blok
		  | asn Sc
		  | print Sc
		  | read Sc
		  | loop
		  | ifs
		  | return
		  ;
blok	  : OpenBr content CloseBr 
		  ;
print	  : Print Str  { 
Compiler.EmitCode("ldstr {0}",$2); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode("");
						}
		  
		  

		   
		  | Print asn { if($2=='i') { Compiler.EmitCode("call void [mscorlib]System.Console::Write(int32)"); 
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
										Compiler.EmitCode("ldc.i4 {0}",0);
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

asn	  : Var Eq asn { string namei="i_"+$1, named="d_"+$1, nameb = "b_"+$1;
							Console.WriteLine("$3 to {0}",$3);
							if(variables.Contains(namei) && $3=='d')
							{
								 Console.WriteLine("  line {0,3}:  semantic error - cannot convert double to int",lineno);
								 ++Compiler.errors;
							}
							else if(variables.Contains(named))
							{
								if($3!='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("dup");
								Compiler.EmitCode("stloc {0}",named);
							}
							else if(variables.Contains(namei))
							{
								Compiler.EmitCode("dup");
								 Compiler.EmitCode("stloc {0}",namei);
							}
							else if(variables.Contains(nameb) && ( $3=='b' || $3=='1' || $3=='0'))
							{
								Compiler.EmitCode("dup");
								Compiler.EmitCode("stloc {0}",nameb);
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",$1); Compiler.errors++;
							}
						}
		  
		  | log 
		  ;
log		  : log {	Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelFalse= "IL_"+n.ToString();
					 Console.WriteLine(Compiler.labelFalse);
					Compiler.EmitCode("brfalse {0}",Compiler.labelFalse);
					} LogInt  rel { 
					Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelTrue= "IL_"+n.ToString();

					Compiler.EmitCode("brfalse {0}", Compiler.labelFalse); 
					Compiler.EmitCode("ldc.i4 1"); 
					Compiler.EmitCode("br {0}",Compiler.labelTrue);
					Compiler.EmitCode("{0}: ldc.i4 0",Compiler.labelFalse);
					if(!variables.Contains("tempInt"))
					 {
						 Compiler.EmitCode(".locals init(int32 tempInt)");Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc tempInt");Compiler.EmitCode(""); variables.Add("tempInt");
					 }
					 
					Compiler.EmitCode("{0}: nop",Compiler.labelTrue);
					$$ = 'b';
					}
		  | log {	Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelTrue = "IL_"+n.ToString();
					Compiler.EmitCode("brtrue {0}",Compiler.labelTrue); 
					}  LogSum rel { 
					Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelFalse = "IL_"+n.ToString();

					 Compiler.EmitCode("brtrue {0}",Compiler.labelTrue); 
					 Compiler.EmitCode("ldc.i4 0"); 
					  Compiler.EmitCode("br {0}",Compiler.labelFalse);
					  Compiler.EmitCode("{0}: ldc.i4 1",Compiler.labelTrue);
					 if(!variables.Contains("tempInt"))
					 {
						 Compiler.EmitCode(".locals init(int32 tempInt)");Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc tempInt");Compiler.EmitCode(""); variables.Add("tempInt");
					 }
					 
					 Compiler.EmitCode("{0}: nop", Compiler.labelFalse);
					
					$$ = 'b';
					}

		  | rel 
		  ;
rel		  : rel LE exp { Compiler.EmitCode("clt"); Compiler.EmitCode(""); $$.type = 'b';}
		  | rel LT exp { Compiler.EmitCode("cgt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); $$.type = 'b';}
		  | rel GE exp { Compiler.EmitCode("cgt"); Compiler.EmitCode(""); $$.type = 'b'; }
		  | rel GT exp { Compiler.EmitCode("clt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); $$.type = 'b';}
		  | rel EQ exp { Compiler.EmitCode("ceq"); Compiler.EmitCode("");$$.type = 'b'; }
		  | rel NE exp { Compiler.EmitCode("ceq"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); $$.type = 'b';}
		  | exp 
		  ;

exp       : exp Plus term
               { $$ = BinaryOpGenCode(Tokens.Plus, $1, $3); }
          | exp Minus term
               { $$ = BinaryOpGenCode(Tokens.Minus, $1, $3); }
          | term
               { $$ = $1; }
          ;

term      : term Mult bit
               { $$ = BinaryOpGenCode(Tokens.Mult, $1, $3); }
          | term Div bit
               { $$ = BinaryOpGenCode(Tokens.Div, $1, $3); }
          | bit
               { $$ = $1; }
          ;

bit		  : bit BitSum una { 
								if($1=='i' && $3=='i')
								{	
									$$ = 'i';
									Compiler.EmitCode("or");
								}
								else
								{	
									yyerrok(); Console.WriteLine("wrong instruction - cannot perform bitwise operation on non-int operands"); Compiler.errors++; YYACCEPT;
								}
								}
		  | bit BitAnd una { 
								if($1=='i' && $3=='i')
								{	
									$$ = 'i';
									Compiler.EmitCode("and");
								}
								else
								{	
									yyerrok(); Console.WriteLine("wrong instruction - cannot perform bitwise operation on non-int operands"); Compiler.errors++; YYACCEPT;
								}
								}
		  | una { $$ = $1; }
		  ;
una		  : BitNeg factor { 
								if($2=='i')
								{	
									$$ = 'i';
									Compiler.EmitCode("not");
								}
								else
								{	
									yyerrok(); Console.WriteLine("wrong instruction - cannot perform bitwise operation on non-int operands"); Compiler.errors++; YYACCEPT;
								}
								}
		  | Minus factor { 
								if($2=='i')
								{	
									$$ = 'i';
									Compiler.EmitCode("neg");
								}
								else if($2=='d')
								{	
									$$ = 'd';
									Compiler.EmitCode("neg");
								}
								else
								{	
									yyerrok(); Console.WriteLine("wrong instruction - unary minus only on int or double operands"); Compiler.errors++; YYACCEPT;
								}
								}
		  | Not factor { 
								if($2=='b')
								{	
									$$ = 'b';
									Compiler.EmitCode("ldc.i4 0");
									Compiler.EmitCode("ceq");
								}
								else
								{	
									yyerrok(); Console.WriteLine("wrong instruction - cannot perform bitwise negation on boolean operands"); Compiler.errors++; YYACCEPT;
								}
								}
		  | OpenPar IntT ClosePar factor { Compiler.EmitCode("conv.i4"); $$='i'; }
		  | OpenPar DouT ClosePar factor { Compiler.EmitCode("conv.r8"); $$='d';  }
		  | factor { $$ = $1; }
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
			| True { $$ = '1'; Compiler.EmitCode("ldc.i4 1"); Compiler.EmitCode(""); }
			| False { $$ = '0'; Compiler.EmitCode("ldc.i4 0"); Compiler.EmitCode(""); }
		  
			| OpenPar asn ClosePar
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