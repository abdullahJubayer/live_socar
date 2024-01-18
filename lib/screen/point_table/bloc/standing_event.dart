import 'package:equatable/equatable.dart';

sealed class StandingEvent extends Equatable {
  const StandingEvent();

  @override
  List<Object?> get props => [];
}


class PointTableEvent extends StandingEvent {
  const PointTableEvent({required this.leagueId});
  final int leagueId;
}