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

.locals init (float64 d_d)
ldc.r8 0
stloc d_d

.locals init (int32 i_k)
ldc.i4 0
stloc i_k

ldloc d_d
ldloc i_k
conv.r8
ldc.i4 0
conv.r8
ceq
ldc.i4 0
ceq

conv.i4
conv.r8
add
dup
stloc d_d
pop
ldloc d_d
stloc temp
call class [mscorlib]System.Globalization.CultureInfo [mscorlib]System.Globalization.CultureInfo::get_InvariantCulture()
ldstr "{0:0.000000}"
ldloc temp
box [mscorlib]System.Double
call string [mscorlib]System.String::Format(class [mscorlib]System.IFormatProvider,string, object)
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
