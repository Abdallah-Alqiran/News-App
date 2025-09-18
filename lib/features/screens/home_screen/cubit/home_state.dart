import 'package:news_app/features/data/model/dio_helper_model.dart';

abstract class HomeState {

}

class InitialState extends HomeState{}
class LoadingState extends HomeState{}

class SucessState extends HomeState{
  final ArticlesModel topHeadLineModel;
  SucessState({required this.topHeadLineModel});
}

class ErrorState extends HomeState{
  final String error;
  ErrorState({required this.error});
}