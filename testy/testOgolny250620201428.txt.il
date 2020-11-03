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

.locals init (int32 i_x)
ldc.i4 0
stloc i_x

ldc.i4 9
ldc.i4 0
ceq

brfalse IL_2139402448
ldc.i4 1

brfalse IL_2139402448
ldc.i4 1
br IL_1465776772
IL_2139402448: ldc.i4 0
IL_1465776772: nop
dup
stloc b_b
ldloc b_b
call void [mscorlib]System.Console::Write(bool)

ldc.i4 9
neg
dup
stloc i_x
ldloc i_x
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
