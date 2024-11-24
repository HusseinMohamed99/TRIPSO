part of './../helpers/export_manager/export_manager.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<SignInCubit>(() => SignInCubit());
}
