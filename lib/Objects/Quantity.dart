class Quantity
{
  int value;
  MeasurementType type;
  Quantity(this.value,this.type);

}

enum MeasurementType
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