import 'package:dartz/dartz.dart';
import 'package:law_sphere/core/errors/failure.dart';
import '../models/login_response.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(String email, String password);
}
