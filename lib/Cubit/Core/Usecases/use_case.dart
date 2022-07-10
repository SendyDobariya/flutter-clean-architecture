import 'package:clean_demo/Cubit/Core/Failure/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, T> {
  Stream<Either<Failure, Type>> call(T params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
