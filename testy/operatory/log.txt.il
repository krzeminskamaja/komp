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

.locals init (bool b_b)
ldc.i4.s 0
stloc b_b

ldc.i4 1
ldc.i4 5
cgt

brtrue IL_2128780708
ldc.i4 1
ldc.i4 0
cgt

brtrue IL_2128780708
IL_2128780708: ldc.i4.s 1
ldc.i4.s 0
stloc b_b

ldloc b_b
call void [mscorlib]System.Console::Write(bool)

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
