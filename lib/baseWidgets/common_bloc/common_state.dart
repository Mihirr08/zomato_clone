part of 'common_cubit.dart';

@immutable
abstract class CommonState {}

class CommonInitial extends CommonState {}
class CommonStateLoading extends CommonState {}
class CommonStateError extends CommonState {
  final String errorText;
  CommonStateError(this.errorText);
}
class CommonStateSuccess<T> extends CommonState {
  final T successData;
 CommonStateSuccess(this.successData);
}
