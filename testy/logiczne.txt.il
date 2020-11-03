.assembly extern mscorlib { }
.assembly calculator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init(float64 temp)
ldc.r8 0
stloc temp

.locals init (bool b_a)
ldc.i4.s 0
stloc b_a

.locals init (bool b_b)
ldc.i4.s 0
stloc b_b

.locals init (bool b_c)
ldc.i4.s 0
stloc b_c

.locals init (bool b_d)
ldc.i4.s 0
stloc b_d

ldc.i4.s 1

stloc b_a

ldc.i4.s 0

stloc b_b

ldloc b_a
ldloc b_b
or
stloc b_c

ldloc b_c
call void [mscorlib]System.Console::Write(bool)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc b_a
ldloc b_b
and
stloc b_d

ldloc b_d
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
