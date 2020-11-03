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

ldc.i4 1
stloc i_a
IL_1646701098: nop
ldloc i_a
ldc.i4 10
cgt
ldc.i4 0
ceq

brfalse IL_276548766
ldstr "a"
call void [mscorlib]System.Console::Write(string)

ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc i_a
ldc.i4 1
add
stloc i_a
br IL_1646701098
IL_276548766: nop
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
