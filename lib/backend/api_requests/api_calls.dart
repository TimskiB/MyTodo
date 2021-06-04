import 'api_manager.dart';

Future<dynamic> herzliyaWeatherCall() => ApiManager.instance.makeApiCall(
      callName: 'Herzliya Weather',
      apiDomain: 'api.openweathermap.org',
      apiEndpoint:
          'data/2.5/weather?q=herzliya&appid=1e7d1069ccd317b6c5cfa447fa009336',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );
