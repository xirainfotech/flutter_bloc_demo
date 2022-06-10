import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/models/customer_model.dart';
import 'package:flutter_bloc_demo/repository/api_repository.dart';
part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit({required this.repository}) : super(const ApiState());
  final ApiRepository repository;

  Future<void> getData() async {
    try {
      final data = await repository.fetchData();
      //tv.addAll(tvShows);
      emit(state.copyWith(status: ApiStatus.success, apiList: data));
    } on Exception catch (e) {
      emit(state.copyWith(status: ApiStatus.failure, exception: e));
    }
  }
}
