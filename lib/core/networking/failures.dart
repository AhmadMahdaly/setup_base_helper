// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import '/../core/constants.dart';
import '../functions/flutter_toast.dart';
import '../theme/app_colors.dart';

abstract class Failure {

  const Failure(this.errMessage);
  final String errMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioExeption) {
    switch (dioExeption.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExeption.response!.statusCode, dioExeption.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioExeption.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response,
      {String? message}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      customToast(
          msg: response.data['message'].toString(),
          color: AppColors.errorColor);
      userToken = null;
      return ServerFailure(response.data['message'].toString());
    } else if (statusCode == 404) {
      customToast(
          msg: response.data['message'].toString(),
          color: AppColors.errorColor);
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure(
          message ?? 'Opps There was an Error, Please try again');
    }
  }
}
