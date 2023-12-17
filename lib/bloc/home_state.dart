import 'package:multi_media/data/content.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeDataFeteched extends HomeState {
  List<Content> contentList;
  HomeDataFeteched(this.contentList);
}
