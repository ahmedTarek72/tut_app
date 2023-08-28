import 'package:dartz/dartz.dart';

import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/domain/model/models.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(String email, String password);
}