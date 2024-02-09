abstract class NewsGeneralState {}

class NewsGeneralInitial extends NewsGeneralState {}
class GetNewsSuccessState extends NewsGeneralState {}
class GetAllNewsLoadingState extends NewsGeneralState {}
class GetNewsErrorState extends NewsGeneralState {
  final String error;
  GetNewsErrorState({required this.error});
}

