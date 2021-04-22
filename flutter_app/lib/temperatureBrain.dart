
class TemperatureBrain {


  String getConversion(topVal,topSelected,bottomSelected)
  { if(topVal == '' || topVal == null)
  {
    return '            ';
  }
  if(topSelected == 'celsius')
  {
    if(bottomSelected == 'fahrenheit')
    {
      return _getCelsiusToFahreheit(topVal);
    }
    else if(bottomSelected == 'kelvin')
    {
      return _getCelsiusToKelvin(topVal);
    }
    else
      return topVal;
  }


  else if(topSelected == 'fahrenheit')
  {
    if(bottomSelected == 'celsius')
    {
      return _getFahrenheitToCelsius(topVal);
    }

    else if(bottomSelected == 'kelvin')
    {
      return _getFahrenheitToKelvin(topVal);
    }

    else
      return topVal;
  }


  else if(topSelected == 'kelvin')
  {
    if(bottomSelected == 'celsius')
    {
      return _getKelvinToCelsius(topVal);
    }

    else if(bottomSelected == 'fahrenheit')
    {
      return _getKelvinToFahrenheit(topVal);
    }

    else
      return topVal;
  }

  else
    return "     ";

  }


  String _getCelsiusToFahreheit(topVal)
  {
    double dCelsius = double.parse(topVal);
    double result = (dCelsius*9/5) + 32;

    return result.toStringAsFixed(4);

  }

  String _getCelsiusToKelvin(topVal)
  {
    double dCelsius = double.parse(topVal);
    double result = dCelsius + 273.15;

    return result.toStringAsFixed(4);

  }

  String _getFahrenheitToCelsius(topVal)
  {
    double dFahren = double.parse(topVal);
    double result = (dFahren - 32) * 5/9;

    return result.toStringAsFixed(4);

  }

  String _getFahrenheitToKelvin(topVal)
  {
    double dFahren = double.parse(topVal);
    double result = ((dFahren - 32) * 5/9) + 273.15 ;

    return result.toStringAsFixed(4);

  }

  String _getKelvinToCelsius(topVal)
  {
    double dKelvin = double.parse(topVal);
    double result =  dKelvin -273.15;

    return result.toStringAsFixed(4);

  }

  String _getKelvinToFahrenheit(topVal)
  {
    double dKelvin = double.parse(topVal);
    double result = ((dKelvin -273.15)*9/5) + 32;

    return result.toStringAsFixed(4);

  }

}   // Class ends