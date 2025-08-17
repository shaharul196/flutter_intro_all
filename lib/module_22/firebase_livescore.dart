import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenFirebase extends StatefulWidget {
  const HomeScreenFirebase({super.key});

  @override
  State<HomeScreenFirebase> createState() => _HomeScreenFirebaseState();
}

class _HomeScreenFirebaseState extends State<HomeScreenFirebase> {
  // TODO get field ney and data query ney
  List<LiveScore> _listOfScore = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // TODO only 1bar get kora
  Future<void> _getLiveScoreData() async {
    _listOfScore.clear();
    final QuerySnapshot<Map<String, dynamic>> snapshots =
        await db.collection('football').get();
    // TODO doc is document
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshots.docs) {
      LiveScore liveScore = LiveScore(
        id: doc.id,
        team1Name: doc.get('team1_name'),
        team2Name: doc.get('team2_name'),
        team1Score: doc.get('team1_score'),
        team2Score: doc.get('team2_score'),
        isRunning: doc.get('is_running'),
        winnerTeam: doc.get('winner_team'),
      );
      _listOfScore.add(liveScore);
    }
    setState(() {});
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getLiveScoreData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LiveScore App')),
      // TODO streamBuilder(line 47-75) firebase data update kora
      body: StreamBuilder(
        stream: db.collection('football').snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots,
        ) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshots.hasError) {
            return Center(child: Text(snapshots.error.toString()));
          }

          if (snapshots.hasData) {
            _listOfScore.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
                in snapshots.data!.docs) {
              LiveScore liveScore = LiveScore(
                id: doc.id,
                team1Name: doc.get('team1_name'),
                team2Name: doc.get('team2_name'),
                team1Score: doc.get('team1_score'),
                team2Score: doc.get('team2_score'),
                isRunning: doc.get('is_running'),
                winnerTeam: doc.get('winner_team'),
              );
              _listOfScore.add(liveScore);
            }
          }

          return ListView.builder(
            itemCount: _listOfScore.length,
            itemBuilder: (context, index) {
              LiveScore liveScore = _listOfScore[index];
              return ListTile(
                onLongPress: () {
                  // TODO delete kora
                  db.collection('football').doc(liveScore.id).delete();
                },
                leading: CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      liveScore.isRunning ? Colors.green : Colors.grey,
                ),
                title: Text(liveScore.id),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // spacing: 16,
                      children: [
                        Text(liveScore.team1Name),
                        Text('  vs  '),
                        Text(liveScore.team2Name),
                      ],
                    ),
                    Text('Is Running: ${liveScore.isRunning}'),
                    Text('Winner Team: ${liveScore.winnerTeam}'),
                  ],
                ),
                trailing: Text(
                  '${liveScore.team1Score} : ${liveScore.team2Score}',
                  style: TextStyle(fontSize: 24),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          LiveScore liveScore = LiveScore(
            id: 'argvsgermany',
            team1Name: 'Argentina',
            team2Name: 'Germany',
            team1Score: 1,
            team2Score: 4,
            isRunning: true,
            winnerTeam: '',
          );
          await db
              .collection('football')
              .doc(liveScore.id)
              // TODO set is data kora
              .set(liveScore.toMap());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class LiveScore {
  final String id;
  final String team1Name;
  final String team2Name;
  final int team1Score;
  final int team2Score;
  final bool isRunning;
  final String winnerTeam;

  LiveScore({
    required this.id,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.isRunning,
    required this.winnerTeam,
  });

  // TODO data add kora jonno
  Map<String, dynamic> toMap() {
    return {
      'team1_name': team1Name,
      'team2_name': team2Name,
      'team1_score': team1Score,
      'team2_score': team2Score,
      'is_running': isRunning,
      'winner_team': winnerTeam,
    };
  }
}
