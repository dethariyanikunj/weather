import './language_keys.dart';

class English {
  static Map<String, String> getStrings() {
    return {
      LanguageKey.appName: 'weather',
      LanguageKey.locationPermissionDeniedMessage:
          'Permission denied or unable to fetch location.',
      LanguageKey.locationServiceDisabled: 'Location services are disabled',
      LanguageKey.noInternetConnection:
          'It seems you are not connected to the internet.',
      LanguageKey.oopsSomethingWentWrong: 'Oops! Something went wrong.',
      LanguageKey.searchByCity: 'Search weather with typing city',
      LanguageKey.latitude: 'Latitude',
      LanguageKey.longitude: 'Longitude',
      LanguageKey.address: 'Address',
      LanguageKey.weatherCondition: 'Weather Condition',
      LanguageKey.weatherInCelsius: 'Weather Celsius',
      LanguageKey.weatherInFahrenheit: 'Weather Fahrenheit',
      LanguageKey.history: 'History',
      LanguageKey.noHistory: 'Weather history is empty!',
    };
  }
}
