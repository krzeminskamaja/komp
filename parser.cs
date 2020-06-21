// This code was generated by the Gardens Point Parser Generator
// Copyright (c) Wayne Kelly, John Gough, QUT 2005-2014
// (see accompanying GPPGcopyright.rtf)

// GPPG version 1.5.2
// Machine:  DESKTOP-1T6954A
// DateTime: 22.06.2020 01:44:45
// UserName: Maya
// Input file <parser.y - 22.06.2020 01:40:24>

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
    Print=7,Sc=8,IntT=9,DouT=10,BooT=11,Int=12,
    Str=13,Dou=14,Var=15};

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
  private static Rule[] rules = new Rule[17];
  private static State[] states = new State[31];
  private static string[] nonTerms = new string[] {
      "content", "print", "dek", "idef", "start", "$accept", };

  static Parser() {
    states[0] = new State(new int[]{4,3,2,28,3,30},new int[]{-5,1});
    states[1] = new State(new int[]{3,2});
    states[2] = new State(-1);
    states[3] = new State(new int[]{5,4});
    states[4] = new State(new int[]{7,10,9,25,10,26,11,27,6,-7},new int[]{-1,5,-2,8,-3,20,-4,22});
    states[5] = new State(new int[]{6,6});
    states[6] = new State(new int[]{3,7});
    states[7] = new State(-2);
    states[8] = new State(new int[]{7,10,9,25,10,26,11,27,6,-7},new int[]{-1,9,-2,8,-3,20,-4,22});
    states[9] = new State(-5);
    states[10] = new State(new int[]{12,11,13,13,14,15,15,17,2,19});
    states[11] = new State(new int[]{8,12});
    states[12] = new State(-8);
    states[13] = new State(new int[]{8,14});
    states[14] = new State(-9);
    states[15] = new State(new int[]{8,16});
    states[16] = new State(-10);
    states[17] = new State(new int[]{8,18});
    states[18] = new State(-11);
    states[19] = new State(-12);
    states[20] = new State(new int[]{7,10,9,25,10,26,11,27,6,-7},new int[]{-1,21,-2,8,-3,20,-4,22});
    states[21] = new State(-6);
    states[22] = new State(new int[]{15,23});
    states[23] = new State(new int[]{8,24});
    states[24] = new State(-13);
    states[25] = new State(-14);
    states[26] = new State(-15);
    states[27] = new State(-16);
    states[28] = new State(new int[]{3,29});
    states[29] = new State(-3);
    states[30] = new State(-4);

    for (int sNo = 0; sNo < states.Length; sNo++) states[sNo].number = sNo;

    rules[1] = new Rule(-6, new int[]{-5,3});
    rules[2] = new Rule(-5, new int[]{4,5,-1,6,3});
    rules[3] = new Rule(-5, new int[]{2,3});
    rules[4] = new Rule(-5, new int[]{3});
    rules[5] = new Rule(-1, new int[]{-2,-1});
    rules[6] = new Rule(-1, new int[]{-3,-1});
    rules[7] = new Rule(-1, new int[]{});
    rules[8] = new Rule(-2, new int[]{7,12,8});
    rules[9] = new Rule(-2, new int[]{7,13,8});
    rules[10] = new Rule(-2, new int[]{7,14,8});
    rules[11] = new Rule(-2, new int[]{7,15,8});
    rules[12] = new Rule(-2, new int[]{7,2});
    rules[13] = new Rule(-3, new int[]{-4,15,8});
    rules[14] = new Rule(-4, new int[]{9});
    rules[15] = new Rule(-4, new int[]{10});
    rules[16] = new Rule(-4, new int[]{11});
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
      case 8: // print -> Print, Int, Sc
#line 27 "parser.y"
                       { Compiler.EmitCode("ldc.i4 {0}",ValueStack[ValueStack.Depth-2].val); Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(int32)"); Compiler.EmitCode("");}
#line default
        break;
      case 9: // print -> Print, Str, Sc
#line 28 "parser.y"
                   { Compiler.EmitCode("ldstr {0}",ValueStack[ValueStack.Depth-2].val); Compiler.EmitCode("call void [mscorlib]System.Console::Write(string)"); Compiler.EmitCode(""); }
#line default
        break;
      case 10: // print -> Print, Dou, Sc
#line 29 "parser.y"
                   { Compiler.EmitCode("ldc.r8 {0}",ValueStack[ValueStack.Depth-2].val); Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(string)"); Compiler.EmitCode("");}
#line default
        break;
      case 11: // print -> Print, Var, Sc
#line 30 "parser.y"
                   { string namei="i_"+ValueStack[ValueStack.Depth-2].val, nameb="b_"+ValueStack[ValueStack.Depth-2].val;
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
									else
									{
									yyerrok(); Console.WriteLine("undeclared variable {0}",ValueStack[ValueStack.Depth-2].val); Compiler.errors++;
									}
								
							
							
							}
#line default
        break;
      case 12: // print -> Print, error
#line 51 "parser.y"
                  { yyerrok();  Compiler.errors++;}
#line default
        break;
      case 13: // dek -> idef, Var, Sc
#line 53 "parser.y"
                     { string name = "";
									switch(ValueStack[ValueStack.Depth-3].type){
									
									case 'i':
										name = "i_"+ValueStack[ValueStack.Depth-2].val;
										if(!variables.Contains(name)){
											Compiler.EmitCode(".locals init (int32 i_{0})",ValueStack[ValueStack.Depth-2].val);
											Compiler.EmitCode("ldc.i4 {0}",0);
											Compiler.EmitCode("stloc i_{0}",ValueStack[ValueStack.Depth-2].val);
											Compiler.EmitCode("ldloc i_{0}",ValueStack[ValueStack.Depth-2].val);
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
										name = "b_"+ValueStack[ValueStack.Depth-2].val;
										if(!variables.Contains(name)){
										Compiler.EmitCode(".locals init (bool b_{0})",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("ldc.i4.s {0}",0);
										Compiler.EmitCode("stloc b_{0}",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("ldloc b_{0}",ValueStack[ValueStack.Depth-2].val);
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
									//to nie dziala
										if(!variables.Contains(ValueStack[ValueStack.Depth-2].val)){
										Compiler.EmitCode(".locals init (double64 {0})",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("ldc.r8 {0}",0);
										Compiler.EmitCode("stloc {0}",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("ldloc {0}",ValueStack[ValueStack.Depth-2].val);
										Compiler.EmitCode("call void [mscorlib]System.Console::WriteLine(double64)"); 
										Compiler.EmitCode("");
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
      case 14: // idef -> IntT
#line 110 "parser.y"
              { CurrentSemanticValue.type = 'i';}
#line default
        break;
      case 15: // idef -> DouT
#line 111 "parser.y"
           { CurrentSemanticValue.type = 'd';}
#line default
        break;
      case 16: // idef -> BooT
#line 112 "parser.y"
           { CurrentSemanticValue.type = 'b';}
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

#line 117 "parser.y"

int lineno=1;

public Parser(Scanner scanner) : base(scanner) { }

List<string> variables = new List<string>();
#line default
}
}
