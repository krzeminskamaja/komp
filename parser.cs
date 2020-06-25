// This code was generated by the Gardens Point Parser Generator
// Copyright (c) Wayne Kelly, John Gough, QUT 2005-2014
// (see accompanying GPPGcopyright.rtf)

// GPPG version 1.5.2
// Machine:  DESKTOP-1T6954A
// DateTime: 25.06.2020 02:30:57
// UserName: Maya
// Input file <parser.y - 25.06.2020 02:30:53>

// options: lines gplex

using System;
using System.Collections.Generic;
using System.CodeDom.Compiler;
using System.Globalization;
using System.Text;
using QUT.Gppg;

namespace GardensPoint
{
public enum Tokens {error=2,EOF=3,Program=4,OpenBr=5,CloseBr=6,
    Print=7,Sc=8,IntT=9,DouT=10,BooT=11,Eq=12,
    True=13,False=14,Plus=15,OpenPar=16,ClosePar=17,Minus=18,
    Mult=19,Div=20,LogSum=21,LogInt=22,LE=23,GE=24,
    LT=25,GT=26,EQ=27,NE=28,Int=29,Str=30,
    Dou=31,Var=32};

public struct ValueType
#line 8 "parser.y"
{
public string  val;
public char    type;
}
#line default
// Abstract base class for GPLEX scanners
[GeneratedCodeAttribute( "Gardens Point Parser Generator", "1.5.2")]
public abstract class ScanBase : AbstractScanner<ValueType,LexLocation> {
  private LexLocation __yylloc = new LexLocation();
  public override LexLocation yylloc { get { return __yylloc; } set { __yylloc = value; } }
  protected virtual bool yywrap() { return true; }
}

// Utility class for encapsulating token information
[GeneratedCodeAttribute( "Gardens Point Parser Generator", "1.5.2")]
public class ScanObj {
  public int token;
  public ValueType yylval;
  public LexLocation yylloc;
  public ScanObj( int t, ValueType val, LexLocation loc ) {
    this.token = t; this.yylval = val; this.yylloc = loc;
  }
}

[GeneratedCodeAttribute( "Gardens Point Parser Generator", "1.5.2")]
public class Parser: ShiftReduceParser<ValueType, LexLocation>
{
#pragma warning disable 649
  private static Dictionary<int, string> aliases;
#pragma warning restore 649
  private static Rule[] rules = new Rule[55];
  private static State[] states = new State[107];
  private static string[] nonTerms = new string[] {
      "content", "print", "dek", "idef", "exp", "asn", "term", "factor", "log", 
      "bool", "rel", "start", "$accept", "Anon@1", "Anon@2", };

  static Parser() {
    states[0] = new State(new int[]{4,3,2,104,3,106},new int[]{-12,1});
    states[1] = new State(new int[]{3,2});
    states[2] = new State(-1);
    states[3] = new State(new int[]{5,4});
    states[4] = new State(new int[]{7,11,9,79,10,80,11,81,32,84,29,25,31,26,16,47,13,59,14,60,2,103,6,-11},new int[]{-1,5,-2,8,-3,74,-4,76,-6,82,-5,97,-7,36,-8,35,-9,100,-10,56,-11,67});
    states[5] = new State(new int[]{6,6});
    states[6] = new State(new int[]{3,7});
    states[7] = new State(-2);
    states[8] = new State(new int[]{8,9});
    states[9] = new State(new int[]{7,11,9,79,10,80,11,81,32,84,29,25,31,26,16,47,13,59,14,60,2,103,6,-11},new int[]{-1,10,-2,8,-3,74,-4,76,-6,82,-5,97,-7,36,-8,35,-9,100,-10,56,-11,67});
    states[10] = new State(-5);
    states[11] = new State(new int[]{30,12,2,73,13,59,14,60,29,25,31,26,32,51,16,47},new int[]{-9,13,-11,14,-5,72,-10,56,-7,36,-8,35});
    states[12] = new State(-12);
    states[13] = new State(-13);
    states[14] = new State(new int[]{8,-14,21,-37,22,-39},new int[]{-14,15,-15,68});
    states[15] = new State(new int[]{21,16});
    states[16] = new State(new int[]{29,25,31,26,32,27,16,47,13,59,14,60},new int[]{-11,17,-5,18,-7,36,-8,35,-10,71});
    states[17] = new State(-38);
    states[18] = new State(new int[]{23,19,15,21,18,31,25,37,24,39,26,41,27,43,28,45});
    states[19] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,20,-7,36,-8,35});
    states[20] = new State(new int[]{15,21,18,31,21,-26,22,-26,8,-26,17,-26});
    states[21] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-7,22,-8,35});
    states[22] = new State(new int[]{19,23,20,33,8,-45,15,-45,18,-45,23,-45,25,-45,24,-45,26,-45,27,-45,28,-45,21,-45,22,-45,17,-45});
    states[23] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-8,24});
    states[24] = new State(-48);
    states[25] = new State(-51);
    states[26] = new State(-52);
    states[27] = new State(-53);
    states[28] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,29,-7,36,-8,35});
    states[29] = new State(new int[]{17,30,15,21,18,31});
    states[30] = new State(-54);
    states[31] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-7,32,-8,35});
    states[32] = new State(new int[]{19,23,20,33,8,-46,15,-46,18,-46,23,-46,25,-46,24,-46,26,-46,27,-46,28,-46,21,-46,22,-46,17,-46});
    states[33] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-8,34});
    states[34] = new State(-49);
    states[35] = new State(-50);
    states[36] = new State(new int[]{19,23,20,33,8,-47,15,-47,18,-47,23,-47,25,-47,24,-47,26,-47,27,-47,28,-47,21,-47,22,-47,17,-47});
    states[37] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,38,-7,36,-8,35});
    states[38] = new State(new int[]{15,21,18,31,21,-27,22,-27,8,-27,17,-27});
    states[39] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,40,-7,36,-8,35});
    states[40] = new State(new int[]{15,21,18,31,21,-28,22,-28,8,-28,17,-28});
    states[41] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,42,-7,36,-8,35});
    states[42] = new State(new int[]{15,21,18,31,21,-29,22,-29,8,-29,17,-29});
    states[43] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,44,-7,36,-8,35});
    states[44] = new State(new int[]{15,21,18,31,21,-30,22,-30,8,-30,17,-30});
    states[45] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,46,-7,36,-8,35});
    states[46] = new State(new int[]{15,21,18,31,21,-31,22,-31,8,-31,17,-31});
    states[47] = new State(new int[]{29,25,31,26,32,51,16,47,13,59,14,60},new int[]{-5,48,-9,49,-7,36,-8,35,-10,56,-11,67});
    states[48] = new State(new int[]{17,30,15,21,18,31,23,19,25,37,24,39,26,41,27,43,28,45});
    states[49] = new State(new int[]{17,50});
    states[50] = new State(-34);
    states[51] = new State(new int[]{21,52,22,54,19,-53,20,-53,23,-53,15,-53,18,-53,25,-53,24,-53,26,-53,27,-53,28,-53,8,-53,17,-53});
    states[52] = new State(new int[]{32,53});
    states[53] = new State(-41);
    states[54] = new State(new int[]{32,55});
    states[55] = new State(-42);
    states[56] = new State(new int[]{21,57,22,61,27,63,28,65});
    states[57] = new State(new int[]{13,59,14,60},new int[]{-10,58});
    states[58] = new State(-35);
    states[59] = new State(-43);
    states[60] = new State(-44);
    states[61] = new State(new int[]{13,59,14,60},new int[]{-10,62});
    states[62] = new State(-36);
    states[63] = new State(new int[]{13,59,14,60},new int[]{-10,64});
    states[64] = new State(-32);
    states[65] = new State(new int[]{13,59,14,60},new int[]{-10,66});
    states[66] = new State(-33);
    states[67] = new State(new int[]{21,-37,22,-39},new int[]{-14,15,-15,68});
    states[68] = new State(new int[]{22,69});
    states[69] = new State(new int[]{29,25,31,26,32,27,16,47,13,59,14,60},new int[]{-11,70,-5,18,-7,36,-8,35,-10,71});
    states[70] = new State(-40);
    states[71] = new State(new int[]{27,63,28,65});
    states[72] = new State(new int[]{23,19,15,21,18,31,25,37,24,39,26,41,27,43,28,45,8,-15});
    states[73] = new State(-16);
    states[74] = new State(new int[]{7,11,9,79,10,80,11,81,32,84,29,25,31,26,16,47,13,59,14,60,2,103,6,-11},new int[]{-1,75,-2,8,-3,74,-4,76,-6,82,-5,97,-7,36,-8,35,-9,100,-10,56,-11,67});
    states[75] = new State(-6);
    states[76] = new State(new int[]{32,77});
    states[77] = new State(new int[]{8,78});
    states[78] = new State(-17);
    states[79] = new State(-18);
    states[80] = new State(-19);
    states[81] = new State(-20);
    states[82] = new State(new int[]{7,11,9,79,10,80,11,81,32,84,29,25,31,26,16,47,13,59,14,60,2,103,6,-11},new int[]{-1,83,-2,8,-3,74,-4,76,-6,82,-5,97,-7,36,-8,35,-9,100,-10,56,-11,67});
    states[83] = new State(-7);
    states[84] = new State(new int[]{12,85,21,52,22,54,19,-53,20,-53,8,-53,15,-53,18,-53,23,-53,25,-53,24,-53,26,-53,27,-53,28,-53});
    states[85] = new State(new int[]{18,94,29,25,31,26,32,51,16,47,13,59,14,60},new int[]{-5,86,-10,88,-9,90,-11,92,-7,36,-8,35});
    states[86] = new State(new int[]{8,87,15,21,18,31,23,19,25,37,24,39,26,41,27,43,28,45});
    states[87] = new State(-21);
    states[88] = new State(new int[]{8,89,21,57,22,61,27,63,28,65});
    states[89] = new State(-22);
    states[90] = new State(new int[]{8,91});
    states[91] = new State(-23);
    states[92] = new State(new int[]{8,93,21,-37,22,-39},new int[]{-14,15,-15,68});
    states[93] = new State(-24);
    states[94] = new State(new int[]{29,25,31,26,32,27,16,28},new int[]{-5,95,-7,36,-8,35});
    states[95] = new State(new int[]{8,96,15,21,18,31});
    states[96] = new State(-25);
    states[97] = new State(new int[]{8,98,15,21,18,31,23,19,25,37,24,39,26,41,27,43,28,45});
    states[98] = new State(new int[]{7,11,9,79,10,80,11,81,32,84,29,25,31,26,16,47,13,59,14,60,2,103,6,-11},new int[]{-1,99,-2,8,-3,74,-4,76,-6,82,-5,97,-7,36,-8,35,-9,100,-10,56,-11,67});
    states[99] = new State(-8);
    states[100] = new State(new int[]{8,101});
    states[101] = new State(new int[]{7,11,9,79,10,80,11,81,32,84,29,25,31,26,16,47,13,59,14,60,2,103,6,-11},new int[]{-1,102,-2,8,-3,74,-4,76,-6,82,-5,97,-7,36,-8,35,-9,100,-10,56,-11,67});
    states[102] = new State(-9);
    states[103] = new State(-10);
    states[104] = new State(new int[]{3,105});
    states[105] = new State(-3);
    states[106] = new State(-4);

    for (int sNo = 0; sNo < states.Length; sNo++) states[sNo].number = sNo;

    rules[1] = new Rule(-13, new int[]{-12,3});
    rules[2] = new Rule(-12, new int[]{4,5,-1,6,3});
    rules[3] = new Rule(-12, new int[]{2,3});
    rules[4] = new Rule(-12, new int[]{3});
    rules[5] = new Rule(-1, new int[]{-2,8,-1});
    rules[6] = new Rule(-1, new int[]{-3,-1});
    rules[7] = new Rule(-1, new int[]{-6,-1});
    rules[8] = new Rule(-1, new int[]{-5,8,-1});
    rules[9] = new Rule(-1, new int[]{-9,8,-1});
    rules[10] = new Rule(-1, new int[]{2});
    rules[11] = new Rule(-1, new int[]{});
    rules[12] = new Rule(-2, new int[]{7,30});
    rules[13] = new Rule(-2, new int[]{7,-9});
    rules[14] = new Rule(-2, new int[]{7,-11});
    rules[15] = new Rule(-2, new int[]{7,-5});
    rules[16] = new Rule(-2, new int[]{7,2});
    rules[17] = new Rule(-3, new int[]{-4,32,8});
    rules[18] = new Rule(-4, new int[]{9});
    rules[19] = new Rule(-4, new int[]{10});
    rules[20] = new Rule(-4, new int[]{11});
    rules[21] = new Rule(-6, new int[]{32,12,-5,8});
    rules[22] = new Rule(-6, new int[]{32,12,-10,8});
    rules[23] = new Rule(-6, new int[]{32,12,-9,8});
    rules[24] = new Rule(-6, new int[]{32,12,-11,8});
    rules[25] = new Rule(-6, new int[]{32,12,18,-5,8});
    rules[26] = new Rule(-11, new int[]{-5,23,-5});
    rules[27] = new Rule(-11, new int[]{-5,25,-5});
    rules[28] = new Rule(-11, new int[]{-5,24,-5});
    rules[29] = new Rule(-11, new int[]{-5,26,-5});
    rules[30] = new Rule(-11, new int[]{-5,27,-5});
    rules[31] = new Rule(-11, new int[]{-5,28,-5});
    rules[32] = new Rule(-11, new int[]{-10,27,-10});
    rules[33] = new Rule(-11, new int[]{-10,28,-10});
    rules[34] = new Rule(-11, new int[]{16,-9,17});
    rules[35] = new Rule(-9, new int[]{-10,21,-10});
    rules[36] = new Rule(-9, new int[]{-10,22,-10});
    rules[37] = new Rule(-14, new int[]{});
    rules[38] = new Rule(-9, new int[]{-11,-14,21,-11});
    rules[39] = new Rule(-15, new int[]{});
    rules[40] = new Rule(-9, new int[]{-11,-15,22,-11});
    rules[41] = new Rule(-9, new int[]{32,21,32});
    rules[42] = new Rule(-9, new int[]{32,22,32});
    rules[43] = new Rule(-10, new int[]{13});
    rules[44] = new Rule(-10, new int[]{14});
    rules[45] = new Rule(-5, new int[]{-5,15,-7});
    rules[46] = new Rule(-5, new int[]{-5,18,-7});
    rules[47] = new Rule(-5, new int[]{-7});
    rules[48] = new Rule(-7, new int[]{-7,19,-8});
    rules[49] = new Rule(-7, new int[]{-7,20,-8});
    rules[50] = new Rule(-7, new int[]{-8});
    rules[51] = new Rule(-8, new int[]{29});
    rules[52] = new Rule(-8, new int[]{31});
    rules[53] = new Rule(-8, new int[]{32});
    rules[54] = new Rule(-8, new int[]{16,-5,17});
  }

  protected override void Initialize() {
    this.InitSpecialTokens((int)Tokens.error, (int)Tokens.EOF);
    this.InitStates(states);
    this.InitRules(rules);
    this.InitNonTerminals(nonTerms);
  }

  protected override void DoAction(int action)
  {
#pragma warning disable 162, 1522
    switch (action)
    {
      case 3: // start -> error, EOF
#line 20 "parser.y"
                { yyerrok();  Compiler.errors++;}
#line default
        break;
      case 4: // start -> EOF
#line 21 "parser.y"
          { yyerrok();  Compiler.errors++;}
#line default
        break;
      case 10: // content -> error
#line 28 "parser.y"
            { yyerrok(); Console.WriteLine("unmatched content"); Compiler.errors++; YYAccept();  }
#line default
        break;
      case 12: // print -> Print, Str
#line 31 "parser.y"
                     { 
Compiler.EmitCode("ldstr {0}",ValueStack[ValueStack.Depth-1].val); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode("");
						}
#line default
        break;
      case 13: // print -> Print, log
#line 34 "parser.y"
                 {
			Compiler.EmitCode("call void [mscorlib]System.Console::Write(bool)"); 
															Compiler.EmitCode("");
		  }
#line default
        break;
      case 14: // print -> Print, rel
#line 38 "parser.y"
                 {
			Compiler.EmitCode("call void [mscorlib]System.Console::Write(bool)"); 
															Compiler.EmitCode("");
		  }
#line default
        break;
      case 15: // print -> Print, exp
#line 43 "parser.y"
                { if(ValueStack[ValueStack.Depth-1].type=='i') { Compiler.EmitCode("call void [mscorlib]System.Console::Write(int32)"); 
													Compiler.EmitCode("");  }
									else if(ValueStack[ValueStack.Depth-1].type=='d'){ 
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
#line default
        break;
      case 16: // print -> Print, error
#line 67 "parser.y"
                  { yyerrok();  Compiler.errors++;}
#line default
        break;
      case 17: // dek -> idef, Var, Sc
#line 69 "parser.y"
                     { if(!variables.Contains("temp")){ Compiler.EmitCode(".locals init(float64 temp)");Compiler.EmitCode("ldc.r8 {0}",0);
											Compiler.EmitCode("stloc temp");Compiler.EmitCode(""); variables.Add("temp");}
						 if(!variables.Contains("tempInt")){ Compiler.EmitCode(".locals init(int32 tempInt)");Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc tempInt");Compiler.EmitCode(""); variables.Add("tempInt");}
string name = "";
									switch(ValueStack[ValueStack.Depth-3].type){
									
									case 'i':
										name = "i_"+ValueStack[ValueStack.Depth-2].val;
										if(!variables.Contains(name)){
											Compiler.EmitCode(".locals init (int32 i_{0})",ValueStack[ValueStack.Depth-2].val);
											Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc i_{0}",ValueStack[ValueStack.Depth-2].val);
											Compiler.EmitCode("");
											
											variables.Add(name);
											Console.WriteLine("dodane variable {0}",name);
										}
										else{
											yyerrok(); Console.WriteLine("variable already declared"); Compiler.errors++;
										}
									break;
									case 'b':
										name = "b_"+ValueStack[ValueStack.Depth-2].val;
										if(!variables.Contains(name)){
										Compiler.EmitCode(".locals init (bool b_{0})",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("ldc.i4.s {0}",0);
										Compiler.EmitCode("stloc b_{0}",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("");
										
										variables.Add(name);
										Console.WriteLine("dodane variable {0}",name);
										}
										else{
											yyerrok(); Console.WriteLine("variable already declared"); Compiler.errors++;
										}

									break;
									case 'd':
										name = "d_"+ValueStack[ValueStack.Depth-2].val;
										if(!variables.Contains(name)){
										Compiler.EmitCode(".locals init (float64 d_{0})",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("ldc.r8 {0}",0);
										Compiler.EmitCode("stloc d_{0}",ValueStack[ValueStack.Depth-2].val);
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
#line default
        break;
      case 18: // idef -> IntT
#line 127 "parser.y"
              { CurrentSemanticValue.type = 'i';}
#line default
        break;
      case 19: // idef -> DouT
#line 128 "parser.y"
           { CurrentSemanticValue.type = 'd';}
#line default
        break;
      case 20: // idef -> BooT
#line 129 "parser.y"
           { CurrentSemanticValue.type = 'b';}
#line default
        break;
      case 21: // asn -> Var, Eq, exp, Sc
#line 132 "parser.y"
                      { string namei="i_"+ValueStack[ValueStack.Depth-4].val, named="d_"+ValueStack[ValueStack.Depth-4].val;
							if(variables.Contains(namei) && ValueStack[ValueStack.Depth-2].type!='i')
							{
								 Console.WriteLine("  line {0,3}:  semantic error - cannot convert double to int",lineno);
								 ++Compiler.errors;
							}
							else if(variables.Contains(named))
							{
								if(ValueStack[ValueStack.Depth-2].type!='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("stloc {0}",named);
							}
							else if(variables.Contains(namei))
							{
								if(ValueStack[ValueStack.Depth-2].type=='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("stloc {0}",namei);
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-4].val); Compiler.errors++;
							}
						}
#line default
        break;
      case 22: // asn -> Var, Eq, bool, Sc
#line 153 "parser.y"
                     { string nameb="b_"+ValueStack[ValueStack.Depth-4].val;
							if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc {0}",nameb);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-4].val); Compiler.errors++;
							}

						}
#line default
        break;
      case 23: // asn -> Var, Eq, log, Sc
#line 165 "parser.y"
                  { string nameb="b_"+ValueStack[ValueStack.Depth-4].val;
							if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc {0}",nameb);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-4].val); Compiler.errors++;
							}

						}
#line default
        break;
      case 24: // asn -> Var, Eq, rel, Sc
#line 177 "parser.y"
                    { string nameb="b_"+ValueStack[ValueStack.Depth-4].val;
							if(variables.Contains(nameb))
							{
								Compiler.EmitCode("stloc {0}",nameb);
								Compiler.EmitCode("");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-4].val); Compiler.errors++;
							}

						}
#line default
        break;
      case 25: // asn -> Var, Eq, Minus, exp, Sc
#line 189 "parser.y"
                          { string namei="i_"+ValueStack[ValueStack.Depth-5].val, named="d_"+ValueStack[ValueStack.Depth-5].val;
							if(variables.Contains(namei) && ValueStack[ValueStack.Depth-2].type!='i')
							{
								 Console.WriteLine("  line {0,3}:  semantic error - cannot convert double to int",lineno);
								 ++Compiler.errors;
							}
							else if(variables.Contains(named))
							{
								if(ValueStack[ValueStack.Depth-2].type!='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("neg");
								Compiler.EmitCode("stloc {0}",named);
							}
							else if(variables.Contains(namei))
							{
								if(ValueStack[ValueStack.Depth-2].type=='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("neg");
								Compiler.EmitCode("stloc {0}",namei);
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-5].val); Compiler.errors++;
							}
		  
		  }
#line default
        break;
      case 26: // rel -> exp, LE, exp
#line 214 "parser.y"
                    { Compiler.EmitCode("clt"); Compiler.EmitCode(""); }
#line default
        break;
      case 27: // rel -> exp, LT, exp
#line 215 "parser.y"
                 { Compiler.EmitCode("cgt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
#line default
        break;
      case 28: // rel -> exp, GE, exp
#line 216 "parser.y"
                 { Compiler.EmitCode("cgt"); Compiler.EmitCode(""); }
#line default
        break;
      case 29: // rel -> exp, GT, exp
#line 217 "parser.y"
                 { Compiler.EmitCode("clt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
#line default
        break;
      case 30: // rel -> exp, EQ, exp
#line 218 "parser.y"
                 { Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
#line default
        break;
      case 31: // rel -> exp, NE, exp
#line 219 "parser.y"
                 { Compiler.EmitCode("ceq"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
#line default
        break;
      case 32: // rel -> bool, EQ, bool
#line 220 "parser.y"
                   { Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
#line default
        break;
      case 33: // rel -> bool, NE, bool
#line 221 "parser.y"
                   { Compiler.EmitCode("ceq"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); }
#line default
        break;
      case 35: // log -> bool, LogSum, bool
#line 224 "parser.y"
                          { if(ValueStack[ValueStack.Depth-3].type=='0' && ValueStack[ValueStack.Depth-1].type=='0')
								{
									Compiler.EmitCode("ldc.i4.s {0}",0);
									 Compiler.EmitCode("");
								}
								else
								{
									Compiler.EmitCode("ldc.i4.s {0}",1);
									 Compiler.EmitCode("");
								} }
#line default
        break;
      case 36: // log -> bool, LogInt, bool
#line 234 "parser.y"
                       { if(ValueStack[ValueStack.Depth-3].type=='0' || ValueStack[ValueStack.Depth-1].type=='0')
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
#line default
        break;
      case 37: // Anon@1 -> /* empty */
#line 245 "parser.y"
          {	Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelTrue = "IL_"+n.ToString();
					Compiler.EmitCode("brtrue {0}",Compiler.labelTrue); 
					}
#line default
        break;
      case 38: // log -> rel, Anon@1, LogSum, rel
#line 253 "parser.y"
     { 
					Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelFalse = "IL_"+n.ToString();

					 Compiler.EmitCode("brtrue {0}",Compiler.labelTrue); 
					 Compiler.EmitCode("ldc.i4.s 0"); 
					  Compiler.EmitCode("br {0}",Compiler.labelFalse);
					  Compiler.EmitCode("{0}: ldc.i4.s 1",Compiler.labelTrue);
					 
					 Compiler.EmitCode("{0}: nop", Compiler.labelFalse);
					
					
					
					}
#line default
        break;
      case 39: // Anon@2 -> /* empty */
#line 271 "parser.y"
          {	Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelFalse= "IL_"+n.ToString();
					 Console.WriteLine(Compiler.labelFalse);
					Compiler.EmitCode("brfalse {0}",Compiler.labelFalse);
					}
#line default
        break;
      case 40: // log -> rel, Anon@2, LogInt, rel
#line 281 "parser.y"
     { 
					Random r = new Random();
					int n = 0;
					while(Compiler.labelSet.Contains(n) || n<1)
						n=r.Next();
					Compiler.labelSet.Add(n);
					 Compiler.labelTrue= "IL_"+n.ToString();

					Compiler.EmitCode("brfalse {0}", Compiler.labelFalse); 
					Compiler.EmitCode("ldc.i4.s 1"); 
					Compiler.EmitCode("br {0}",Compiler.labelTrue);
					Compiler.EmitCode("{0}: ldc.i4.s 0",Compiler.labelFalse);
					
					Compiler.EmitCode("{0}: nop",Compiler.labelTrue);
					
					}
#line default
        break;
      case 41: // log -> Var, LogSum, Var
#line 297 "parser.y"
                     { string name1 = "b_"+ValueStack[ValueStack.Depth-3].val,name2="b_"+ValueStack[ValueStack.Depth-1].val;
							if(variables.Contains(name1) && variables.Contains(name2))
							{
								Compiler.EmitCode("ldloc {0}",name1);
								Compiler.EmitCode("ldloc {0}",name2);
								Compiler.EmitCode("or");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0} or {1}",ValueStack[ValueStack.Depth-3].val,ValueStack[ValueStack.Depth-1].val); Compiler.errors++;
							} }
#line default
        break;
      case 42: // log -> Var, LogInt, Var
#line 308 "parser.y"
                     { string name1 = "b_"+ValueStack[ValueStack.Depth-3].val,name2="b_"+ValueStack[ValueStack.Depth-1].val;
							if(variables.Contains(name1) && variables.Contains(name2))
							{
								Compiler.EmitCode("ldloc {0}",name1);
								Compiler.EmitCode("ldloc {0}",name2);
								Compiler.EmitCode("and");
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0} or {1}",ValueStack[ValueStack.Depth-3].val,ValueStack[ValueStack.Depth-1].val); Compiler.errors++;
							} }
#line default
        break;
      case 43: // bool -> True
#line 321 "parser.y"
              { CurrentSemanticValue.type = '1'; Compiler.EmitCode("ldc.i4.s 1"); Compiler.EmitCode(""); }
#line default
        break;
      case 44: // bool -> False
#line 322 "parser.y"
            { CurrentSemanticValue.type = '0'; Compiler.EmitCode("ldc.i4.s 0"); Compiler.EmitCode(""); }
#line default
        break;
      case 45: // exp -> exp, Plus, term
#line 325 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Plus, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 46: // exp -> exp, Minus, term
#line 327 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Minus, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 47: // exp -> term
#line 329 "parser.y"
               { CurrentSemanticValue.type = ValueStack[ValueStack.Depth-1].type; }
#line default
        break;
      case 48: // term -> term, Mult, factor
#line 333 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Mult, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 49: // term -> term, Div, factor
#line 335 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Div, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 50: // term -> factor
#line 337 "parser.y"
               { CurrentSemanticValue.type = ValueStack[ValueStack.Depth-1].type; }
#line default
        break;
      case 51: // factor -> Int
#line 341 "parser.y"
               {
               Compiler.EmitCode("ldc.i4 {0}",int.Parse(ValueStack[ValueStack.Depth-1].val));
               CurrentSemanticValue.type = 'i'; 
               }
#line default
        break;
      case 52: // factor -> Dou
#line 346 "parser.y"
               {
               double d = double.Parse(ValueStack[ValueStack.Depth-1].val,System.Globalization.CultureInfo.InvariantCulture) ;
               Compiler.EmitCode(string.Format(System.Globalization.CultureInfo.InvariantCulture,"ldc.r8 {0}",d));
               CurrentSemanticValue.type = 'd'; 
               }
#line default
        break;
      case 53: // factor -> Var
#line 352 "parser.y"
               {   
			   string namei="i_"+ValueStack[ValueStack.Depth-1].val, named="d_"+ValueStack[ValueStack.Depth-1].val,nameb="b_"+ValueStack[ValueStack.Depth-1].val; 
				  if(variables.Contains(namei))
				  {
					Compiler.EmitCode("ldloc {0}",namei);
					 CurrentSemanticValue.type = 'i';
				  }
				  else if(variables.Contains(named))
				  {
					 Compiler.EmitCode("ldloc {0}",named);
					CurrentSemanticValue.type = 'd'; 
				  }
				  else if(variables.Contains(nameb))
				  {
					 Compiler.EmitCode("ldloc {0}",nameb);
					 CurrentSemanticValue.type = 'b'; 
				  }
				  else
				  {
					 yyerrok(); Console.WriteLine("wrong instruction"); Compiler.errors++; YYAccept();
				  }
		  
               }
#line default
        break;
      case 54: // factor -> OpenPar, exp, ClosePar
#line 376 "parser.y"
               { CurrentSemanticValue.type = ValueStack[ValueStack.Depth-2].type; }
#line default
        break;
    }
#pragma warning restore 162, 1522
  }

  protected override string TerminalToString(int terminal)
  {
    if (aliases != null && aliases.ContainsKey(terminal))
        return aliases[terminal];
    else if (((Tokens)terminal).ToString() != terminal.ToString(CultureInfo.InvariantCulture))
        return ((Tokens)terminal).ToString();
    else
        return CharToString((char)terminal);
  }

#line 380 "parser.y"

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
#line default
}
}
