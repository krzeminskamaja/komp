
using System;
using System.IO;
using System.Collections.Generic;
using GardensPoint;

public class Compiler
{
    public static Random r = new Random();
    public static int errors = 0;
    public static int emitNo = 0;
    public static HashSet<int> labelSet = new HashSet<int>();
    public static List<string> labelTrue = new List<string>();
    public static List<string> labelFalse = new List<string>();
    public static int licznikLog = -1;
    public static int licznikIf = -1;
    public static List<string> labelIf = new List<string>();
    public static List<string> labelEndIf = new List<string>();
    public static List<string> labelReturn = new List<string>();
    public static List<string> labelWhileBefore = new List<string>();
    public static List<string> labelWhileAfter = new List<string>();
    public static int licznikPetli = -1;
    public static List<string> source;
    public static int lineno = 1;
    public static int maxStack = 128;

    // arg[0] określa plik źródłowy
    // pozostałe argumenty są ignorowane
    public static int Main(string[] args)
    {
        string file; 
        FileStream source;
        Console.WriteLine("\nSingle-Pass CIL Code Generator for Multiline Calculator - Gardens Point");
        if (args.Length >= 1)
            file = args[0];
        else
        {
            Console.Write("Giva path as argument");
            return 2;
        }
        try
        {
            var sr = new StreamReader(file);
            string str = sr.ReadToEnd();
            sr.Close();
            Compiler.source = new System.Collections.Generic.List<string>(str.Split(new string[] { "\r\n" }, System.StringSplitOptions.None));
            source = new FileStream(file, FileMode.Open);
        }
        catch (Exception e)
        {
            Console.WriteLine("\n" + e.Message);
            Console.ReadLine();
            return 1;
        }
        Scanner scanner = new Scanner(source);
        Parser parser = new Parser(scanner);
        Console.WriteLine();
        sw = new StreamWriter(file + ".il");
        GenProlog();
        bool czySparsowano = false;
        try
        {
            czySparsowano = parser.Parse();
            GenReturnLabel();
            GenEpilog();
            sw.Close();
            source.Close();
        }
        catch
        {
            Console.WriteLine("compilation failed");
            return 2;
        }
       
        if (errors == 0 && czySparsowano)
            Console.WriteLine("  compilation successful\n");
        else
        {
            Console.WriteLine("compilation failed");
            Console.WriteLine($"\n  {errors} errors detected\n");
            File.Delete(file + ".il");
        }
        return (errors == 0 && czySparsowano) ? 0 : 2;
    }

    public static void EmitCode(string instr = null)
    {
        sw.WriteLine(instr);
        emitNo++;
    }

    public static void EmitCode(string instr, params object[] args)
    {
        sw.WriteLine(instr, args);
    }

    private static StreamWriter sw;

    private static void GenReturnLabel()
    {
       foreach(var l in labelReturn) EmitCode("{0}: nop", l);
    }

    private static void GenProlog()
    {
        EmitCode(".assembly extern mscorlib { }"); 
        EmitCode(".assembly kompilator { }");
        EmitCode(".method static void main()");
        EmitCode("{");
        EmitCode(".entrypoint");
        EmitCode(".try");
        EmitCode("{");
        EmitCode();

        EmitCode("// prolog");
        
        EmitCode();
    }

    private static void GenEpilog()
    {
        EmitCode("leave EndMain");
        EmitCode("}");
        EmitCode("catch [mscorlib]System.Exception");
        EmitCode("{");
        EmitCode("callvirt instance string [mscorlib]System.Exception::get_Message()");
        EmitCode("call void [mscorlib]System.Console::WriteLine(string)");
        EmitCode("leave EndMain");
        EmitCode("}");
        EmitCode("EndMain: ret");
        EmitCode("}");
    }

}

