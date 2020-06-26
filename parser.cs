// This code was generated by the Gardens Point Parser Generator
// Copyright (c) Wayne Kelly, John Gough, QUT 2005-2014
// (see accompanying GPPGcopyright.rtf)

// GPPG version 1.5.2
// Machine:  DESKTOP-1T6954A
// DateTime: 26.06.2020 16:24:02
// UserName: Maya
// Input file <parser.y - 26.06.2020 16:23:56>

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
    LT=25,GT=26,EQ=27,NE=28,If=29,Else=30,
    Return=31,While=32,Read=33,Int=34,Str=35,Dou=36,
    Var=37};

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
  private static Rule[] rules = new Rule[68];
  private static State[] states = new State[118];
  private static string[] nonTerms = new string[] {
      "content", "print", "dek", "idef", "exp", "asn", "term", "factor", "deklar", 
      "blok", "ifs", "log", "single", "return", "els", "loop", "read", "start", 
      "$accept", "Anon@1", "Anon@2", "Anon@3", "Anon@4", "Anon@5", "Anon@6", 
      "rel", "Anon@7", };

  static Parser() {
    states[0] = new State(new int[]{4,3,2,115,3,117},new int[]{-18,1});
    states[1] = new State(new int[]{3,2});
    states[2] = new State(-1);
    states[3] = new State(new int[]{5,4});
    states[4] = new State(new int[]{9,112,10,113,11,114,7,-6,37,-6,34,-6,36,-6,13,-6,14,-6,16,-6,5,-6,29,-6,32,-6,33,-6,31,-6,2,-6,6,-6},new int[]{-9,5,-3,107,-4,109});
    states[5] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,6,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[6] = new State(new int[]{6,7});
    states[7] = new State(new int[]{3,8});
    states[8] = new State(-2);
    states[9] = new State(new int[]{8,10});
    states[10] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,11,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[11] = new State(-7);
    states[12] = new State(new int[]{35,13,2,15,37,16,34,29,36,30,13,32,14,33,16,34},new int[]{-6,14,-12,19,-26,37,-5,54,-7,45,-8,44});
    states[13] = new State(-35);
    states[14] = new State(-36);
    states[15] = new State(-37);
    states[16] = new State(new int[]{12,17,19,-64,20,-64,15,-64,18,-64,23,-64,25,-64,24,-64,26,-64,27,-64,28,-64,22,-64,21,-64,8,-64,17,-64});
    states[17] = new State(new int[]{37,16,34,29,36,30,13,32,14,33,16,34},new int[]{-6,18,-12,19,-26,37,-5,54,-7,45,-8,44});
    states[18] = new State(-42);
    states[19] = new State(new int[]{8,-43,17,-43,22,-44,21,-46},new int[]{-25,20,-27,55});
    states[20] = new State(new int[]{22,21});
    states[21] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-26,22,-5,54,-7,45,-8,44});
    states[22] = new State(new int[]{23,23,25,38,24,46,26,48,27,50,28,52,22,-45,21,-45,8,-45,17,-45});
    states[23] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-5,24,-7,45,-8,44});
    states[24] = new State(new int[]{15,25,18,40,23,-49,25,-49,24,-49,26,-49,27,-49,28,-49,22,-49,21,-49,8,-49,17,-49});
    states[25] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-7,26,-8,44});
    states[26] = new State(new int[]{19,27,20,42,15,-56,18,-56,23,-56,25,-56,24,-56,26,-56,27,-56,28,-56,22,-56,21,-56,8,-56,17,-56});
    states[27] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-8,28});
    states[28] = new State(-59);
    states[29] = new State(-62);
    states[30] = new State(-63);
    states[31] = new State(-64);
    states[32] = new State(-65);
    states[33] = new State(-66);
    states[34] = new State(new int[]{37,16,34,29,36,30,13,32,14,33,16,34},new int[]{-6,35,-12,19,-26,37,-5,54,-7,45,-8,44});
    states[35] = new State(new int[]{17,36});
    states[36] = new State(-67);
    states[37] = new State(new int[]{23,23,25,38,24,46,26,48,27,50,28,52,22,-48,21,-48,8,-48,17,-48});
    states[38] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-5,39,-7,45,-8,44});
    states[39] = new State(new int[]{15,25,18,40,23,-50,25,-50,24,-50,26,-50,27,-50,28,-50,22,-50,21,-50,8,-50,17,-50});
    states[40] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-7,41,-8,44});
    states[41] = new State(new int[]{19,27,20,42,15,-57,18,-57,23,-57,25,-57,24,-57,26,-57,27,-57,28,-57,22,-57,21,-57,8,-57,17,-57});
    states[42] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-8,43});
    states[43] = new State(-60);
    states[44] = new State(-61);
    states[45] = new State(new int[]{19,27,20,42,15,-58,18,-58,23,-58,25,-58,24,-58,26,-58,27,-58,28,-58,22,-58,21,-58,8,-58,17,-58});
    states[46] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-5,47,-7,45,-8,44});
    states[47] = new State(new int[]{15,25,18,40,23,-51,25,-51,24,-51,26,-51,27,-51,28,-51,22,-51,21,-51,8,-51,17,-51});
    states[48] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-5,49,-7,45,-8,44});
    states[49] = new State(new int[]{15,25,18,40,23,-52,25,-52,24,-52,26,-52,27,-52,28,-52,22,-52,21,-52,8,-52,17,-52});
    states[50] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-5,51,-7,45,-8,44});
    states[51] = new State(new int[]{15,25,18,40,23,-53,25,-53,24,-53,26,-53,27,-53,28,-53,22,-53,21,-53,8,-53,17,-53});
    states[52] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-5,53,-7,45,-8,44});
    states[53] = new State(new int[]{15,25,18,40,23,-54,25,-54,24,-54,26,-54,27,-54,28,-54,22,-54,21,-54,8,-54,17,-54});
    states[54] = new State(new int[]{15,25,18,40,23,-55,25,-55,24,-55,26,-55,27,-55,28,-55,22,-55,21,-55,8,-55,17,-55});
    states[55] = new State(new int[]{21,56});
    states[56] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-26,57,-5,54,-7,45,-8,44});
    states[57] = new State(new int[]{23,23,25,38,24,46,26,48,27,50,28,52,22,-47,21,-47,8,-47,17,-47});
    states[58] = new State(new int[]{8,59});
    states[59] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,60,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[60] = new State(-8);
    states[61] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,62,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[62] = new State(-9);
    states[63] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,64,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[64] = new State(new int[]{6,65});
    states[65] = new State(-34);
    states[66] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,67,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[67] = new State(-10);
    states[68] = new State(new int[]{16,69});
    states[69] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-12,70,-26,37,-5,54,-7,45,-8,44});
    states[70] = new State(new int[]{17,71,22,-44,21,-46},new int[]{-25,20,-27,55});
    states[71] = new State(-17,new int[]{-20,72});
    states[72] = new State(new int[]{5,63,37,16,34,29,36,30,13,32,14,33,16,34,7,12,33,86,32,89,29,68,31,98},new int[]{-13,73,-10,79,-6,80,-12,19,-26,37,-5,54,-7,45,-8,44,-2,82,-17,84,-16,88,-11,96,-14,97});
    states[73] = new State(-18,new int[]{-21,74});
    states[74] = new State(new int[]{30,76,7,-22,37,-22,34,-22,36,-22,13,-22,14,-22,16,-22,5,-22,29,-22,32,-22,33,-22,31,-22,2,-22,6,-22},new int[]{-15,75});
    states[75] = new State(-19);
    states[76] = new State(-20,new int[]{-22,77});
    states[77] = new State(new int[]{5,63,37,16,34,29,36,30,13,32,14,33,16,34,7,12,33,86,32,89,29,68,31,98},new int[]{-13,78,-10,79,-6,80,-12,19,-26,37,-5,54,-7,45,-8,44,-2,82,-17,84,-16,88,-11,96,-14,97});
    states[78] = new State(-21);
    states[79] = new State(-27);
    states[80] = new State(new int[]{8,81});
    states[81] = new State(-28);
    states[82] = new State(new int[]{8,83});
    states[83] = new State(-29);
    states[84] = new State(new int[]{8,85});
    states[85] = new State(-30);
    states[86] = new State(new int[]{37,87});
    states[87] = new State(-16);
    states[88] = new State(-31);
    states[89] = new State(-23,new int[]{-23,90});
    states[90] = new State(new int[]{16,91});
    states[91] = new State(new int[]{34,29,36,30,37,31,13,32,14,33,16,34},new int[]{-12,92,-26,37,-5,54,-7,45,-8,44});
    states[92] = new State(new int[]{17,93,22,-44,21,-46},new int[]{-25,20,-27,55});
    states[93] = new State(-24,new int[]{-24,94});
    states[94] = new State(new int[]{5,63,37,16,34,29,36,30,13,32,14,33,16,34,7,12,33,86,32,89,29,68,31,98},new int[]{-13,95,-10,79,-6,80,-12,19,-26,37,-5,54,-7,45,-8,44,-2,82,-17,84,-16,88,-11,96,-14,97});
    states[95] = new State(-25);
    states[96] = new State(-32);
    states[97] = new State(-33);
    states[98] = new State(new int[]{8,99});
    states[99] = new State(-26);
    states[100] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,101,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[101] = new State(-11);
    states[102] = new State(new int[]{8,103});
    states[103] = new State(new int[]{7,12,37,16,34,29,36,30,13,32,14,33,16,34,5,63,29,68,32,89,33,86,31,98,2,106,6,-15},new int[]{-1,104,-2,9,-6,58,-12,19,-26,37,-5,54,-7,45,-8,44,-10,61,-11,66,-16,100,-17,102,-14,105});
    states[104] = new State(-12);
    states[105] = new State(-13);
    states[106] = new State(-14);
    states[107] = new State(new int[]{9,112,10,113,11,114,7,-6,37,-6,34,-6,36,-6,13,-6,14,-6,16,-6,5,-6,29,-6,32,-6,33,-6,31,-6,2,-6,6,-6},new int[]{-9,108,-3,107,-4,109});
    states[108] = new State(-5);
    states[109] = new State(new int[]{37,110});
    states[110] = new State(new int[]{8,111});
    states[111] = new State(-38);
    states[112] = new State(-39);
    states[113] = new State(-40);
    states[114] = new State(-41);
    states[115] = new State(new int[]{3,116});
    states[116] = new State(-3);
    states[117] = new State(-4);

    for (int sNo = 0; sNo < states.Length; sNo++) states[sNo].number = sNo;

    rules[1] = new Rule(-19, new int[]{-18,3});
    rules[2] = new Rule(-18, new int[]{4,5,-9,-1,6,3});
    rules[3] = new Rule(-18, new int[]{2,3});
    rules[4] = new Rule(-18, new int[]{3});
    rules[5] = new Rule(-9, new int[]{-3,-9});
    rules[6] = new Rule(-9, new int[]{});
    rules[7] = new Rule(-1, new int[]{-2,8,-1});
    rules[8] = new Rule(-1, new int[]{-6,8,-1});
    rules[9] = new Rule(-1, new int[]{-10,-1});
    rules[10] = new Rule(-1, new int[]{-11,-1});
    rules[11] = new Rule(-1, new int[]{-16,-1});
    rules[12] = new Rule(-1, new int[]{-17,8,-1});
    rules[13] = new Rule(-1, new int[]{-14});
    rules[14] = new Rule(-1, new int[]{2});
    rules[15] = new Rule(-1, new int[]{});
    rules[16] = new Rule(-17, new int[]{33,37});
    rules[17] = new Rule(-20, new int[]{});
    rules[18] = new Rule(-21, new int[]{});
    rules[19] = new Rule(-11, new int[]{29,16,-12,17,-20,-13,-21,-15});
    rules[20] = new Rule(-22, new int[]{});
    rules[21] = new Rule(-15, new int[]{30,-22,-13});
    rules[22] = new Rule(-15, new int[]{});
    rules[23] = new Rule(-23, new int[]{});
    rules[24] = new Rule(-24, new int[]{});
    rules[25] = new Rule(-16, new int[]{32,-23,16,-12,17,-24,-13});
    rules[26] = new Rule(-14, new int[]{31,8});
    rules[27] = new Rule(-13, new int[]{-10});
    rules[28] = new Rule(-13, new int[]{-6,8});
    rules[29] = new Rule(-13, new int[]{-2,8});
    rules[30] = new Rule(-13, new int[]{-17,8});
    rules[31] = new Rule(-13, new int[]{-16});
    rules[32] = new Rule(-13, new int[]{-11});
    rules[33] = new Rule(-13, new int[]{-14});
    rules[34] = new Rule(-10, new int[]{5,-1,6});
    rules[35] = new Rule(-2, new int[]{7,35});
    rules[36] = new Rule(-2, new int[]{7,-6});
    rules[37] = new Rule(-2, new int[]{7,2});
    rules[38] = new Rule(-3, new int[]{-4,37,8});
    rules[39] = new Rule(-4, new int[]{9});
    rules[40] = new Rule(-4, new int[]{10});
    rules[41] = new Rule(-4, new int[]{11});
    rules[42] = new Rule(-6, new int[]{37,12,-6});
    rules[43] = new Rule(-6, new int[]{-12});
    rules[44] = new Rule(-25, new int[]{});
    rules[45] = new Rule(-12, new int[]{-12,-25,22,-26});
    rules[46] = new Rule(-27, new int[]{});
    rules[47] = new Rule(-12, new int[]{-12,-27,21,-26});
    rules[48] = new Rule(-12, new int[]{-26});
    rules[49] = new Rule(-26, new int[]{-26,23,-5});
    rules[50] = new Rule(-26, new int[]{-26,25,-5});
    rules[51] = new Rule(-26, new int[]{-26,24,-5});
    rules[52] = new Rule(-26, new int[]{-26,26,-5});
    rules[53] = new Rule(-26, new int[]{-26,27,-5});
    rules[54] = new Rule(-26, new int[]{-26,28,-5});
    rules[55] = new Rule(-26, new int[]{-5});
    rules[56] = new Rule(-5, new int[]{-5,15,-7});
    rules[57] = new Rule(-5, new int[]{-5,18,-7});
    rules[58] = new Rule(-5, new int[]{-7});
    rules[59] = new Rule(-7, new int[]{-7,19,-8});
    rules[60] = new Rule(-7, new int[]{-7,20,-8});
    rules[61] = new Rule(-7, new int[]{-8});
    rules[62] = new Rule(-8, new int[]{34});
    rules[63] = new Rule(-8, new int[]{36});
    rules[64] = new Rule(-8, new int[]{37});
    rules[65] = new Rule(-8, new int[]{13});
    rules[66] = new Rule(-8, new int[]{14});
    rules[67] = new Rule(-8, new int[]{16,-6,17});
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
      case 14: // content -> error
#line 33 "parser.y"
            { yyerrok(); Console.WriteLine("unmatched content"); Compiler.errors++; YYAccept();  }
#line default
        break;
      case 16: // read -> Read, Var
#line 36 "parser.y"
                  { 
							Compiler.EmitCode("call string [mscorlib]System.Console::ReadLine()");
							
							string namei = "i_"+ValueStack[ValueStack.Depth-1].val,nameb ="b_"+ValueStack[ValueStack.Depth-1].val,named="d_"+ValueStack[ValueStack.Depth-1].val;
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
							yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-2]); Compiler.errors++;
							}
							}
#line default
        break;
      case 17: // Anon@1 -> /* empty */
#line 61 "parser.y"
                                 { Compiler.licznikIf++;
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
#line default
        break;
      case 18: // Anon@2 -> /* empty */
#line 74 "parser.y"
                { Compiler.EmitCode("br {0}", Compiler.labelEndIf[Compiler.licznikIf]); }
#line default
        break;
      case 20: // Anon@3 -> /* empty */
#line 76 "parser.y"
              { Compiler.EmitCode("{0}: nop ",Compiler.labelIf[Compiler.licznikIf]); }
#line default
        break;
      case 21: // els -> Else, Anon@3, single
#line 76 "parser.y"
                                                                                                { Compiler.EmitCode("{0}: nop ",Compiler.labelEndIf[Compiler.licznikIf]); Compiler.licznikIf--; Compiler.labelEndIf.RemoveAt(Compiler.labelEndIf.Count - 1); }
#line default
        break;
      case 22: // els -> /* empty */
#line 77 "parser.y"
      { Compiler.EmitCode("{0}: nop ",Compiler.labelIf[Compiler.licznikIf]);  Compiler.EmitCode("{0}: nop ",Compiler.labelEndIf[Compiler.licznikIf]); Compiler.licznikIf--; Compiler.labelEndIf.RemoveAt(Compiler.labelEndIf.Count - 1); }
#line default
        break;
      case 23: // Anon@4 -> /* empty */
#line 81 "parser.y"
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
#line default
        break;
      case 24: // Anon@5 -> /* empty */
#line 94 "parser.y"
          { Compiler.EmitCode("brfalse {0}",Compiler.labelWhileAfter[Compiler.licznikPetli]); }
#line default
        break;
      case 25: // loop -> While, Anon@4, OpenPar, log, ClosePar, Anon@5, single
#line 96 "parser.y"
          { Compiler.EmitCode("br {0}",Compiler.labelWhileBefore[Compiler.licznikPetli]); Compiler.EmitCode("{0}: nop",Compiler.labelWhileAfter[Compiler.licznikPetli]); Compiler.licznikPetli--; Compiler.labelWhileAfter.RemoveAt(Compiler.labelWhileAfter.Count - 1);Compiler.labelWhileBefore.RemoveAt(Compiler.labelWhileBefore.Count - 1);}
#line default
        break;
      case 26: // return -> Return, Sc
#line 98 "parser.y"
                      { Random r = new Random();
									int n = 0;
									while(Compiler.labelSet.Contains(n) || n<1)
										n=r.Next();
									Compiler.labelSet.Add(n);
									 Compiler.labelReturn= "IL_"+n.ToString();
									 Console.WriteLine(Compiler.labelReturn); Compiler.EmitCode("br {0}",Compiler.labelReturn); }
#line default
        break;
      case 35: // print -> Print, Str
#line 116 "parser.y"
                     { 
Compiler.EmitCode("ldstr {0}",ValueStack[ValueStack.Depth-1].val); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode("");
						}
#line default
        break;
      case 36: // print -> Print, asn
#line 123 "parser.y"
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
      case 37: // print -> Print, error
#line 146 "parser.y"
                  { yyerrok();  Compiler.errors++;}
#line default
        break;
      case 38: // dek -> idef, Var, Sc
#line 148 "parser.y"
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
										Compiler.EmitCode("ldc.i4 {0}",0);
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
      case 39: // idef -> IntT
#line 206 "parser.y"
              { CurrentSemanticValue.type = 'i';}
#line default
        break;
      case 40: // idef -> DouT
#line 207 "parser.y"
           { CurrentSemanticValue.type = 'd';}
#line default
        break;
      case 41: // idef -> BooT
#line 208 "parser.y"
           { CurrentSemanticValue.type = 'b';}
#line default
        break;
      case 42: // asn -> Var, Eq, asn
#line 211 "parser.y"
                   { string namei="i_"+ValueStack[ValueStack.Depth-3].val, named="d_"+ValueStack[ValueStack.Depth-3].val, nameb = "b_"+ValueStack[ValueStack.Depth-3].val;
							Console.WriteLine("$3 to {0}",ValueStack[ValueStack.Depth-1].type);
							if(variables.Contains(namei) && ValueStack[ValueStack.Depth-1].type!='i')
							{
								 Console.WriteLine("  line {0,3}:  semantic error - cannot convert double to int",lineno);
								 ++Compiler.errors;
							}
							else if(variables.Contains(named))
							{
								if(ValueStack[ValueStack.Depth-1].type!='d')Compiler.EmitCode("conv.r8");
								Compiler.EmitCode("stloc {0}",named);
							}
							else if(variables.Contains(namei))
							{
								 Compiler.EmitCode("stloc {0}",namei);
							}
							else if(variables.Contains(nameb) && ( ValueStack[ValueStack.Depth-1].type=='b'))
							{
								Compiler.EmitCode("stloc {0}",nameb);
							}
							else
							{
								yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-3].val); Compiler.errors++;
							}
						}
#line default
        break;
      case 44: // Anon@6 -> /* empty */
#line 239 "parser.y"
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
      case 45: // log -> log, Anon@6, LogInt, rel
#line 247 "parser.y"
                   { 
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
					CurrentSemanticValue.type = 'b';
					}
#line default
        break;
      case 46: // Anon@7 -> /* empty */
#line 268 "parser.y"
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
      case 47: // log -> log, Anon@7, LogSum, rel
#line 275 "parser.y"
                   { 
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
					
					CurrentSemanticValue.type = 'b';
					}
#line default
        break;
      case 49: // rel -> rel, LE, exp
#line 300 "parser.y"
                    { Compiler.EmitCode("clt"); Compiler.EmitCode(""); CurrentSemanticValue.type = 'b';}
#line default
        break;
      case 50: // rel -> rel, LT, exp
#line 301 "parser.y"
                 { Compiler.EmitCode("cgt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); CurrentSemanticValue.type = 'b';}
#line default
        break;
      case 51: // rel -> rel, GE, exp
#line 302 "parser.y"
                 { Compiler.EmitCode("cgt"); Compiler.EmitCode(""); CurrentSemanticValue.type = 'b'; }
#line default
        break;
      case 52: // rel -> rel, GT, exp
#line 303 "parser.y"
                 { Compiler.EmitCode("clt"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); CurrentSemanticValue.type = 'b';}
#line default
        break;
      case 53: // rel -> rel, EQ, exp
#line 304 "parser.y"
                 { Compiler.EmitCode("ceq"); Compiler.EmitCode("");CurrentSemanticValue.type = 'b'; }
#line default
        break;
      case 54: // rel -> rel, NE, exp
#line 305 "parser.y"
                 { Compiler.EmitCode("ceq"); Compiler.EmitCode("ldc.i4 0");Compiler.EmitCode("ceq"); Compiler.EmitCode(""); CurrentSemanticValue.type = 'b';}
#line default
        break;
      case 56: // exp -> exp, Plus, term
#line 310 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Plus, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 57: // exp -> exp, Minus, term
#line 312 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Minus, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 58: // exp -> term
#line 314 "parser.y"
               { CurrentSemanticValue.type = ValueStack[ValueStack.Depth-1].type; }
#line default
        break;
      case 59: // term -> term, Mult, factor
#line 318 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Mult, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 60: // term -> term, Div, factor
#line 320 "parser.y"
               { CurrentSemanticValue.type = BinaryOpGenCode(Tokens.Div, ValueStack[ValueStack.Depth-3].type, ValueStack[ValueStack.Depth-1].type); }
#line default
        break;
      case 61: // term -> factor
#line 322 "parser.y"
               { CurrentSemanticValue.type = ValueStack[ValueStack.Depth-1].type; }
#line default
        break;
      case 62: // factor -> Int
#line 326 "parser.y"
               {
               Compiler.EmitCode("ldc.i4 {0}",int.Parse(ValueStack[ValueStack.Depth-1].val));
               CurrentSemanticValue.type = 'i'; 
               }
#line default
        break;
      case 63: // factor -> Dou
#line 331 "parser.y"
               {
               double d = double.Parse(ValueStack[ValueStack.Depth-1].val,System.Globalization.CultureInfo.InvariantCulture) ;
               Compiler.EmitCode(string.Format(System.Globalization.CultureInfo.InvariantCulture,"ldc.r8 {0}",d));
               CurrentSemanticValue.type = 'd'; 
               }
#line default
        break;
      case 64: // factor -> Var
#line 337 "parser.y"
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
      case 65: // factor -> True
#line 360 "parser.y"
          { CurrentSemanticValue.type = '1'; Compiler.EmitCode("ldc.i4 1"); Compiler.EmitCode(""); }
#line default
        break;
      case 66: // factor -> False
#line 361 "parser.y"
           { CurrentSemanticValue.type = '0'; Compiler.EmitCode("ldc.i4 0"); Compiler.EmitCode(""); }
#line default
        break;
      case 67: // factor -> OpenPar, asn, ClosePar
#line 364 "parser.y"
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

#line 368 "parser.y"

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
