sealed class ApiResponse<T> {
  const ApiResponse();
}

class Success<T> extends ApiResponse<T> {
  const Success(this.data);
  final T data;
}

class Failure<T> extends ApiResponse<T> {
  const Failure(this.message);
  final String message;
}

class Loading<T> extends ApiResponse<T> {
  const Loading();
}
