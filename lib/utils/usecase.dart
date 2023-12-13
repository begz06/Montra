import 'package:equatable/equatable.dart';
import 'package:montra_app_a1/utils/either.dart';
import 'package:montra_app_a1/utils/failures.dart';




abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
