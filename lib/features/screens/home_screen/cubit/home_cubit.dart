import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';
import 'package:news_app/features/data/repo/home_repo.dart';
import 'package:news_app/features/screens/home_screen/cubit/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(InitialState());
  
  getTopHeadline()  async{
    emit(LoadingState());
    
    try {
      final ArticlesModel topHeadLineModel = await  HomeRepo.getTopHeadline() as ArticlesModel;
      emit(SucessState(topHeadLineModel: topHeadLineModel));
    } catch(e) {
      emit(ErrorState(error: e.toString()));
    }
  }

}