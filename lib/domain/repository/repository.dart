import 'package:dartz/dartz.dart';

import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/domain/model/models.dart';
  // repository to get data from network
abstract class Repository{
  // login method to get data from network
  // with Either to handle success and failure
  Future<Either<Failure,Authentication>> login(String email, String password);
}