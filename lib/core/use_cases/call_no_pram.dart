import 'package:clean_architecture/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCaseCallNoPram<Type> {
  Future<Either<Failure, Type>> call();
}
