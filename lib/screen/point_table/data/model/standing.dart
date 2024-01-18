import 'package:freezed_annotation/freezed_annotation.dart';
part 'standing.freezed.dart';
part 'standing.g.dart';

@freezed
class StandingResponse with _$StandingResponse {
  const factory StandingResponse({
    @JsonKey(name: "team_name") String? teamName,
    @JsonKey(name: "overall_league_position") String? leaguePosition,
    @JsonKey(name: "overall_league_payed") String? leaguePayed,
    @JsonKey(name: "overall_league_W") String? gameWin,
    @JsonKey(name: "overall_league_D") String? gameDraw,
    @JsonKey(name: "overall_league_L") String? gameLoss,
    @JsonKey(name: "overall_league_PTS") String? gamePoint,
  }) = _StandingResponse;

  factory StandingResponse.fromJson(Map<String, dynamic> json) => _$StandingResponseFromJson(json);
}

// {
// "country_name": "England",
// "league_id": "152",
// "league_name": "Premier League",
// "team_id": "84",
// "team_name": "Liverpool",
// "overall_promotion": "Promotion - Champions League (Group Stage: )",
// "overall_league_position": "1",
// "overall_league_payed": "20",
// "overall_league_W": "13",
// "overall_league_D": "6",
// "overall_league_L": "1",
// "overall_league_GF": "43",
// "overall_league_GA": "18",
// "overall_league_PTS": "45",
// "home_league_position": "2",
// "home_promotion": "",
// "home_league_payed": "10",
// "home_league_W": "8",
// "home_league_D": "2",
// "home_league_L": "0",
// "home_league_GF": "26",
// "home_league_GA": "8",
// "home_league_PTS": "26",
// "away_league_position": "2",
// "away_promotion": "",
// "away_league_payed": "10",
// "away_league_W": "5",
// "away_league_D": "4",
// "away_league_L": "1",
// "away_league_GF": "17",
// "away_league_GA": "10",
// "away_league_PTS": "19",
// "league_round": "",
// "team_badge": "https://apiv3.apifootball.com/badges/84_liverpool.jpg",
// "fk_stage_key": "6",
// "stage_name": "Current"
// }