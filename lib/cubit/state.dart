abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsInitial extends NewsStates {}
class NewsBottomNav extends NewsStates {}
class NewsGetBusinessLoading extends NewsStates {}
class NewsGetBusinessSuccess extends NewsStates {}
class NewsGetBusinessError extends NewsStates {
  final String error;
  NewsGetBusinessError(this.error);
}
class NewsGetSportsLoading extends NewsStates {}
class NewsGetSportsSuccess extends NewsStates {}
class NewsGetSportsError extends NewsStates {
  final String error;
  NewsGetSportsError(this.error);
} 
class NewsGetSciencesLoading extends NewsStates {}
class NewsGetSciencesSuccess extends NewsStates {}
class NewsGetSciencesError extends NewsStates {
  final String error;
  NewsGetSciencesError(this.error);
}
class NewsGetSearchLoading extends NewsStates {}
class NewsGetSearchSuccess extends NewsStates {}
class NewsGetSearchError extends NewsStates {
  final String error;
  NewsGetSearchError(this.error);
}