import 'error_marketi_model.dart';

abstract class Failure {
  final ErrorMarketiModel errorModel;
  const Failure(this.errorModel);

  @override
  String toString() => errorModel.message ?? "";
}

// Corresponding to exceptions
class ServerFailure extends Failure {
  ServerFailure(super.errorModel);
}

class CacheFailure extends Failure {
  CacheFailure(super.errorModel);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errorModel);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(super.errorModel);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.errorModel);
}
