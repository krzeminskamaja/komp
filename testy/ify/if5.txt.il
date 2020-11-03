.assembly extern mscorlib { }
.assembly kompilator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.maxstack 128
.locals init(float64 temp)
ldc.r8 0
stloc temp

.locals init(int32 tempInt)
ldc.i4 0
stloc tempInt

.locals init (bool b_a)
ldc.i4 0
stloc b_a

ldloc b_a
ldc.i4 0
ceq
brfalse IL_0
br IL_653104090
br IL_2033120541
IL_0: nop 
IL_2033120541: nop 
IL_653104090: nop
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
