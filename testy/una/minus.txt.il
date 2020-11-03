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

ldc.i4 10
stloc i_a
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldc.i4 10
neg
stloc i_a
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
