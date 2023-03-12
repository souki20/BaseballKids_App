import 'package:baseballboy_ver2/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewerPage extends ConsumerWidget {
  const ViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final inning = ref.watch(Inning);
    bool front = (inning % 2) == 0 ? true : false;

    final count_ball_opacity_list = ref.watch(CountBallOpacityList.state).state;
    final count_strike_opacity_list = ref.watch(CountStrikeOpacityList.state).state;
    final count_out_opacity_list = ref.watch(CountOutOpacityList.state).state;
    final game_name = ref.watch(gameName.state).state;

    //  現在のインイング数の計算
    nowInningAndTopBottom() {
      final inning = ref.watch(Inning.notifier).state;
      int number = (inning ~/ 2) + 1;

      if (front) {
        return ('${number}回表');
      } else {
        return ('${number}回裏');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 10),
          alignment: Alignment.center,
          color: const Color(0xff000080).withOpacity(1),
          child: Column(
            children: [
              Container(
                // color: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                        style: ElevatedButton.styleFrom(
                          // fixedSize: Size(100, 100),
                          padding: EdgeInsets.zero,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '戻る',
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // スコアボード
              Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  // 0:FlexColumnWidth(),
                  // 0: IntrinsicColumnWidth(),
                  // 1: FlexColumnWidth(),
                  // 0: FixedColumnWidth(50),
                  0: FlexColumnWidth(3),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      decoration: const BoxDecoration(color: Colors.white),
                      children: [
                        Text(
                          '学校名',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '1',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '2',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '3',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '4',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '5',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '6',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '7',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '8',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '9',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '計',
                          textAlign: TextAlign.center,
                        ),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(color: Colors.white),
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                            child: SizedBox(
                              height: 30,
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                                    builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data!['team_name'].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }
                                ),
                              ),
                            ),
                          )
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][0],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][1],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][2],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][3],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][4],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][5],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][6],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][7],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][8],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(0),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(2),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(4),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(6),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(8),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(10),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(12),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(14),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // Text(
                        //   ref.watch(AllScore).elementAt(16),
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['total_score'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        // Text(
                        //   '${ref.watch(TeamATotallScore.notifier).state}',
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(color: Colors.white),
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                            child: SizedBox(
                              height: 30,
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                                    builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data!['team_name'].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }
                                ),
                              ),
                            ),
                          )
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][0],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][1],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][2],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][3],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][4],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][5],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][6],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][7],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['score'][8],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                        // Text(
                        //   '${ref.watch(TeamBTotallScore.notifier).state}',
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //   ),
                        // ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!['total_score'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                        ),
                      ]),
                ],
              ),
              // 打者と投手
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Column(
                    children: [
                      //メインボード
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  // width: 170,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.grey,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                      child: StreamBuilder<DocumentSnapshot>(
                                          stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
                                          builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                snapshot.data!['team_name'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              );
                                            } else {
                                              return Container();
                                            }
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: 50,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          // ref.watch(FrontMemberPositionList.state).state[(inning ~/ 2) + 1],
                                          (front) ? "打者" : "投手",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        // child: Text(
                                        //   ref.watch(FrontMemberNameList.state).state[now_batter_front],
                                        //   // nowPlayerName('left'),
                                        //   textAlign: TextAlign.center,
                                        // ),
                                        child: (() {
                                          // return Text('test');
                                          int FrontPitcher = ref.watch(FrontMemberPositionList.state).state.indexOf('投');
                                          // (FrontPitcher == -1) ? FrontPitcher = 1 : FrontPitcher,
                                          if(FrontPitcher == -1) {
                                            FrontPitcher = 1;
                                          }
                                          var _now_batter_front = ref.watch(NowBatterFront.state).state;
                                          if (front) {
                                            return FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                                child: Text(
                                                  ref.watch(FrontMemberNameList.state).state[_now_batter_front],
                                                ),
                                              ),
                                            );
                                          } else {
                                            // print('left,back');
                                            // return ref.watch(FrontMemberNameList.state).state[FrontPitcher];
                                            return FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                ref.watch(FrontMemberNameList.state).state[FrontPitcher],
                                              ),
                                            );
                                          }
                                        })(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 70,
                              height: 65,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                    child: StreamBuilder<DocumentSnapshot>(
                                        stream: FirebaseFirestore.instance.collection(game_name).doc('board').snapshots(),
                                        builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              snapshot.data!['inning'],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  // width: 170,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.grey,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                      child: StreamBuilder<DocumentSnapshot>(
                                          stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                                          builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                snapshot.data!['team_name'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              );
                                            } else {
                                              return Container();
                                            }
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        // child: Text(
                                        //   ref.watch(BackMemberNameList.state).state[(inning ~/ 2) + 1],
                                        //   // nowPlayerName('right'),
                                        //   textAlign: TextAlign.center,
                                        // ),
                                        // child: (() {
                                        //   int BackPitcher = ref.watch(BackMemberPositionList.state).state.indexOf('投');
                                        //   var _now_batter_back = ref.read(NowBatterBack.state).state;
                                        //   // print(BackPitcher);
                                        //   if (BackPitcher == -1) {
                                        //     BackPitcher = 1;
                                        //   }
                                        //   if (front) {
                                        //     // print('right,front');
                                        //     // return ref.watch(BackMemberNameList.state).state[BackPitcher];
                                        //     return FittedBox(
                                        //       fit: BoxFit.fitWidth,
                                        //       child: Text(
                                        //         ref.watch(BackMemberNameList.state).state[BackPitcher],
                                        //         // 'test'
                                        //       ),
                                        //     );
                                        //   } else {
                                        //     // print('right,back');
                                        //     // return ref.watch(BackMemberNameList.state).state[_now_batter_back];
                                        //     return FittedBox(
                                        //       fit: BoxFit.fitWidth,
                                        //       child: Text(
                                        //         ref.watch(BackMemberNameList.state).state[_now_batter_back],
                                        //         // 'test'
                                        //       ),
                                        //     );
                                        //   }
                                        // }()),
                                        child: StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance.collection(game_name).doc('TeamB').snapshots(),
                                            builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(
                                                  snapshot.data!['display_member'],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            }
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: 50,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          // ref.watch(BackMemberPositionList.state).state[(inning ~/ 2) + 1],
                                          (!front) ? "打者" : "投手",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // 図形
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 150,
                                height: 49,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      child: const Text(
                                        'B',
                                        style: TextStyle(
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: count_ball_opacity_list.length,
                                        itemBuilder: (context, index) {
                                          return Opacity(
                                            opacity: ref.watch(CountBallOpacityList.state).state[index],
                                            child: Container(
                                              width: 38,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black),
                                                color: Colors.green,
                                                shape:BoxShape.circle,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 49,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      child: const Text(
                                        'S',
                                        style: TextStyle(
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: count_strike_opacity_list.length,
                                        itemBuilder: (context, index) {
                                          return Opacity(
                                            opacity: ref.watch(CountStrikeOpacityList.state).state[index],
                                            child: Container(
                                              width: 38,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black),
                                                color: Colors.yellow,
                                                shape:BoxShape.circle,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 49,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      child: const Text(
                                        'O',
                                        style: TextStyle(
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: count_out_opacity_list.length,
                                        itemBuilder: (context, index) {
                                          return Opacity(
                                            opacity: ref.watch(CountOutOpacityList.state).state[index],
                                            child: Container(
                                              width: 38,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black),
                                                color: Colors.red,
                                                shape:BoxShape.circle,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/baseball_ground_illustration.jpeg',
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Opacity(
                                      opacity: ref.read(RunnerOpacityList.state).state[0],
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Opacity(
                                      opacity: ref.read(RunnerOpacityList.state).state[1],
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Opacity(
                                      opacity: ref.read(RunnerOpacityList.state).state[2],
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // メンバー
              Row(
                children: [
                  // 先発メンバー
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 50.0, right: 0, bottom: 0),
                        child: Container(
                          // width: 300,
                          // height: 500,
                          child: ListView.builder(
                            // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(top: 0),
                              itemCount: 9,
                              itemBuilder: (context, index) {
                                return Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //打順
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text("${index+1}")),
                                      ),
                                    ),
                                    //名前
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text(ref.read(FrontMemberNameList.state).state[index+1])),
                                      ),
                                    ),
                                    //ポジション
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text(ref.watch(FrontMemberPositionList.state).state[index+1])),
                                      ),
                                    )
                                  ],
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                  ),
                  // コメント
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                          height: 315,
                          color: Colors.grey,
                          child: SingleChildScrollView(
                            child: Text(
                              ref.watch(Comment.state).state,
                            ),
                          )
                      ),
                    ),
                  ),
                  // 後攻メンバー
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 50.0, right: 0, bottom: 0),
                        child: Container(
                          // width: 300,
                          // height: 500,
                          child: ListView.builder(
                            // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(top: 0),
                              itemCount: 9,
                              itemBuilder: (context, index) {
                                return Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //打順
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text("${index+1}")),
                                      ),
                                    ),
                                    //名前
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text(ref.read(BackMemberNameList.state).state[index+1])),
                                      ),
                                    ),
                                    //ポジション
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text(ref.watch(BackMemberPositionList.state).state[index+1])),
                                      ),
                                    )
                                  ],
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
