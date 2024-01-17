import 'package:equatable/equatable.dart';
import '../data/model/fixtures_request.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}


class FixtureEvent extends DashboardEvent {
  const FixtureEvent({required this.request});
  final FixturesRequest request;
}