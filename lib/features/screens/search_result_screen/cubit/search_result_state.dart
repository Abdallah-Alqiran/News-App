import 'package:news_app/features/data/model/dio_helper_model.dart';

abstract class SearchResultState {}

class InitialState extends SearchResultState{}
class LoadingState extends SearchResultState{}

class SucessState extends SearchResultState{
  final ArticlesModel searchModel;
  SucessState({required this.searchModel});
}

class ErrorState extends SearchResultState{
  final String error;
  ErrorState({required this.error});
}