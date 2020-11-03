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

.locals init (float64 d_x)
ldc.r8 0
stloc d_x

.locals init (float64 d_y)
ldc.r8 0
stloc d_y

ldc.r8 0.5
dup
stloc d_x
pop
ldc.r8 0.2
dup
stloc d_y
pop
ldloc d_x
ldloc d_x
mul
ldloc d_y
ldloc d_y
mul
add
ldc.i4 1
conv.r8
cgt
ldc.i4 0
ceq

brfalse IL_1183710634
ldloc d_x
ldc.i4 1
conv.r8
add
dup
stloc d_x
pop
br IL_1511599278
IL_1183710634: nop 
IL_1511599278: nop 
ldloc d_x
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
