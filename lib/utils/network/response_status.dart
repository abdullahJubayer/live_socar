enum ResponseState {
  initial,
  loading,
  success,
  error,
}

extension ResponseStateX on ResponseState {
  bool get isInitial => this == ResponseState.initial;
  bool get isLoading => this == ResponseState.loading;
  bool get isSuccess => this == ResponseState.success;
  bool get isError => this == ResponseState.error;
}
