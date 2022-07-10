import 'package:coco_explorer/core/domain/utils/constants.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ServerErrorCode errorCode;
  final String message;

  ServerFailure({required this.errorCode, this.message = ''});
}

class CacheFailure implements Failure {}

class LogicFailure implements Failure {
  final String message;

  LogicFailure(this.message);
}

class AppAccessDeniedFailure implements Failure {}
