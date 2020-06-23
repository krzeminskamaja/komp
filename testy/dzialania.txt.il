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

.locals init (float64 d_i)
ldc.r8 0
stloc d_i

.locals init (float64 d_j)
ldc.r8 0
stloc d_j

.locals init (bool b_b)
ldc.i4.s 0
stloc b_b

ldloc d_i
ldc.i4 1
conv.r8
add
ldloc b_b
call void [mscorlib]System.Console::Write(bool)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldc.i4 2
ldc.i4 5
add
ldc.i4 3
mul
conv.r8
stloc d_i
ldloc d_i
call void [mscorlib]System.Console::Write(float64)

ldloc d_i
ldc.i4 0
conv.r8
sub
stloc d_j
ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc d_j
call void [mscorlib]System.Console::Write(float64)

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
