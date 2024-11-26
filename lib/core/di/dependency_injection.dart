part of './../helpers/export_manager/export_manager.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<SignInCubit>(() => SignInCubit());
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit());
  getIt.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit());
  getIt.registerFactory<WeatherCubit>(() => WeatherCubit(getIt()));
}
