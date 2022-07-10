import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  String message = "";
  ServerFailure(this.message);
}

class ServeverFailureMessage extends Failure {
  String message;
  ServeverFailureMessage(this.message);
}

class InternetFailure extends Failure {
  String message = "";
  InternetFailure(this.message);
}

class InternetFailureMessage extends Failure {
  String message;
  InternetFailureMessage(this.message);
}

class CacheFailure extends Failure {
  String message = "";
  CacheFailure(this.message);
}

class CacheFailureMessage extends Failure {
  String message;
  CacheFailureMessage(this.message);
}
