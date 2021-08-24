import 'package:get_it/get_it.dart';
import 'package:sleep_baby/ui/modules/home/home_view_model.dart';
import 'package:sleep_baby/ui/repositories/main_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MainRepository());
  locator.registerLazySingleton(() => HomeViewModel());
  // locator.registerLazySingleton(() => ImageDetailViewModel());
  // locator.registerLazySingleton(() => CategoryViewModel());
}
