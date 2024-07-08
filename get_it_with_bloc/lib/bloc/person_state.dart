part of 'person_bloc.dart';

sealed class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

final class PersonInitial extends PersonState {}

final class PersonLoading extends PersonState {}

final class PersonSuccess extends PersonState {
  final List<Person> persons;
  const PersonSuccess(this.persons);
  @override
  List<Object> get props => [persons];
}

final class PersonError extends PersonState {
  final String message;
  const PersonError(this.message);
  @override
  List<Object> get props => [message];
}
