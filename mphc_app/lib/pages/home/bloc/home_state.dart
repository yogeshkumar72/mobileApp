part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{}

class HomeErrorState extends HomeState{
}

class HomeNavigateState extends HomeActionState{}




