import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_media/bloc/home_event.dart';
import 'package:multi_media/bloc/home_state.dart';
import 'package:multi_media/data/content.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeInit>(
      (event, emit) async {
        emit(HomeLoading());
        var response = await getContents();
        emit(HomeDataFeteched(response));
      },
    );
  }

  Future<List<Content>> getContents() async {
    var dio = Dio();

    var response =
        await dio.get('http://pb.7learn.com/api/collections/Content/records');
    List<Content> contentList = response.data['items']
        .map<Content>((jsonObject) => Content.fromJson(jsonObject))
        .toList();

    return contentList;
  }
}
