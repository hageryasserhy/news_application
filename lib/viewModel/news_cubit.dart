import 'package:bloc/bloc.dart';
import 'package:flutter_assginment_6_1/model/articalModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'news_state.dart';


class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=>BlocProvider.of(context);

  List<ArticalModel>? articalModel;
 Future getAllNews() async{
   emit(GetAllNewsLoadingState());
     final dio = Dio(
       BaseOptions(
         baseUrl: 'https://newsapi.org/v2/'
       )
     );
     final response = await dio.get('top-headlines',
     queryParameters:{
           'category':'health',
           'apiKey':'8c0b344dc7604fdd90d329632e5c8442',
            'language':'en',
         }
     );
     if(response.statusCode==200)
     {
       articalModel=List<ArticalModel>.from((response.data['articles'] as List).map((e) => ArticalModel.fromjason(e)));
     //     // print(response.data);
     //   List list= response.data['articles'] as List;
     //   list.forEach((element)
     //   {
     //     articalModel?.add(ArticalModel.fromjason(element));
     //   });
       print("list: ${articalModel}");
       emit(GetNewsSuccessState());
     }
     else
       {
         emit(GetNewsErrorState(error: ''));
       }
 }
}

