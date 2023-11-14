sealed class Result<T> {
  const Result._();
}

class ResultLoading extends Result<Never> {
  const ResultLoading(this.progress, this.progressLength) : super._();

  final int progress;
  final int progressLength;
}

class ResultSuccess<T> extends Result<T> {
  const ResultSuccess(this.value) : super._();

  final T value;
}

class ResultError<T extends Exception> extends Result<Never> {
  const ResultError(this.exception) : super._();

  final T exception;
}
