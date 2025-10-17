enum RequestState { initial, loading, success, error, empty }

class GenericState<T> {
  final RequestState state;
  final T? data;
  final String? message;

  const GenericState({required this.state, this.data, this.message});

  GenericState<T> copyWith({RequestState? state, T? data, String? message}) {
    return GenericState<T>(
      state: state ?? this.state,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  factory GenericState.initial() =>
      const GenericState(state: RequestState.initial);

  factory GenericState.loading() =>
      const GenericState(state: RequestState.loading);

  factory GenericState.success(T data) =>
      GenericState(state: RequestState.success, data: data);

  factory GenericState.error(String message) =>
      GenericState(state: RequestState.error, message: message);

  factory GenericState.empty() => const GenericState(state: RequestState.empty);
}
