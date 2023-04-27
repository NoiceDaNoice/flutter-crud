import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_testing/model/user_model.dart';
import 'package:flutter_app_testing/service/api.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getAllUser() async {
    try {
      emit(UserLoading());
      final users = await Api().getAllUser();
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  void addUser({required String name, required String job}) async {
    try {
      emit(UserLoading());
      final code = await Api().addUser(name: name, job: job);
      emit(UserSuccessCode(code));
      final users = await Api().getAllUser();
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  void updateUser(
      {required String name, required String job, required String id}) async {
    try {
      emit(UserLoading());
      final code = await Api().updateUser(name: name, job: job, id: id);
      emit(UserSuccessCode(code));
      final users = await Api().getAllUser();
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  void delete({required String id}) async {
    try {
      emit(UserLoading());
      final code = await Api().deteleUser(id: id);
      emit(UserSuccessCode(code));
      final users = await Api().getAllUser();
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }
}
