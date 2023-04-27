part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserModel> users;
  const UserSuccess(this.users);

  @override
  // TODO: implement props
  List<Object> get props => [users];
}

class UserSuccessCode extends UserState {
  final int code;
  const UserSuccessCode(this.code);

  @override
  // TODO: implement props
  List<Object> get props => [code];
}

class UserFailed extends UserState {
  final String error;

  const UserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
