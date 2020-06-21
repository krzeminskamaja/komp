.assembly extern mscorlib { }
.assembly calculator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init (int32 i_a)
ldc.i4 0
stloc i_a
ldloc i_a
call void [mscorlib]System.Console::WriteLine(int32)

.locals init (bool b_b)
ldc.i4.s 0
stloc b_b
ldloc b_b
call void [mscorlib]System.Console::WriteLine(bool)

ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc b_b
call void [mscorlib]System.Console::Write(bool)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

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
