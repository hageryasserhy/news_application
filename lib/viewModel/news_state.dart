abstract class NewsState {}

class NewsInitial extends NewsState {}
class GetNewsSuccessState extends NewsState {}
class GetAllNewsLoadingState extends NewsState {}
class GetNewsErrorState extends NewsState {
   final String error;
   GetNewsErrorState({required this.error});
}

