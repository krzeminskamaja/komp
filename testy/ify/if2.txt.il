.assembly extern mscorlib { }
.assembly kompilator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init(float64 temp)
ldc.r8 0
stloc temp

.locals init(int32 tempInt)
ldc.i4 0
stloc tempInt

.locals init (int32 i_a)
ldc.i4 0
stloc i_a

ldc.i4 2
ldc.i4 0
cgt

brfalse IL_921608289
ldstr "w 1 if"
call void [mscorlib]System.Console::Write(string)

call string [mscorlib]System.Console::ReadLine()
ldloca i_a
call bool [mscorlib]System.Int32::TryParse(string, int32&)
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldc.i4 3
ldc.i4 0
clt

brfalse IL_2795390
ldstr "w 2 if"
call void [mscorlib]System.Console::Write(string)

call string [mscorlib]System.Console::ReadLine()
ldloca i_a
call bool [mscorlib]System.Int32::TryParse(string, int32&)
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

br IL_118142217
IL_2795390: nop 
ldstr "w 2 else"
call void [mscorlib]System.Console::Write(string)

ldc.i4 1

brfalse IL_225819780
call string [mscorlib]System.Console::ReadLine()
ldloca i_a
call bool [mscorlib]System.Int32::TryParse(string, int32&)
br IL_1033611955
IL_225819780: nop 
ldc.i4 0
IL_1033611955: nop 
IL_118142217: nop 
br IL_523560290
IL_921608289: nop 
IL_523560290: nop 
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

leave EndMain
}
catch [mscorlib]System.Exception
{
callvirt instance string [mscorlib]System.Exception::get_Message()
call void [mscorlib]System.Console::WriteLine(string)
leave EndMain
}
EndMain: ret
}
