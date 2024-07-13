abstract class Failure {
  Failure(this.message);

  final String message;
}

class HttpFailure implements Failure {
  HttpFailure(this.message);

  @override
  final String message;
}
