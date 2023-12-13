import 'package:dio/dio.dart';
import 'package:montra_app_a1/assets/constants/app_urls.dart';
import 'package:montra_app_a1/assets/constants/store_keys.dart';
import 'package:montra_app_a1/core/singleton/storage.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppUrls.baseUrl,
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language': StorageRepository.getString('language', defValue: 'uz')
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: Duration(seconds: 35),
      receiveTimeout: Duration(seconds: 33),
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  setUpInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        print('interceptorOnResponse');
      },
      onRequest: (request, handler) {
        print('interceptorOnRequest');
        request.headers.addAll({});
      },
      onError: (request, errorHandler) {
        print('interceptorOnError');
        if (request.response?.statusCode == 401 ||
            request.response?.statusCode == 403) {
          print('refresh Token');
          dio.post('url', data: {
            "Authorization":
                "Bearer ${StorageRepository.getString(StorageKeys.refresh)}"
          });
        }
      },
    ));
  }

  // final _dio = serviceLocator<DioSettings>().dio; ///sample
  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio {
    var dio1 = Dio(_dioBaseOptions)
      ..interceptors.add(InterceptorsWrapper(
        // onResponse: (response, handler) {
        //   print('interceptorOnResponse');
        // },
        onResponse: (response, handler) async {
          print('interceptorOnResponse');
          if (response.statusCode == 401) {
            print('refresh Token');
            var responseRefresh = await dio.post('url', data: {
              "Authorization":
                  "Bearer ${StorageRepository.getString(StorageKeys.refresh)}"
            });

            if (responseRefresh.statusCode! >= 200 &&
                responseRefresh.statusCode! < 300) {
              handler.next(responseRefresh);
            } else {
              handler.next(response);
            }
          } else {
            handler.next(response);
          }
        },
        onRequest: (request, handler) {
          print('interceptorOnRequest');
          request.headers.addAll({});

          handler.next(request);
        },
        // onError: (request, errorHandler) async {
        //   errorHandler.next(request);
        //   print('interceptorOnError');
        // },
      ));
    return dio1;
  }
}
