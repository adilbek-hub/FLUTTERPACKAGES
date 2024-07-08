part of 'person_bloc.dart';

sealed class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class GetPerson extends PersonEvent {
  const GetPerson();

  @override
  List<Object> get props => [];
}
