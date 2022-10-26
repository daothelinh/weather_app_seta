import 'package:base_bloc_3/features/start/domain/entity/movie_entity.dart';
import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/start/domain/repository/start_repository.dart';
import 'package:base_bloc_3/features/start/domain/use_case/start_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: StartUseCase)
class StartUseCaseImpl implements StartUseCase {
  StartUseCaseImpl(this._repo);
  final StartRepository _repo;
  @override
  Future<Either<BaseError, ListMovie>> getMovie({required int index}) {
    return _repo.getMovie(index: index);
  }
}
