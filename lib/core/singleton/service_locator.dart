import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:montra_app_a1/assets/constants/store_keys.dart';
import 'package:montra_app_a1/core/singleton/dio.dart';
import 'package:montra_app_a1/core/singleton/storage.dart';


final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(DioSettings.new);



}
