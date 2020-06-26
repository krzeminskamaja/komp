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

.locals init (float64 d_b)
ldc.r8 0
stloc d_b

ldc.r8 7.8
conv.i4
stloc i_a
ldc.i4 1

conv.r8
stloc d_b
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc d_b
stloc temp
call class [mscorlib]System.Globalization.CultureInfo [mscorlib]System.Globalization.CultureInfo::get_InvariantCulture()
ldstr "{0:0.000000}"
ldloc temp
box [mscorlib]System.Double
call string [mscorlib]System.String::Format(class [mscorlib]System.IFormatProvider,string, object)
call void [mscorlib]System.Console::Write(string)

ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc i_a
conv.r8
stloc d_b
ldloc d_b
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
