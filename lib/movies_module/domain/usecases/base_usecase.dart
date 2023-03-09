import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<Input, Output>{
  Future<Either<Failure, Output>> call (Input input);
}

class NoParameters extends Equatable{

  const NoParameters();

  @override
  List<Object?> get props => [];
}