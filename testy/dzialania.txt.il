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
ldc.i4 0
stloc b_b

ldc.i4 3
ldc.i4 9
ceq

brfalse IL_1712548322
ldc.i4 0

brfalse IL_1712548322
ldc.i4 1
br IL_1695383987
IL_1712548322: ldc.i4 0
IL_1695383987: nop
dup
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
