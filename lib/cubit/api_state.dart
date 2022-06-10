part of 'api_cubit.dart';

enum ApiStatus { initial, loading, success, failure }

class ApiState extends Equatable {
  const ApiState({
    this.status = ApiStatus.loading,
    this.apiList,
    this.exception,
  });

  final ApiStatus status;
  final List<CustomerModel>? apiList;
  final Exception? exception;

  @override
  List<Object?> get props => [
        status,
        apiList,
        exception,
      ];

  ApiState copyWith({
    ApiStatus? status,
    List<CustomerModel>? apiList,
    Exception? exception,
  }) {
    return ApiState(
      status: status ?? this.status,
      apiList: apiList ?? this.apiList,
      exception: exception ?? this.exception,
    );
  }
}
