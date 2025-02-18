
import 'package:dio/dio.dart';
import 'package:driver_app/core/base_constants.dart';
import 'package:driver_app/core/di/injectable.dart';
import 'package:injectable/injectable.dart';


@module
abstract class APIService {

  @Singleton()
  Dio get dio => Dio(BaseOptions(
      contentType: "application/http",
      baseUrl: getIt.get<BaseConstants>().baseUrl));
}

addDioHeader() async {
  final dio = getIt.get<Dio>();
  dio.options.headers["Authorization"] = 'Bearer ${getIt.get<BaseConstants>().apiKey}';
  dio.options.headers["accept"] = 'application/json';
}

