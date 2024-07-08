import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_with_bloc/model.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final List<Person> person;
  PersonBloc({required this.person}) : super(PersonInitial()) {
    on<GetPerson>((event, emit) {
      emit(PersonLoading());
      try {
        emit(PersonSuccess(person));
      } catch (e) {
        emit(PersonError(e.toString()));
      }
    });
  }
}
