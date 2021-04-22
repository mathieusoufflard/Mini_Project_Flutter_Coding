class TemperatureBrain {

  TemperatureBrain();

  final String topSelected = "celsius";
  final String bottomSelected ="fahrenheit";
  final String topVal ="7";


  String getConversion()
  { if(topVal == '' || topVal == null)
  {
    return '            ';
  }
  if(topSelected == 'celsius')
  {
    if(bottomSelected == 'fahrenheit')
    {
      return _getCelsiusToFahreheit();
    }
    else if(bottomSelected == 'kelvin')
    {
      return _getCelsiusToKelvin();
    }
    else
      return topVal;
  }


  else if(topSelected == 'fahrenheit')
  {
    if(bottomSelected == 'celsius')
    {
      return _getFahrenheitToCelsius();
    }

    else if(bottomSelected == 'kelvin')
    {
      return _getFahrenheitToKelvin();
    }

    else
      return topVal;
  }


  else if(topSelected == 'kelvin')
  {
    if(bottomSelected == 'celsius')
    {
      return _getKelvinToCelsius() ;
    }

    else if(bottomSelected == 'fahrenheit')
    {
      return _getKelvinToFahrenheit();
    }

    else
      return topVal;
  }

  else
    return "     ";

  }


  String _getCelsiusToFahreheit()
  {
    double dCelsius = double.parse(topVal);
    double result = (dCelsius*9/5) + 32;

    return result.toStringAsFixed(4);

  }

  String _getCelsiusToKelvin()
  {
    double dCelsius = double.parse(topVal);
    double result = dCelsius + 273.15;

    return result.toStringAsFixed(4);

  }

  String _getFahrenheitToCelsius()
  {
    double dFahren = double.parse(topVal);
    double result = (dFahren - 32) * 5/9;

    return result.toStringAsFixed(4);

  }

  String _getFahrenheitToKelvin()
  {
    double dFahren = double.parse(topVal);
    double result = ((dFahren - 32) * 5/9) + 273.15 ;

    return result.toStringAsFixed(4);

  }

  String _getKelvinToCelsius()
  {
    double dKelvin = double.parse(topVal);
    double result =  dKelvin -273.15;

    return result.toStringAsFixed(4);

  }

  String _getKelvinToFahrenheit()
  {
    double dKelvin = double.parse(topVal);
    double result = ((dKelvin -273.15)*9/5) + 32;

    return result.toStringAsFixed(4);

  }

}   // Class ends