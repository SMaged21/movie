abstract class Failure {}

class ServerFailure extends Failure {
  final String errMessage;

  ServerFailure({required this.errMessage});
}
