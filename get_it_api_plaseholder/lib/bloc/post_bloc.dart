import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_api_plaseholder/api_service.dart';
import 'package:get_it_api_plaseholder/model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService apiService = GetIt.I<ApiService>();
  PostBloc() : super(PostInitial()) {
    on<PostFetched>(
      (event, emit) async {
        emit(const PostLoading(child: CircularProgressIndicator.adaptive()));
        final data = await apiService.fetchData();
        emit(PostLoaded(placeholderModel: data));
      },
    );
  }
}
