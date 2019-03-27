public with sharing class WebserviceCall {

    public String currencyTo { get; set; }
    public String currencyFrom { get; set; }
    public String cityName { get; set; }
    public String countryName{ get; set; }
    public String message {get; private set;}
    public Double convertedCurrencyValue{get; private set;}

    public PageReference hello() {    
        GlobalWeatherWebService.GlobalWeatherSoap stub = new GlobalWeatherWebService.GlobalWeatherSoap();
        message = stub.GetWeather(cityName , countryName);
        return null;
    }
    public PageReference convertCurrency() {    
        CurrencyConvertorWebService.CurrencyConvertorSoap stub = new CurrencyConvertorWebService.CurrencyConvertorSoap();
        convertedCurrencyValue = stub.ConversionRate(currencyFrom , currencyTo);
        return null;
    }
}