import 'package:dio/dio.dart';

extension ErrorHandler on DioError {
  String get errorMessage {
    try {
      final error = response?.data as Map<String, dynamic>?;
      if(error == null) {
        return 'Something went wrong';
      }
      return (error['error'] as Map<String, dynamic>)['message'].toString();
    } catch (e) {
      return 'Something went wrong';
    }
  }
}
