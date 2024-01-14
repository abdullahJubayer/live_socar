import 'package:equatable/equatable.dart';
import 'package:live_score/utils/network/response_status.dart';

class ResponseState<T> extends Equatable{
  const ResponseState({
    this.state = Status.initial,
    this.message = '',
    this.responseCode = 505,
    this.data,
  }) ;

  final Status state;
  final String message;
  final int responseCode;
  final T? data;


  ResponseState<T> copyWith({
    T? data,
    Status? state,
    String? message,
    int? responseCode,
  }) {
    return ResponseState(
      data: data ?? this.data,
      state: state ?? this.state,
      message: message ?? this.message,
      responseCode: responseCode ?? this.responseCode,
    );
  }

  @override
  List<Object?> get props =>
      [state, data,responseCode, message];
}