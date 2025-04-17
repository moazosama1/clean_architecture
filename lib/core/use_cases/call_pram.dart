import 'package:clean_architecture/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCaseCallPram<Type, Pram> {
  Future<Either<Failure, Type>> call([Pram pram]);
}
