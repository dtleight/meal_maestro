class Quantity
{
  double value;
  MeasurementUnits type;
  Quantity(this.value,this.type);

  Quantity scale(int n)
  {
    return Quantity(value*n, type);
  }

  Quantity convert(MeasurementUnits conversionType)
  {
    return Quantity(conversionType.convertFrom(type,value), conversionType);
  }

  @override
  String toString()
  {
    return value.toString() + type.toString().replaceAll("MeasurementUnits.", " ");
  }

  Map<String,dynamic> toMap()
  {
    return {"type": this.type.index, "value": this.value,};
  }

}

enum MeasurementUnits
{
  cups,
  teaspoons,
  tablespoons,
  ounces,
  pounds,
  grams,
  quarts,
  pints,
  gallons,

}

extension MeasurementType on MeasurementUnits
{
  double convertFrom(MeasurementUnits type, double value)
  {
    return 0.0;
  }
}