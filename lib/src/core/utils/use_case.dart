import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:planner_app/src/core/error/failure.dart';

///
/// UseCase is called with Failure or some type of data representation
///
///
mixin UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

///
/// No params if the data object is in local cache
///
class NoParam extends Equatable {
  @override
  List<Object> get props => [];
}
