import 'package:freezed_annotation/freezed_annotation.dart';
import 'goal_scorer.dart';
import 'package:intl/intl.dart';
part 'fixtures_response.freezed.dart';
part 'fixtures_response.g.dart';

@freezed
class FixturesResponse with _$FixturesResponse {
  const FixturesResponse._();
  const factory FixturesResponse({
    @JsonKey(name: "matchId") String? matchId,
    @JsonKey(name: "countryId") String? countryId,
    @JsonKey(name: "countryName") String? countryName,
    @JsonKey(name: "leagueId") String? leagueId,
    @JsonKey(name: "leagueName") String? leagueName,
    @JsonKey(name: "match_date") String? matchDate,
    @JsonKey(name: "match_time") String? matchTime,
    @Default([])
    @JsonKey(name: "goalscorer") List<Goalscorer> goalscorer,
    @JsonKey(name: "team_home_badge") String? teamHomeBadge,
    @JsonKey(name: "team_away_badge") String? teamAwayBadge
  }) = _FixturesResponse;


  factory FixturesResponse.fromJson(Map<String, dynamic> json) => _$FixturesResponseFromJson(json);

  String? get formatDate {
    var formate = DateFormat('yyyy-MM-dd');
    var formate2 = DateFormat('MMM - dd');
    return formate2.format(formate.parse(matchDate??''));
  }
}
