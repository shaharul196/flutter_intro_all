import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_on_firebase/data/liveScoreModel.dart';

class ItalyVSSpainScreen extends StatefulWidget {
  const ItalyVSSpainScreen({super.key});

  @override
  State<ItalyVSSpainScreen> createState() => _ItalyVSSpainScreenState();
}

class _ItalyVSSpainScreenState extends State<ItalyVSSpainScreen> {
  List<LiveScoreModel> _listOfScore = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> _getLiveScoreData() async {
    _listOfScore.clear();
    final QuerySnapshot<Map<String, dynamic>> snapshots =
        await db
            .collection('Football')
            .where('team1_name', isEqualTo: 'Italy')
            .where('team2_name', isEqualTo: 'Spain')
            .get();
    // TODO doc is document
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshots.docs) {
      LiveScoreModel liveScore = LiveScoreModel(
        id: doc.id,
        team1Name: doc.get('team1_name'),
        team2Name: doc.get('team2_name'),
        team1Score: doc.get('team1_score'),
        team2Score: doc.get('team2_score'),
        time: doc.get('time'),
        totalTime: doc.get('total_time'),
      );
      _listOfScore.add(liveScore);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getLiveScoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ita vs Spn'), backgroundColor: Colors.blue),

      body: StreamBuilder(
        stream:
            db
                .collection('Football')
                .where('team1_name', isEqualTo: 'Italy')
                .where('team2_name', isEqualTo: 'Spain')
                .snapshots(),
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
              LiveScoreModel liveScore = LiveScoreModel(
                id: doc.id,
                team1Name: doc.get('team1_name'),
                team2Name: doc.get('team2_name'),
                team1Score: doc.get('team1_score'),
                team2Score: doc.get('team2_score'),
                time: doc.get('time'),
                totalTime: doc.get('total_time'),
              );
              _listOfScore.add(liveScore);
            }
          }
          return ListView.builder(
            itemCount: _listOfScore.length,
            itemBuilder: (context, index) {
              LiveScoreModel liveScore = _listOfScore[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    // height: 110,
                    color: Colors.white,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              liveScore.team1Name,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              ' vs ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              liveScore.team2Name,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${liveScore.team1Score} : ${liveScore.team2Score}',
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Time : ${liveScore.time}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Time : ${liveScore.totalTime}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }


}
