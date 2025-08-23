class LiveScoreModel {
  final String id;
  final String team1Name;
  final String team2Name;
  final int team1Score;
  final int team2Score;
  final double time;
  final int totalTime;

  LiveScoreModel({
    required this.id,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.time,
    required this.totalTime,
  });
}
