import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';
import 'package:news_app/features/data/repo/search_result_repo.dart';
import 'package:news_app/features/screens/search_result_screen/cubit/search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(): super(InitialState());
  
  getSearchItemByName(String query) async{
    emit(LoadingState());

    try {
      ArticlesModel searchModel = await SearchResultRepo.searchItemByName(query) as ArticlesModel;
      emit(SucessState(searchModel: searchModel));
    } catch(e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}