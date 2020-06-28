
// Uwaga: W wywołaniu generatora gppg należy użyć opcji /gplex

%namespace GardensPoint


%union
{
public string  val;
public char    type;
}

%token  Program OpenBr CloseBr EOF Print Sc IntT DouT BooT Eq True False Plus OpenPar ClosePar Minus Mult Div LogSum LogInt LE GE LT GT EQ NE If Else Return While Read BitSum BitAnd BitNeg Not Error
%type <type> content print dek idef exp asn term factor deklar blok ifs log single return els loop read bit una inside 
%token <val> Int Str Dou Var 

%%

start	  : Program OpenBr { Compiler.EmitCode(".maxstack {0}",Compiler.maxStack); } inside CloseBr EOF
		  | error EOF { SignalError(0);  }
		  | EOF { SignalError(0); }
		  ;
inside	  : deklar content
		  | error { SignalError(0); YYACCEPT; }
		  ;
deklar	  : dek deklar
		  |
		  ;

content   : print Sc content
		  | asn Sc { 
					if(Compiler.errors==0) Compiler.EmitCode("pop"); 
					}  
			content
		  | blok content
		  | ifs content
		  | loop content
		  | read Sc { 
					if(Compiler.errors==0) Compiler.EmitCode("pop"); 
					}  
			content
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
								SignalError(1);
							}
							}
		  ;
ifs		  : If OpenPar log ClosePar {  
									if( $3!='b' && $3!='0' && $3!='1')
									{ 
										SignalError(2);
									}
										Compiler.licznikIf++;
										int n = GenerateNewLabel();
										Compiler.labelIf.Add("IL_"+n.ToString());
										n = GenerateNewLabel();
										Compiler.labelEndIf.Add("IL_"+n.ToString());
										Compiler.EmitCode("brfalse {0}",Compiler.labelIf[Compiler.licznikIf]);
									} 
			single { 
				Compiler.EmitCode("br {0}", Compiler.labelEndIf[Compiler.licznikIf]); 
					} 
			els { 
				Compiler.licznikIf--; 
				Compiler.labelIf.RemoveAt(Compiler.labelIf.Count - 1); 
				Compiler.labelEndIf.RemoveAt(Compiler.labelEndIf.Count - 1); 
			}
		  ;
els		  : Else { 
					Compiler.EmitCode("{0}: nop ",Compiler.labelIf[Compiler.licznikIf]); 
				}   
			single { 
				Compiler.EmitCode("{0}: nop ",Compiler.labelEndIf[Compiler.licznikIf]);  
				}
		  | { 
				Compiler.EmitCode("{0}: nop ",Compiler.labelIf[Compiler.licznikIf]);  
				Compiler.EmitCode("{0}: nop ",Compiler.labelEndIf[Compiler.licznikIf]); 
			}  
		  ;
loop	  : While { 
									 Compiler.licznikPetli++; 
							 
									 int n = GenerateNewLabel();
									 Compiler.labelWhileAfter.Add("IL_"+n.ToString());
									 n = GenerateNewLabel();
									 Compiler.labelWhileBefore.Add("IL_"+n.ToString());
									 Compiler.EmitCode("{0}: nop",Compiler.labelWhileBefore[Compiler.licznikPetli]);
					} 
			OpenPar log ClosePar { 
									if( $4!='b' && $4!='0' && $4!='1')
									{ 
									SignalError(3); 
									Compiler.licznikPetli--; 
									Compiler.labelWhileAfter.RemoveAt(Compiler.labelWhileAfter.Count - 1);
									Compiler.labelWhileBefore.RemoveAt(Compiler.labelWhileBefore.Count - 1);
									} 
									else
										Compiler.EmitCode("brfalse {0}",Compiler.labelWhileAfter[Compiler.licznikPetli]); 
									} 
			single { 
									Compiler.EmitCode("br {0}",Compiler.labelWhileBefore[Compiler.licznikPetli]); 
									Compiler.EmitCode("{0}: nop",Compiler.labelWhileAfter[Compiler.licznikPetli]); 
									Compiler.licznikPetli--; 
									Compiler.labelWhileAfter.RemoveAt(Compiler.labelWhileAfter.Count - 1);
									Compiler.labelWhileBefore.RemoveAt(Compiler.labelWhileBefore.Count - 1);
				   }
							;
return    : Return Sc {  
									int n = GenerateNewLabel();
									string label = "IL_"+n.ToString();
								    Compiler.labelReturn.Add(label);
									Compiler.EmitCode("br {0}",label); 
					  }
		  ;
single	  : blok
		  | asn Sc { 
						if(Compiler.errors==0) Compiler.EmitCode("pop"); 
				   } 
		  | print Sc
		  | read Sc { 
						if(Compiler.errors==0) Compiler.EmitCode("pop"); 
					} 
		  | loop
		  | ifs
		  | return
		  ;
blok	  : OpenBr content CloseBr 
		  ;
print	  : Print Str { 
					   Compiler.EmitCode("ldstr {0}",$2); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode("");
					  }
		  | Print asn { 
						if($2=='i') 
						{ 
						Compiler.EmitCode("call void [mscorlib]System.Console::Write(int32)"); 
						Compiler.EmitCode(""); 
						}
						else if($2=='d')
						{ 
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
		  | Print error { 
							SignalError(4);
						}
		  ;
dek		  : idef Var Sc { 
							if(!variables.Contains("temp"))
							{ 
								Compiler.EmitCode(".locals init(float64 temp)");
								Compiler.EmitCode("ldc.r8 {0}",0);
								Compiler.EmitCode("stloc temp");
								Compiler.EmitCode(""); 
								variables.Add("temp");}
							if(!variables.Contains("tempInt"))
							{ 
								Compiler.EmitCode(".locals init(int32 tempInt)");
								Compiler.EmitCode("ldc.i4 {0}",0);
								Compiler.EmitCode("stloc tempInt");
								Compiler.EmitCode(""); 
								variables.Add("tempInt");
							}
							string namei = "i_"+$2, nameb = "b_"+$2, named="d_"+$2;;
								if(!variables.Contains(namei) && !variables.Contains(nameb) && !variables.Contains(named))
								{
									if($1=='i')
									{
										Compiler.EmitCode(".locals init (int32 i_{0})",$2);
										Compiler.EmitCode("ldc.i4 {0}",0);
										Compiler.EmitCode("stloc i_{0}",$2);
										Compiler.EmitCode("");
										variables.Add(namei);
									}
									else if($1=='b')
									{
										Compiler.EmitCode(".locals init (bool b_{0})",$2);
										Compiler.EmitCode("ldc.i4 {0}",0);
										Compiler.EmitCode("stloc b_{0}",$2);
										Compiler.EmitCode("");
										variables.Add(nameb);
									}
									else if($1=='d'){
										Compiler.EmitCode(".locals init (float64 d_{0})",$2);
										Compiler.EmitCode("ldc.r8 {0}",0);
										Compiler.EmitCode("stloc d_{0}",$2);
										Compiler.EmitCode("");
										variables.Add(named);
									}
								}
								else
									{
										SignalError(5);
									}
						}
		  ;
idef	  : IntT { 
					$$ = 'i';
				 } 
		  | DouT { 
					$$ = 'd';
				 } 
		  | BooT { 
					$$ = 'b';
				 } 
		  ;

asn	  :  Var Eq asn { 
						string namei="i_"+$1, named="d_"+$1, nameb = "b_"+$1;
						if(variables.Contains(namei) && $3=='d')
						{
							 SignalError(6);
						}
						else if(variables.Contains(named) && $3!='b' )
						{
							if($3!='d')Compiler.EmitCode("conv.r8");
							Compiler.EmitCode("dup");
							Compiler.EmitCode("stloc {0}",named);
							$$ = 'd';
						}
						else if(variables.Contains(namei) && $3=='i' )
						{
							Compiler.EmitCode("dup");
							Compiler.EmitCode("stloc {0}",namei);
							$$='i';
						}
						else if(variables.Contains(nameb) && ( $3!='i' && $3!='d'))
						{
							Compiler.EmitCode("dup");
							Compiler.EmitCode("stloc {0}",nameb);
							$$='b';
						}
						else
						{
							SignalError(7);
						}
					} 
		  
		  | log { 
					$$ = $1;  
				}
		  ;
log		  : log {	
					if($1=='i' ||$1=='d')
					{		
						SignalError(8);
					}
					else
					{
						Compiler.licznikLog++;
						int n = GenerateNewLabel();
						Compiler.labelFalse.Add("IL_"+n.ToString());
						Compiler.EmitCode("brfalse {0}",Compiler.labelFalse[Compiler.licznikLog]);
						n = GenerateNewLabel();
						Compiler.labelTrue.Add("IL_"+n.ToString());
					}
				} 
			LogInt  rel 
					{ 
						if($4.type!='b' && $4.type!='0' && $4.type!='1')
						{		
							SignalError(8);
						}
						else
						{
							Compiler.EmitCode("brfalse {0}", Compiler.labelFalse[Compiler.licznikLog]); 
							Compiler.EmitCode("ldc.i4 1"); 
							Compiler.EmitCode("br {0}",Compiler.labelTrue[Compiler.licznikLog]);
							Compiler.EmitCode("{0}: ldc.i4 0",Compiler.labelFalse[Compiler.licznikLog]);
							if(!variables.Contains("tempInt"))
							{
								 Compiler.EmitCode(".locals init(int32 tempInt)");Compiler.EmitCode("ldc.i4 {0}",0);
								 Compiler.EmitCode("stloc tempInt");Compiler.EmitCode(""); variables.Add("tempInt");
							}
							Compiler.EmitCode("{0}: nop",Compiler.labelTrue[Compiler.licznikLog]);
							Compiler.labelTrue.RemoveAt(Compiler.labelTrue.Count - 1);
							Compiler.labelFalse.RemoveAt(Compiler.labelFalse.Count - 1);
							Compiler.licznikLog--;
							$$ = 'b';
						}
					}
		  | log {	
					if($1=='i' ||$1=='d')
					{		
						SignalError(8);
					}
					else
					{
						Compiler.licznikLog++;
						int n = GenerateNewLabel();
						Compiler.labelTrue.Add("IL_"+n.ToString());
						Compiler.EmitCode("brtrue {0}",Compiler.labelTrue[Compiler.licznikLog]); 
						n = GenerateNewLabel();
						Compiler.labelFalse.Add("IL_"+n.ToString());
					}
					}  
			LogSum rel 
				{ 
					if($4.type!='b' && $4.type!='0' && $4.type!='1')
					{		
						SignalError(8);
						Compiler.licznikLog--;
						Compiler.labelTrue.RemoveAt(Compiler.labelTrue.Count - 1);
						Compiler.labelFalse.RemoveAt(Compiler.labelFalse.Count - 1);
					}
					else
					{
						Compiler.EmitCode("brtrue {0}",Compiler.labelTrue[Compiler.licznikLog]); 
						Compiler.EmitCode("ldc.i4 0"); 
						Compiler.EmitCode("br {0}",Compiler.labelFalse[Compiler.licznikLog]);
						Compiler.EmitCode("{0}: ldc.i4 1",Compiler.labelTrue[Compiler.licznikLog]);
						if(!variables.Contains("tempInt"))
						{
							 Compiler.EmitCode(".locals init(int32 tempInt)");Compiler.EmitCode("ldc.i4 {0}",0);
							 Compiler.EmitCode("stloc tempInt");Compiler.EmitCode(""); variables.Add("tempInt");
						}
						Compiler.EmitCode("{0}: nop", Compiler.labelFalse[Compiler.licznikLog]);
						$$ = 'b';
						Compiler.licznikLog--;
						Compiler.labelTrue.RemoveAt(Compiler.labelTrue.Count - 1);
						Compiler.labelFalse.RemoveAt(Compiler.labelFalse.Count - 1);
					}
					}

		  | rel { 
					$$ = $1.type;  
				}
		  ;
rel		  : rel { 
					if($1.type=='i')
						Compiler.EmitCode("conv.r8"); 
				} 
			LE exp { 
					List<char> allowed = new List<char>{'0','1','b'}; 
					if(allowed.Contains($1.type) || allowed.Contains($4))
					{
						SignalError(9);
					}
					if($4=='i')
						Compiler.EmitCode("conv.r8");
					Compiler.EmitCode("clt"); 
					Compiler.EmitCode(""); 
					$$.type = 'b';
					}
		  | rel { 
					if($1.type=='i')
						Compiler.EmitCode("conv.r8"); 
				} 
			LT exp { 
					List<char> allowed = new List<char>{'0','1','b'}; 
					if(allowed.Contains($1.type) || allowed.Contains($4))
					{
						SignalError(10);
					} 
					if($4=='i')
						Compiler.EmitCode("conv.r8"); 
					Compiler.EmitCode("cgt"); 
					Compiler.EmitCode("ldc.i4 0");
					Compiler.EmitCode("ceq"); 
					Compiler.EmitCode(""); 
					$$.type = 'b';
				   }
		  | rel { 
					if($1.type=='i')
						Compiler.EmitCode("conv.r8"); 
				} 
		    GE exp { 
					List<char> allowed = new List<char>{'0','1','b'}; 
					if(allowed.Contains($1.type) || allowed.Contains($4))
					{
						SignalError(11);
					} 
					if($4=='i')
						Compiler.EmitCode("conv.r8"); 
					Compiler.EmitCode("cgt"); 
					Compiler.EmitCode(""); 
					$$.type = 'b'; 
				  }
		  | rel { 
					if($1.type=='i')
						Compiler.EmitCode("conv.r8"); 
				} 
		   GT exp { 
					List<char> allowed = new List<char>{'0','1','b'}; 
					if(allowed.Contains($1.type) || allowed.Contains($4))
					{
						SignalError(12);
					} 
					if($4=='i')
						Compiler.EmitCode("conv.r8"); 
					Compiler.EmitCode("clt"); 
					Compiler.EmitCode("ldc.i4 0");
					Compiler.EmitCode("ceq"); 
					Compiler.EmitCode(""); 
					$$.type = 'b';
				  }
		  | rel { 
					if($1.type=='i')Compiler.EmitCode("conv.r8"); 
				} 
			EQ exp { 
					List<char> boolList = new List<char>{'0','1','b'};
					if((boolList.Contains($1.type) && !boolList.Contains($4))||(!boolList.Contains($1.type) && boolList.Contains($4)))
						SignalError(17);
					if($4=='i')
						Compiler.EmitCode("conv.r8"); 
					Compiler.EmitCode("ceq"); 
					Compiler.EmitCode("");
					$$.type = 'b'; 
					}
		  | rel { 
					if($1.type=='i')
						Compiler.EmitCode("conv.r8"); 
				} 
			NE exp {  
					List<char> boolList = new List<char>{'0','1','b'};
					if((boolList.Contains($1.type) && !boolList.Contains($4))||(!boolList.Contains($1.type) && boolList.Contains($4)))
						SignalError(18);
					if($4=='i')
						Compiler.EmitCode("conv.r8"); 
					Compiler.EmitCode("ceq"); 
					Compiler.EmitCode("ldc.i4 0");
					Compiler.EmitCode("ceq"); 
					Compiler.EmitCode(""); 
					$$.type = 'b';
					}
		  | exp { 
					$$.type = $1; 
				}
		  ;

exp       : exp Plus term { 
							$$ = BinaryOpGenCode(Tokens.Plus, $1, $3); 
						  }
          | exp Minus term { 
							$$ = BinaryOpGenCode(Tokens.Minus, $1, $3); 
						   }
          | term { 
					$$ = $1; 
				 }
          ;

term      : term Mult bit { 
							$$ = BinaryOpGenCode(Tokens.Mult, $1, $3); 
						  }
          | term Div bit { 
							$$ = BinaryOpGenCode(Tokens.Div, $1, $3); 
						 }
          | bit { 
					$$ = $1; 
				}
          ;

bit		  : bit BitSum una { 
								if($1=='i' && $3=='i')
								{	
									$$ = 'i';
									Compiler.EmitCode("or");
								}
								else
								{	
									SignalError(13); 
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
									SignalError(13);
								}
							}
		  | una {
					$$ = $1; 
				}
		  ;
una		  : BitNeg una { 
							if($2=='i')
							{	
								$$ = 'i';
								Compiler.EmitCode("not");
							}
							else
							{	
								SignalError(13);
							}
						}
		  | Minus una { 
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
								SignalError(14);
							}
						}
		  | Not una { 
						List<char> allowed = new List<char>{ '0','1','b' };
						if(allowed.Contains($2))
						{	
							$$ = 'b';
							Compiler.EmitCode("ldc.i4 0");
							Compiler.EmitCode("ceq");
						}
						else
						{	
							SignalError(15);
						}
					}
		  | OpenPar IntT ClosePar una { 
										Compiler.EmitCode("conv.i4"); $$='i'; 
									  }
		  | OpenPar DouT ClosePar una { 
										Compiler.EmitCode("conv.r8"); $$='d';  
									  }
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
					 SignalError(16);
				  }
               }
			| True { 
						$$ = '1'; 
						Compiler.EmitCode("ldc.i4 1"); 
						Compiler.EmitCode(""); 
					}
			| False { 
						$$ = '0'; 
						Compiler.EmitCode("ldc.i4 0"); 
						Compiler.EmitCode(""); 
					}
			| OpenPar asn ClosePar { 
										$$ = $2; 
								   }
          ;



%%

int lineno=1;

Dictionary<int,string> errors = new Dictionary<int,string>{
	{0,"mismatched content"},
	{1,"undeclared variable"},
	{2,"if condition not bool"},
	{3,"loop condition not bool"},
	{4,"print error"},
	{5,"variable already declared"},
	{6,"cannot convert types"},
	{7,"undeclared variable or cannot convert types"},
	{8,"wrong instruction - cannot perform logical operation on non-bool operands"},
	{9,"wrong instruction - cannot perform less relation operation on bool operands"},
	{10,"wrong instruction - cannot perform less-equal relation operation on bool operands"},
	{11,"wrong instruction - cannot perform greater relation operation on bool operands"},
	{12,"wrong instruction - cannot perform greater-equal relation operation on bool operands"},
	{13,"wrong instruction - cannot perform bitwise operation on non-int operands"},
	{14,"wrong instruction - unary minus only on int or double operands"},
	{15,"wrong instruction - cannot perform bitwise negation on non-boolean operands"},
	{16,"wrong instruction"},
	{17,"wrong instruction - equal relation not both types bool"},
	{18,"wrong instruction - not equal relation not both types bool"}
};

List<string> variables = new List<string>();

public Parser(Scanner scanner) : base(scanner) { }

public int GenerateNewLabel()
{
	int n = 0;
	while(Compiler.labelSet.Contains(n))
		n=Compiler.r.Next();
	Compiler.labelSet.Add(n);
	return n;
}

public void SignalError(int whichError)
{
	yyerrok();
	string fromDict = "";
	if(errors.ContainsKey(whichError)) fromDict = errors[whichError];
	string error = "line {0}: "+fromDict;
	Console.WriteLine(error,Compiler.lineno);
	Compiler.errors++;
}

private char BinaryOpGenCode(Tokens t, char type1, char type2)
    {
	List<char> notAllowed = new List<char>{ '0','1','b'};
	if(notAllowed.Contains(type1) || notAllowed.Contains(type2))
	{
		yyerrok(); Compiler.errors++;
	}
    char type = ( type1=='i' && type2=='i' ) ? 'i' : 'd' ;
    if ( type1!=type )
        {
		if(!variables.Contains("temp"))
		{	
			Compiler.EmitCode(".locals init(float64 temp)");
			Compiler.EmitCode("ldc.r8 {0}",0);
			Compiler.EmitCode("stloc temp");Compiler.EmitCode(""); 
			variables.Add("temp");
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
            ++Compiler.errors;
            break;
        }
    return type;
    }