///
///For APIResultType Use [success], [error], [connectionProblem], [timeout], [unauthorized] #[Status]
///
///For loading use [initial], [success], [error], [loading]  #[Status]
enum ApiState {
  /// [initial] api call
  initial,

  /// result type success
  success,

  /// result type error
  error,

  /// waiting for result
  loading,

  ///
  selected,

  /// update any data
  updated,

  /// internet connection or any other problem
  connectionProblem,

  /// api response timeout error
  timeout,

  /// unauthorized api connection
  unauthorized,

  /// authorized login
  authorized,

  ///search
  search
}

extension StatusX on ApiState {
  bool get isInitial => this == ApiState.initial;

  bool get isSuccess => this == ApiState.success;

  bool get isError => this == ApiState.error;

  bool get isLoading => this == ApiState.loading;

  bool get isSelected => this == ApiState.selected;

  bool get isUpdate => this == ApiState.updated;

  bool get isConnectionProblem => this == ApiState.connectionProblem;

  bool get isTimeout => this == ApiState.timeout;

  bool get isUnauthorized => this == ApiState.unauthorized;

  bool get isAuthorized => this == ApiState.authorized;
}
