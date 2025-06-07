import 'dart:async';

import 'package:flutter_assignment/features/customer/domain/user_case/get_users_use_case.dart';
import 'package:flutter_assignment/features/customer/presentation/bloc/user_event.dart';
import 'package:flutter_assignment/features/customer/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  int offset = 0;
  Timer? _debounceTimer;
  final GetUsersUseCase getUsersUseCase;
  UserBloc({required this.getUsersUseCase}) : super(const UserInitial()) {
    getUsers(10);
  }

  Future<void> getUsers(int offset) async {
    on<FetchUsers>(_onFetchUsers);
    on<SearchUsers>(_onSearchUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await getUsersUseCase.execute(event.offset);
      offset = event.offset + 10;
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onSearchUsers(
    SearchUsers event,
    Emitter<UserState> emit,
  ) async {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    final Completer<void> completer = Completer<void>();
    _debounceTimer = Timer(Duration(milliseconds: 500), () async {
      if (emit.isDone) return;
      try {
        if (event.query.isEmpty) {
          add(FetchUsers(offset: 0));
        } else {
          final searchedUsers = await getUsersUseCase.search(event.query);
          if (searchedUsers.isNotEmpty) {
            emit(UserLoaded(searchedUsers));
          }
        }
      } catch (error) {
        emit(UserError("Search failed"));
      }
      completer.complete();
    });

    await completer.future;
  }
}
