part of 'all_message_cubit.dart';

@immutable
abstract class AllMessageState {}

class AllMessageInitial extends AllMessageState {}

class GetMessagesLoading extends AllMessageState {}

class GetMessagesSuccess extends AllMessageState {}

class SearhMessagesSuccess extends AllMessageState {}

class StartTimerMessagesSuccess extends AllMessageState {}

class EndTimerMessagesSuccess extends AllMessageState {}
