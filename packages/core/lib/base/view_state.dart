abstract class ViewState {
  bool get isBusy => this is BusyState;

  bool get isIdle => this is IdleState;

  bool get hasError => isIdle ? (this as IdleState)._hasError : false;
}

class BusyState extends ViewState {}

class IdleState extends ViewState {
  final bool _hasError;

  IdleState({bool hasError = false}) : _hasError = hasError;
}

class DataState<T> extends ViewState {
  final T data;

  DataState(this.data);
}

class EmptyState extends ViewState {}

class ErrorState extends ViewState {
  final String message;

  ErrorState({required this.message});
}
