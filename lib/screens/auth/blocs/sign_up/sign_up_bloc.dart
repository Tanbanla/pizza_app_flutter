import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;

  SignUpBloc({required this.userRepository}) : super(SignUpInitial()) {
    on<SignUprequested>((event, emit) async {
      emit(SignUpLoading());
      try {
        await userRepository.signUp(event.user, event.password);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });
  }
}
