import 'package:dartz/dartz.dart';
import 'package:tut_app/data/mappers/mapper.dart';

import '../../domain/model/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data-source.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LogInRequest logInRequest) async {
    var response = await _remoteDataSource.login(logInRequest);
    if (await _networkInfo.isConnected) {
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(409, "No Internet Connection"));
      }
    } else {
      return Left(Failure(409, "No Internet Connection"));
    }
  }
}
