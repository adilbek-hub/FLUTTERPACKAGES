part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  final Widget child;
  const PostLoading({required this.child});
}

final class PostLoaded extends PostState {
  final List<PlaceholderModel>? placeholderModel;

  const PostLoaded({required this.placeholderModel});
}

final class PostError extends PostState {
  final String errorMessage;
  const PostError({required this.errorMessage});
}
