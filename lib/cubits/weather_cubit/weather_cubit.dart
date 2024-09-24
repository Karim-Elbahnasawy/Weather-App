import 'package:bloc/bloc.dart';
import 'package:test_weather/cubits/weather_cubit/weather_state.dart';
import '../../../models/weather_model.dart';
import '../../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getCurrentWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSucessState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
