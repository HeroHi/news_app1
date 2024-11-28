abstract class ApiState<T>{
  bool get isSuccess{
    return this is SuccessApiState;
  }
  bool get isLoading{
    return this is LoadingApiState;
  }
  bool get isError{
    return this is ErrorApiState;
  }
  T get getData{
    return (this as SuccessApiState<T>).data;
  }
  String get errorMsg{
    return (this as ErrorApiState).errorMessage;
  }
}
class SuccessApiState<T> extends ApiState{
  T data;
  SuccessApiState(this.data);
}
class LoadingApiState extends ApiState{

}
class ErrorApiState extends ApiState{
  String errorMessage;
  ErrorApiState(this.errorMessage);
}