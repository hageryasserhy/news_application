abstract class NewstecState {}

class NewstecInitial extends NewstecState {}
class GetNewsSuccessState extends NewstecState {}
class GetAllNewsLoadingState extends NewstecState {}
class GetNewsErrorState extends NewstecState {
  final String error;
  GetNewsErrorState({required this.error});
}

