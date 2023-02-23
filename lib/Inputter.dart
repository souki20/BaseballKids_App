// import 'package:baseball_score_board/main.dart';
import 'package:baseballboy_ver2/main.dart';
import 'package:baseballboy_ver2/ChangeMember.dart';
import 'package:baseballboy_ver2/set_member.dart';
import 'package:baseballboy_ver2/Questionnaire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './ButtonWidget.dart';


class InputterConfirm extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('野球小僧'),
        title: Image.asset(
          'images/yakyukozo_logo.png',
          height: 50,
        ),
        // title: Center(
        //   child: Image.asset(
        //     'images/yakyukozo_logo.png',
        //     height: 50,
        //   ),
        // ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: const Color(0xff000080).withOpacity(1),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'パスワードを入力してください',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30 ,left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onChanged: (value) {
                    // ref.read()
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputterQuestionnaier()),
                      // MaterialPageRoute(builder: (context) => Home()),
                      // MaterialPageRoute(builder: (context) => InputterPage()),
                    );
                  },
                  child: const Text('送信する'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class InputterPage extends ConsumerWidget {
  const InputterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final inning = ref.watch(Inning);
    bool front = (inning % 2) == 0 ? true : false;
    // final all_Score = ref.watch(AllScore);
    // final now_Score = ref.watch(NowScore);

    final all_score_list = ref.watch(AllScore.notifier).state;
    final teamA = ref.watch(TeamA.notifier).state;
    final teamB = ref.watch(TeamB.notifier).state;

    // final valueController = TextEditingController();
    List<TextEditingController> teamNameController = List.generate(2, (i) => TextEditingController());

    final now_batter_front =ref.read(NowBatterFront.state).state;
    final now_batter_back =ref.read(NowBatterBack.state).state;

    final count_ball_opacity_list = ref.watch(CountBallOpacityList.state).state;
    final count_strike_opacity_list = ref.watch(CountStrikeOpacityList.state).state;
    final count_out_opacity_list = ref.watch(CountOutOpacityList.state).state;

    var comment = ref.watch(Comment.state).state;

    final TextEditingController _controller = TextEditingController(text: comment);
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );

    nowInningAndTopBottom() {
      final inning = ref.watch(Inning.notifier).state;
      int number = (inning ~/ 2) + 1;

      if (front) {
        return ('${number}回表');
      } else {
        return ('${number}回裏');
      }
    }

    //次の打者設定
    nextBatter() {
      var inning = ref.watch(Inning);
      var front = (inning % 2) == 0 ? true : false;

      if(front) {
        var _now_batter_front = ref.watch(NowBatterFront.state).state;
        if(_now_batter_front == 9) {
          ref.read(NowBatterFront.state).state = 1;
        } else {
          ref.read(NowBatterFront.state).state ++;
        }

        var _front_member_name_list = ref.watch(FrontMemberNameList.state).state;
        _now_batter_front = ref.watch(NowBatterFront.state).state;
        return '$_now_batter_front ${_front_member_name_list[_now_batter_front]}';
      } else {
        var _now_batter_back = ref.watch(NowBatterBack.state).state;
        if(_now_batter_back == 9) {
          ref.watch(NowBatterBack.state).state = 1;
        } else {
          ref.watch(NowBatterBack.state).state ++;
        }

        var _back_member_name_list = ref.watch(BackMemberNameList.state).state;
        _now_batter_back = ref.watch(NowBatterBack.state).state;
        return '$_now_batter_back ${_back_member_name_list[_now_batter_back]}';
      }
    }

    // runnerCount() {
    //   var _runner = ref.read(Runner.state).state;
    //   var _runner_count_list = [];
    //   _runner.forEach((key,value) {
    //     if(value) {
    //       _runner_count_list.add(key);
    //     }
    //   });
    //   return _runner_count_list;
    // }

    countAndRunnerCheck(comment) {
      var _ball_count = ref.read(Count.state).state['B'];
      var _strike_count = ref.read(Count.state).state['S'];
      var _out_count = ref.read(Count.state).state['O'];

      var _runner = ref.read(Runner.state).state;
      var _runner_count_list = [];
      _runner.forEach((key,value) {
        if(value) {
          _runner_count_list.add(key);
        }
      });
      // var _runner_count_list = runnerCount();

      var _runner_count = '';
      if(_runner_count_list.length == 0) {
        _runner_count = '無し';
      } else if (_runner_count_list.length == 3) {
        _runner_count = '満塁';
      } else {
        for (var value in _runner_count_list) {
          _runner_count += value;
        }
      }

      if(_out_count == 0) {
        var result = "$_ball_count-$_strike_countから$comment ノーアウト ランナー$_runner_count";
        return result;
      } else {
        var result = "$_ball_count-$_strike_countから$comment $_out_countアウト ランナー$_runner_count";
        return result;
      }
    }

    var comment_button_widget = new commentButtonWidget();

    final game_name = ref.watch(gameName.state).state;

    //打者と投手を表示
    // nowPlayerName(left_or_right) {
    //   if (left_or_right == 'left') {
    //     final FrontPitcher = ref.watch(FrontMemberPositionList.state).state.indexOf('投');
    //     var _now_batter_front = ref.watch(NowBatterFront.state).state;
    //       if (front) {
    //         // return print('left,front');
    //         String result = ref.watch(FrontMemberNameList.state).state[_now_batter_front];
    //         return result;
    //         // print(ref.watch(FrontMemberNameList.state).state[_now_batter_front]);
    //         // ref.watch(FrontMemberNameList.state).state[_now_batter_front];
    //       } else {
    //         // print('left,back');
    //         return ref.watch(FrontMemberNameList.state).state[FrontPitcher];
    //       }
    //     } else {
    //       final BackPitcher = ref.watch(BackMemberPositionList.state).state.indexOf('投');
    //       var _now_batter_back = ref.read(NowBatterBack.state).state;
    //       if (front) {
    //         // print('right,front');
    //         return ref.watch(BackMemberNameList.state).state[BackPitcher];
    //       } else {
    //         // print('right,back');
    //         return ref.watch(BackMemberNameList.state).state[_now_batter_back];
    //       }
    //     }
    // }

    // nowPlayerName('left');
    // print(ref.watch(FrontMemberNameList.state).state[1]);
    // print(ref.watch(NowBatterFront.state).state);
    // print(ref.watch(FrontMemberNameList.state).state[_now_batter_front].runtime Type);
    // final a =ref.watch(FrontMemberNameList.state).state[1];
    // print(a.runtimeType);

    // print(ref.read(ButtonVisibleList.state).state['default']);

    // var button_visible_list = ref.read(ButtonVisibleList.state).state;
    // print(button_visible_list);
    // print(button_visible_list['default']);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // backgroundColor: Color(0xff1d2858),
        // backgroundColor: Color(0xff000080).withOpacity(1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
            alignment: Alignment.center,
            color: Color(0xff000080).withOpacity(1),
            child: Column(
              children: [
                //ボタン
                // Padding(
                //   padding: EdgeInsets.only(top: 30),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context, 'OK');
                //     },
                //     style: ElevatedButton.styleFrom(
                //       padding: EdgeInsets.zero,
                //     ),
                //     child: const FittedBox(
                //       fit: BoxFit.fitWidth,
                //       child: Text(
                //         '前のページに戻る',
                //         style: TextStyle(
                //             fontSize: 15
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  // color: Colors.white,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context, 'OK');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('値をリセット'),
                                    content: SizedBox(
                                      height: 150,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            const Text(
                                              '本当に値をリセットさせますか？',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                                    child: const Text('いいえ'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                                                        'attack_or_defense' : '打者',
                                                        'display_member' : '',
                                                        'member_arm' : List.filled(26, ''),
                                                        'member_name' : List.filled(26, ''),
                                                        'member_position' : List.filled(26, ''),
                                                        'score' : List.filled(9, ''),
                                                        'team_name' : 'チームA',
                                                        'total_score' : 0,
                                                      });
                                                      FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                                                        'attack_or_defense' : '投手',
                                                        'display_member' : '',
                                                        'member_arm' : List.filled(26, ''),
                                                        'member_name' : List.filled(26, ''),
                                                        'member_position' : List.filled(26, ''),
                                                        'score' : List.filled(9, ''),
                                                        'team_name' : 'チームB',
                                                        'total_score' : 0,
                                                      });
                                                      FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                                        'count_ball' : [0.3, 0.3, 0.3],
                                                        'count_out' : [0.3, 0.3],
                                                        'count_strike' : [0.3, 0.3],
                                                        'inning' : '1回表',
                                                        'runner' : [0.3, 0.3, 0.3],
                                                      });
                                                      FirebaseFirestore.instance.collection(game_name).doc('comment').update({
                                                        'content' : '',
                                                      });

                                                      ref.refresh(Inning);
                                                      ref.refresh(Front);
                                                      ref.refresh(AllScore);
                                                      ref.refresh(TeamA);
                                                      ref.refresh(TeamATotallScore);
                                                      ref.refresh(TeamB);
                                                      ref.refresh(TeamBTotallScore);
                                                      ref.refresh(NowScore);
                                                      ref.refresh(TeamNameA);
                                                      ref.refresh(TeamNameB);
                                                      ref.refresh(NowBatterFront);
                                                      ref.refresh(NowBatterBack);
                                                      ref.refresh(PitcherFront);
                                                      ref.refresh(ToggleList);
                                                      ref.refresh(ChangeOpacity);
                                                      ref.refresh(OpacityList);
                                                      ref.refresh(OpacityListArms);
                                                      ref.refresh(FrontMemberList);
                                                      ref.refresh(FrontMemberNameList);
                                                      ref.refresh(FrontMemberPositionList);
                                                      ref.refresh(FrontMemberArmList);
                                                      ref.refresh(BackMemberList);
                                                      ref.refresh(BackMemberNameList);
                                                      ref.refresh(BackMemberPositionList);
                                                      ref.refresh(BackMemberArmList);
                                                      ref.refresh(CountBallOpacityList);
                                                      ref.refresh(CountStrikeOpacityList);
                                                      ref.refresh(CountOutOpacityList);
                                                      ref.refresh(Count);
                                                      ref.refresh(RunnerOpacityList);
                                                      ref.refresh(Runner);
                                                      ref.refresh(ButtonVisibleList);
                                                      ref.refresh(ButtonVisibleThrowingBallList);
                                                      ref.refresh(ChangeMemberBroderCheck);
                                                      ref.refresh(ChangeMemberBorderTrue);
                                                      ref.refresh(ChangeMemberBorderFalse);
                                                      ref.refresh(Comment);
                                                      ref.refresh(BeforePushedButton);
                                                      ref.refresh(selectedValueMatchFormat);
                                                      ref.refresh(selectedValueCategory);
                                                      ref.refresh(selectedValueMatchPlace);
                                                      ref.refresh(selectedValueSex);
                                                      ref.refresh(selectedValueAge);
                                                      ref.refresh(selectedValueParticipants);
                                                      // ref.refresh(gameName);
                                                      // ref.refresh(url);
                                                      // ref.refresh(userRole);


                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.red,
                                                    ),
                                                    child: const Text(
                                                      'はい',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            'リセット',
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '前のページに戻る',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context, 'OK');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('試合終了'),
                                    content: SizedBox(
                                      height: 150,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            const Text(
                                              '本当に試合を終了させますか？',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                                    child: const Text('いいえ'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context, 'OK');
                                                      var _new_score_list = [];
                                                      var _new_score_list_team_a = [];
                                                      var _new_score_list_team_b = [];
                                                      var index = 0;
                                                      for (var value in ref.watch(AllScore.state).state) {
                                                        if (value == '　') {
                                                          value = 'X';
                                                        }
                                                        if((index%2)==0) {
                                                          _new_score_list_team_a.add(value);
                                                        } else {
                                                          _new_score_list_team_b.add(value);
                                                        }
                                                        _new_score_list.add(value);
                                                        index++;
                                                      }

                                                      ref.watch(AllScore.state).state = [..._new_score_list];
                                                      ref.read(Comment.state).state = ref.watch(Comment.state).state + '\n' + 'ゲームセット';

                                                      FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                                                        'score' : _new_score_list_team_a
                                                      });
                                                      FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                                                        'score' : _new_score_list_team_b
                                                      });
                                                      FirebaseFirestore.instance.collection(game_name).doc('comment').update({
                                                        'content' : ref.watch(Comment)
                                                      });

                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.red
                                                    ),
                                                    child: const Text('はい'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            '試合終了',
                            style: TextStyle(
                                fontSize: 15
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
                    0: FlexColumnWidth(3),
                    // 2: FixedColumnWidth(64),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    const TableRow(
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
                        ]
                    ),
                    TableRow(
                        decoration: const BoxDecoration(color: Colors.white),
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            // child: Text(
                            //   ref.read(TeamNameA.notifier).state,
                            //   textAlign: TextAlign.center,
                            //   // style: TextStyle(
                            //   //   fontSize: 10
                            //   // ),
                            // ),
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
                                            fontSize: 10
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                        ]
                    ),
                    TableRow(
                        decoration: const BoxDecoration(color: Colors.white),
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            // child: Text(
                            //   ref.read(TeamNameB.notifier).state,
                            //   textAlign: TextAlign.center,
                            // ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 1, minHeight: 1),
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
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ScoreDialog();
                                  }
                              );
                            },
                            child: StreamBuilder<DocumentSnapshot>(
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
                          ),
                        ]
                    ),
                  ],
                ),
                // 打者と投手
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: SizedBox(
                      height: 130,
                      child: Column(
                        children: [
                          //選手登録
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    bool front_set_member = true;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SetMemberPage(front_set_member)),
                                    );
                                  },
                                  child: const Text(
                                    '選手登録',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      onPrimary: Colors.white,
                                    ),
                                    onPressed: () {
                                      bool front_set_member = false;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SetMemberPage(front_set_member)),
                                      );
                                    },
                                    child: const Text(
                                      '選手登録',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
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
                                      child: TextButton(
                                        // style: TextButton.styleFrom(
                                        //   backgroundColor: Colors.grey,
                                        // ),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text('チーム名を入力'),
                                                  actions: [
                                                    Center(
                                                      child: TextField(
                                                        controller: teamNameController[0],
                                                        // decoration: const InputDecoration(
                                                        //   fillColor: Colors.grey,
                                                        //   filled: true,
                                                        // ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(context, 'Cancel'),
                                                            child: const Text('戻る'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              ref.read(TeamNameA.notifier).state = teamNameController[0].text;
                                                              FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                                                                'team_name' : ref.watch(TeamNameA)
                                                              });
                                                              Navigator.pop(context, 'OK');
                                                            },
                                                            child: const Text('OK'),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          // child: Text(
                                          //   ref.watch(TeamNameA),
                                          //   textAlign: TextAlign.center,
                                          //   style: const TextStyle(
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
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
                                          )
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
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                // ref.watch(FrontMemberPositionList.state).state[(inning ~/ 2) + 1],
                                                (front) ? "打者" : "投手",
                                                textAlign: TextAlign.center,
                                              ),
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
                                              int _now_batter_front = ref.watch(NowBatterFront.state).state;
                                              // print(ref.watch(FrontMemberNameList.state).state);
                                              // print(FrontPitcher);
                                              if (front) {
                                                // return print('left,front');
                                                // String result = ref.watch(FrontMemberNameList.state).state[_now_batter_front];
                                                // return result;
                                                // return Text('test');
                                                // print(ref.watch(FrontMemberNameList.state).state[_now_batter_front]);
                                                // ref.watch(FrontMemberNameList.state).state[_now_batter_front];
                                                FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                                                  'display_member' : ref.watch(FrontMemberNameList.state).state[_now_batter_front],
                                                });
                                                return FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  // child: Text(
                                                  //   ref.watch(FrontMemberNameList.state).state[_now_batter_front],
                                                  // ),
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                                    child: StreamBuilder<DocumentSnapshot>(
                                                        stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
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
                                                );
                                              } else {
                                                // print('left,back');
                                                // return ref.watch(FrontMemberNameList.state).state[FrontPitcher];
                                                FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                                                  'display_member' : ref.watch(FrontMemberNameList.state).state[FrontPitcher],
                                                });
                                                return FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  // child: Text(
                                                  //   ref.watch(FrontMemberNameList.state).state[FrontPitcher],
                                                  // ),
                                                  child: StreamBuilder<DocumentSnapshot>(
                                                      stream: FirebaseFirestore.instance.collection(game_name).doc('TeamA').snapshots(),
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
                                      // child: Text(
                                      //   nowInningAndTopBottom(),
                                      //   // textAlign: TextAlign.center,
                                      //   style: const TextStyle(
                                      //     fontSize: 15,
                                      //   ),
                                      // ),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                        child: (() {
                                          var inning = nowInningAndTopBottom();
                                          FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                            'inning' : inning
                                          });
                                          return StreamBuilder<DocumentSnapshot>(
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
                                          );
                                        })(),
                                      )
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
                                      child: TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text('チーム名を入力'),
                                                  actions: [
                                                    Center(
                                                      child: TextField(
                                                        controller: teamNameController[1],
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(context, 'Cancel'),
                                                            child: const Text('戻る'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              ref.watch(TeamNameB.notifier).state = teamNameController[1].text;
                                                              FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                                                                'team_name' : ref.watch(TeamNameB)
                                                              });
                                                              Navigator.pop(context, 'OK');
                                                            },
                                                            child: const Text('OK'),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        // child: Text(
                                        //   ref.watch(TeamNameB),
                                        //   textAlign: TextAlign.center,
                                        //   style: const TextStyle(
                                        //     color: Colors.black,
                                        //   ),
                                        // ),
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
                                            child: (() {
                                              int BackPitcher = ref.watch(BackMemberPositionList.state).state.indexOf('投');
                                              var _now_batter_back = ref.read(NowBatterBack.state).state;
                                              // print(BackPitcher);
                                              if (BackPitcher == -1) {
                                                BackPitcher = 1;
                                              }
                                              if (front) {
                                                // print('right,front');
                                                // return ref.watch(BackMemberNameList.state).state[BackPitcher];
                                                FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                                                  'display_member' : ref.watch(BackMemberNameList.state).state[BackPitcher],
                                                });
                                                return FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  // child: Text(
                                                  //   ref.watch(BackMemberNameList.state).state[BackPitcher],
                                                  //   // 'test'
                                                  // ),
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(minWidth: 1, minHeight: 1),
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
                                                );
                                              } else {
                                                // print('right,back');
                                                // return ref.watch(BackMemberNameList.state).state[_now_batter_back];
                                                FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                                                  'display_member' : ref.watch(BackMemberNameList.state).state[_now_batter_back],
                                                });
                                                return FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  // child: Text(
                                                  //   ref.watch(BackMemberNameList.state).state[_now_batter_back],
                                                  //   // 'test'
                                                  // ),
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
                                                );
                                              }
                                            }()),
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
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                // ref.watch(BackMemberPositionList.state).state[(inning ~/ 2) + 1],
                                                (!front) ? "打者" : "投手",
                                                textAlign: TextAlign.center,
                                              ),
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
                          //選手交代
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(front) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return changePlayerAttackDialog(context, ref);
                                        },
                                      );
                                    } else {
                                      bool front_member = true;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MemberSheet(front_member, front)),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    '選手交代',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(front) {
                                      bool front_member = false;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MemberSheet(front_member, front)),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return changePlayerAttackDialog(context, ref);
                                        },
                                      );
                                    }
                                  },
                                  child: const Text(
                                    '選手交代',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                          SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  ref.refresh(CountBallOpacityList);
                                  ref.refresh(CountOutOpacityList);
                                  ref.refresh(CountStrikeOpacityList);
                                  ref.read(Count.state).state['B'] = 0;
                                  ref.read(Count.state).state['S'] = 0;
                                  ref.read(Count.state).state['O'] = 0;

                                  FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                    'count_ball' : ref.watch(CountBallOpacityList)
                                  });
                                  FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                    'count_out' : ref.watch(CountOutOpacityList)
                                  });
                                  FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                    'count_strike' : ref.watch(CountStrikeOpacityList)
                                  });
                                },
                                child: const Text('リセット'),
                              )),
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
                                      // SizedBox(
                                      //   width: 25,
                                      //   child: TextButton(
                                      //     style: TextButton.styleFrom(
                                      //         textStyle: const TextStyle(
                                      //           // fontSize: 20,
                                      //         )
                                      //     ),
                                      //     onPressed: () {},
                                      //     child: Text(
                                      //       'B',
                                      //       style: TextStyle(
                                      //         fontSize: 25,
                                      //       ),
                                      //     ),
                                      //     // child: const FittedBox(
                                      //     //   // fit: BoxFit.fitWidth,
                                      //     //   child: Text(
                                      //     //     'B',
                                      //     //     style: TextStyle(
                                      //     //       // fontSize: 60,
                                      //     //     ),
                                      //     //   ),
                                      //     // ),
                                      //   ),
                                      // ),
                                      // const Text(
                                      //   'B',
                                      //   style: TextStyle(
                                      //     fontSize: 40,
                                      //   ),
                                      // ),
                                      GestureDetector(
                                        onTap: () {
                                          var count_ball_opacity_list = ref.watch(CountBallOpacityList.state).state;
                                          var _count_ball = (count_ball_opacity_list).indexOf(0.3);
                                          if(_count_ball == -1) {
                                            ref.refresh(CountBallOpacityList);
                                            ref.read(Count.state).state['B'] = 0;
                                          } else {
                                            count_ball_opacity_list[_count_ball] = 1.0;
                                            ref.read(CountBallOpacityList.state).state = [...count_ball_opacity_list];
                                            ref.read(Count.state).state['B'] = _count_ball+1;
                                          }
                                          FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                            'count_ball' : ref.watch(CountBallOpacityList)
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          child: const Text(
                                            'B',
                                            style: TextStyle(
                                              fontSize: 40,
                                            ),
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
                                                child: GestureDetector(
                                                  onTap: () {
                                                    var count_ball_opacity_list = ref.watch(CountBallOpacityList.state).state;
                                                    var _count_ball = (count_ball_opacity_list).indexOf(0.3);
                                                    if(_count_ball == -1) {
                                                      ref.refresh(CountBallOpacityList);
                                                      ref.read(Count.state).state['B'] = 0;
                                                    } else {
                                                      count_ball_opacity_list[_count_ball] = 1.0;
                                                      ref.read(CountBallOpacityList.state).state = [...count_ball_opacity_list];
                                                      ref.read(Count.state).state['B'] = _count_ball+1;
                                                    }
                                                    FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                                      'count_ball' : ref.watch(CountBallOpacityList)
                                                    });
                                                    // print(ref.watch(Count.state).state);
                                                    // if(count_ball_opacity_list[index] == 0.3) {
                                                    //   count_ball_opacity_list[index] = 1.0;
                                                    //   ref.read(CountBallOpacityList.state).state = [...count_ball_opacity_list];
                                                    // } else {
                                                    //   count_ball_opacity_list[index] = 0.3;
                                                    //   ref.read(CountBallOpacityList.state).state = [...count_ball_opacity_list];
                                                    // }
                                                  },
                                                  child: Container(
                                                    width: 38,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.black),
                                                      color: Colors.green,
                                                      shape:BoxShape.circle,
                                                    ),
                                                  ),
                                                )
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
                                      GestureDetector(
                                        onTap: () {
                                          var count_strike_opacity_list = ref.watch(CountStrikeOpacityList.state).state;
                                          var _count_strike = (count_strike_opacity_list).indexOf(0.3);
                                          if(_count_strike == -1) {
                                            ref.refresh(CountStrikeOpacityList);
                                            ref.read(Count.state).state['S'] = 0;
                                          } else {
                                            count_strike_opacity_list[_count_strike] = 1.0;
                                            ref.read(CountStrikeOpacityList.state).state = [...count_strike_opacity_list];
                                            ref.read(Count.state).state['S'] = _count_strike+1;
                                          }
                                          FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                            'count_strike' : ref.watch(CountStrikeOpacityList)
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          child: const Text(
                                            'S',
                                            style: TextStyle(
                                              fontSize: 40,
                                            ),
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
                                                child: GestureDetector(
                                                  onTap: () {
                                                    var count_strike_opacity_list = ref.watch(CountStrikeOpacityList.state).state;
                                                    var _count_strike = (count_strike_opacity_list).indexOf(0.3);
                                                    if(_count_strike == -1) {
                                                      ref.refresh(CountStrikeOpacityList);
                                                      ref.read(Count.state).state['S'] = 0;
                                                    } else {
                                                      count_strike_opacity_list[_count_strike] = 1.0;
                                                      ref.read(CountStrikeOpacityList.state).state = [...count_strike_opacity_list];
                                                      ref.read(Count.state).state['S'] = _count_strike+1;
                                                    }
                                                    FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                                      'count_strike' : ref.watch(CountStrikeOpacityList)
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 38,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.black),
                                                      color: Colors.yellow,
                                                      shape:BoxShape.circle,
                                                    ),
                                                  ),
                                                )
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
                                      GestureDetector(
                                        onTap: () {
                                          var count_out_opacity_list = ref.watch(CountOutOpacityList.state).state;
                                          var _count_out = (count_out_opacity_list).indexOf(0.3);
                                          if(_count_out == -1) {
                                            ref.refresh(CountOutOpacityList);
                                            ref.read(Count.state).state['O'] = 0;
                                          } else {
                                            count_out_opacity_list[_count_out] = 1.0;
                                            ref.read(CountOutOpacityList.state).state = [...count_out_opacity_list];
                                            ref.read(Count.state).state['O'] = _count_out+1;
                                          }
                                          FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                            'count_out' : ref.watch(CountStrikeOpacityList)
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          child: const Text(
                                            'O',
                                            style: TextStyle(
                                              fontSize: 40,
                                            ),
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
                                                child: GestureDetector(
                                                  onTap: () {
                                                    var count_out_opacity_list = ref.watch(CountOutOpacityList.state).state;
                                                    var _count_out = (count_out_opacity_list).indexOf(0.3);
                                                    if(_count_out == -1) {
                                                      ref.refresh(CountOutOpacityList);
                                                      ref.read(Count.state).state['O'] = 0;
                                                    } else {
                                                      count_out_opacity_list[_count_out] = 1.0;
                                                      ref.read(CountOutOpacityList.state).state = [...count_out_opacity_list];
                                                      ref.read(Count.state).state['O'] = _count_out+1;
                                                    }
                                                    FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                                      'count_out' : ref.watch(CountStrikeOpacityList)
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 38,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.black),
                                                      color: Colors.red,
                                                      shape:BoxShape.circle,
                                                    ),
                                                  ),
                                                )
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     const Text(
                                //       'B',
                                //       style: TextStyle(
                                //         fontSize: 40,
                                //       ),
                                //     ),
                                //     // Container(
                                //     //   width: 40,
                                //     //   height: 40,
                                //     //   decoration: BoxDecoration(
                                //     //     border: Border.all(color: Colors.black),
                                //     //     shape: BoxShape.circle,
                                //     //     color: Colors.green,
                                //     //   ),
                                //     // ),
                                //     Container(
                                //       width: 40,
                                //       height: 40,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.black),
                                //         shape: BoxShape.circle,
                                //         color: Colors.green,
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 40,
                                //       height: 40,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.black),
                                //         shape: BoxShape.circle,
                                //         color: Colors.green,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     const Text(
                                //       'S',
                                //       style: TextStyle(
                                //         fontSize: 40,
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 40,
                                //       height: 40,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.black),
                                //         shape: BoxShape.circle,
                                //         color: Colors.yellow,
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 40,
                                //       height: 40,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.black),
                                //         shape: BoxShape.circle,
                                //         color: Colors.yellow,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     const Text(
                                //       'O',
                                //       style: TextStyle(
                                //         fontSize: 40,
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 40,
                                //       height: 40,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.black),
                                //         shape: BoxShape.circle,
                                //         color: Colors.red,
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 40,
                                //       height: 40,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.black),
                                //         shape: BoxShape.circle,
                                //         color: Colors.red,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  // print(ref.watch(RunnerOpacityList.state).state);
                                  ref.refresh(RunnerOpacityList);
                                  print('理由はわからないが、消すとエラーになる');
                                  print(ref.watch(RunnerOpacityList.state).state);

                                  FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                    'runner' : ref.watch(RunnerOpacityList)
                                  });
                                },
                                child: const Text('リセット'),
                              )),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  // 'images/野球場イラスト1.png',
                                  'images/baseball_ground_illustration.jpeg',
                                  // '../images/baseball_ground_illustration.jpeg',
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        var _opacity_list = ref.read(RunnerOpacityList.state).state;
                                        if (_opacity_list[0] == 0.3) {
                                          _opacity_list[0] = 1.0;
                                          ref.read(Runner.state).state['1塁'] = true;
                                          // ref.watch(Runner.state).state =
                                          // runnerCount();
                                        } else {
                                          _opacity_list[0] = 0.3;
                                          ref.read(Runner.state).state['1塁'] = false;
                                        }
                                        ref.watch(RunnerOpacityList.state).state = [..._opacity_list];

                                        FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                          'runner' : ref.watch(RunnerOpacityList)
                                        });
                                      },
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
                                    )
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        var _opacity_list = ref.read(RunnerOpacityList.state).state;
                                        if (_opacity_list[1] == 0.3) {
                                          _opacity_list[1] = 1.0;
                                          ref.read(Runner.state).state['2塁'] = true;
                                        } else {
                                          _opacity_list[1] = 0.3;
                                          ref.read(Runner.state).state['2塁'] = false;
                                        }
                                        ref.watch(RunnerOpacityList.state).state = [..._opacity_list];

                                        FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                          'runner' : ref.watch(RunnerOpacityList)
                                        });
                                      },
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
                                    )
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        var _opacity_list = ref.read(RunnerOpacityList.state).state;
                                        if (_opacity_list[2] == 0.3) {
                                          _opacity_list[2] = 1.0;
                                          ref.read(Runner.state).state['3塁'] = true;
                                        } else {
                                          _opacity_list[2] = 0.3;
                                          ref.read(Runner.state).state['3塁'] = false;
                                        }
                                        ref.watch(RunnerOpacityList.state).state = [..._opacity_list];

                                        FirebaseFirestore.instance.collection(game_name).doc('board').update({
                                          'runner' : ref.watch(RunnerOpacityList)
                                        });
                                      },
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
                                    )
                                ),
                              ],
                            ),
                            // child: Center(
                            //   child: Column(
                            //     children: [
                            //       Image.asset(
                            //           'images/baseball_ground_illustration.jpeg'),
                            //       // Stack(
                            //       //   children: [
                            //       //     Positioned(
                            //       //       left: 5.0,
                            //       //       top: 5.0,
                            //       //       width: 5,
                            //       //       height: 5,
                            //       //       child: Container(
                            //       //         width: 5,
                            //       //         height: 5,
                            //       //         color: Colors.yellow,
                            //       //         // decoration: BoxDecoration(
                            //       //         //   border: Border.all(color: Colors.black),
                            //       //         //   shape: BoxShape.circle,
                            //       //         //   color: Colors.yellow,
                            //       //         // ),
                            //       //       ),
                            //       //     ),
                            //       //   ],
                            //       // ),
                            //     ],
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ボタン
                //**上にパンくずリストみたいな作成して押したボタンの経路を見れるようにしたい**
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Visibility(
                          visible: ref.watch(ButtonVisibleList.state).state['default']!,
                          // child: build_default_happen_button(context, ref, countAndRunnerCheck),
                          child: comment_button_widget.build_default_happen_button(context, ref),
                        ),
                        Visibility(
                          visible: ref.watch(ButtonVisibleList.state).state['四球']!,
                          // child: build_fourballs_button(context, ref, countAndRunnerCheck),
                          child: comment_button_widget.build_fourball_button(context, ref, countAndRunnerCheck, nextBatter),
                        ),
                        Visibility(
                          visible: ref.read(ButtonVisibleList.state).state['三振']!,
                          child: comment_button_widget.build_strikeout_button(context, ref),
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['三振_空振りと見逃し']!,
                            child: comment_button_widget.build_strikeout_missedandwhiff_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['三振_空振りと見逃し_振り逃げ']!,
                            child: comment_button_widget.build_strikeout_missedandwhiff_swingaway_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['盗塁']!,
                            child: comment_button_widget.build_stolenbase_button(context, ref, countAndRunnerCheck)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['盗塁_アウト']!,
                            child: comment_button_widget.build_stolenbase_out_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['バント']!,
                            child: comment_button_widget.build_bunt_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['バント_打球先']!,
                            child: comment_button_widget.build_bunt_position_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['バント_打球先_送球先']!,
                            child: comment_button_widget.build_bunt_position_nextthrowing_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['バント_次の打者']!,
                            child: comment_button_widget.build_bunt_nextbutter_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['デッドボール']!,
                            child: comment_button_widget.build_deadball_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['その他']!,
                            child: comment_button_widget.build_other_button(context, ref, countAndRunnerCheck)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['その他_パスワイルド']!,
                            child: comment_button_widget.build_other_pathwild_button(context, ref, countAndRunnerCheck)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['チェンジ']!,
                            child: comment_button_widget.build_change_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った']!,
                            child: comment_button_widget.build_hit_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_打球先']!,
                            child: comment_button_widget.build_hit_position_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_次の打者']!,
                            child: comment_button_widget.build_hit_nextbutter_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ランナー有り']!,
                            child: comment_button_widget.build_hit_runners_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ランナー有り_送球あり']!,
                            child: comment_button_widget.build_hit_runners_throwing_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ランナー有り_タッチアップ']!,
                            child: comment_button_widget.build_hit_runners_tuchup_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_次の打者_チェンジ']!,
                            child: comment_button_widget.build_hit_nextbutter_change_button(context, ref, countAndRunnerCheck, nextBatter)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ヒット_内野']!,
                            child: comment_button_widget.build_hit_infield_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ヒット_外野']!,
                            child: comment_button_widget.build_hit_outfield_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ヒット_外野_次']!,
                            child: comment_button_widget.build_hit_outfield_next_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ゴロ']!,
                            child: comment_button_widget.build_hit_goro_button(context, ref)
                        ),
                        Visibility(
                            visible: ref.read(ButtonVisibleList.state).state['打った_ゴロ_送球先']!,
                            child: comment_button_widget.build_hit_goro_nextthrowing_button(context, ref)
                        ),
                      ],
                    )
                ),
                //コメント
                //paddingの親widgetをexpandedにする
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                  child: TextField(
                    minLines: 5,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // labelText: 'Text',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    // controller: TextEditingController( text: "value" ),
                    controller: _controller,
                    onChanged: (value) {
                      // var get_comment = countAndRunnerCheck('四球');
                      ref.read(Comment.state).state = value;

                      FirebaseFirestore.instance.collection(game_name).doc('comment').update({
                        'content' : ref.watch(Comment)
                      });
                      // print(ref.watch(Comment.state).state);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget changePlayerAttackDialog(BuildContext context, WidgetRef ref) {

    final inning = ref.watch(Inning);
    bool front = (inning % 2) == 0 ? true : false;

    return SimpleDialog(
      // backgroundColor: const Color(0xff000080),
      title: const Text(
        '選択してください',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                            ref.read(BeforePushedButton.state).state = '代打\n';
                            bool front_member = false;
                            if(front){
                              front_member = true;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MemberSheet(front_member, front)),
                              // MaterialPageRoute(builder: (context) => changePlayerAttackDialog(context, ref)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[700],
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '代打',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                            ref.read(BeforePushedButton.state).state = '代走\n';
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return changePlayerAttackSubstituteRunnerDialog(context, ref);
                                }
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '代走',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, 'cancel');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '戻る',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget changePlayerAttackSubstituteRunnerDialog(BuildContext context, WidgetRef ref) {

    final inning = ref.watch(Inning);
    bool front = (inning % 2) == 0 ? true : false;

    return SimpleDialog(
      title: const Text('塁を選択してください'),
      children: [
        Container(
          width: 250,
          height: 250,
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          alignment: Alignment.center,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 0),
                child: Image.asset(
                  'images/baseball_ground_illustration.jpeg',
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'OK');
                      ref.read(BeforePushedButton.state).state += '一塁走者\n';
                      bool front_member = false;
                      if(front){
                        front_member = true;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberSheet(front_member, front)),
                      );
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 60),
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
                  )
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'OK');
                      ref.read(BeforePushedButton.state).state += '二塁走者\n';
                      bool front_member = false;
                      if(front){
                        front_member = true;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberSheet(front_member, front)),
                      );
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(top: 15),
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
                  )
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'OK');
                      ref.read(BeforePushedButton.state).state += '三塁走者\n';
                      bool front_member = false;
                      if(front){
                        front_member = true;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberSheet(front_member, front)),
                      );
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(left: 60),
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
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }

}


class ScoreDialog extends ConsumerWidget {
  const ScoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final All_Score_List = ref.watch(AllScore.notifier).state;
    // final Now_Score = ref.watch(NowScore.notifier).state;
    // final Now_Inning = ref.watch(Inning.notifier).state;

    //  毎回の得点をチーム別に
    splitScoreBoard(score_list) {
      int index = 0;
      var team_a = [];
      var team_b = [];
      for (var num in score_list){
        if ((index%2) == 0) {
          team_a.add(num);
        } else {
          team_b.add(num);
        }
        index++;
      }

      ref.read(TeamA.notifier).state = [...team_a];
      ref.read(TeamB.notifier).state = [...team_b];
    }

    //  チームの合計点
    totalScore() {
      int total_score = 0;
      final inning = ref.watch(Inning.notifier).state;
      int number = (inning ~/ 2);
      bool front = (inning % 2) == 0 ? true : false;
      final game_name = ref.watch(gameName.state).state;

      if (front) {
        var team_score_list = ref.watch(TeamA);
        for (int i=0; i<=number; i++) {
          int score = int.parse(team_score_list.elementAt(i));
          total_score += score;
        }
        ref.read(TeamATotallScore.notifier).state = total_score;
        FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
          'total_score' : ref.watch(TeamATotallScore)
        });
      } else {
        var team_score_list = ref.watch(TeamB);
        for (int i=0; i<=number; i++) {
          int score = int.parse(team_score_list.elementAt(i));
          total_score += score;
        }
        ref.read(TeamBTotallScore.notifier).state = total_score;
        FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
          'total_score' : ref.watch(TeamBTotallScore)
        });
      }
    }

    return AlertDialog(
      title: const Text('何点入った？'),
      content: Text(
        '${ref.watch(NowScore)}',
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  final game_name = ref.watch(gameName.state).state;
                  ref.read(NowScore.notifier).state --;
                  All_Score_List.replaceRange(ref.watch(Inning), ref.watch(Inning)+1, ['${ref.watch(NowScore)}']);
                  // print(ref.watch(AllScore).elementAt(0));
                  ref.read(AllScore.notifier).state = [...All_Score_List];
                  splitScoreBoard(All_Score_List);
                  totalScore();
                  // print(ref.watch(TeamA));
                  // print(ref.watch(TeamB));
                  FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                    'score' : ref.watch(TeamA)
                  });
                  FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                    'score' : ref.watch(TeamB)
                  });

                },
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  final game_name = ref.watch(gameName.state).state;
                  ref.read(NowScore.notifier).state ++;
                  All_Score_List.replaceRange(ref.watch(Inning), ref.watch(Inning)+1, ['${ref.watch(NowScore)}']);
                  ref.read(AllScore.notifier).state = [...All_Score_List];
                  // print(ref.watch(AllScore).elementAt(0));
                  splitScoreBoard(All_Score_List);
                  totalScore();
                  // print(ref.watch(TeamA));
                  // print(ref.watch(TeamB));

                  FirebaseFirestore.instance.collection(game_name).doc('TeamA').update({
                    'score' : ref.watch(TeamA)
                  });
                  FirebaseFirestore.instance.collection(game_name).doc('TeamB').update({
                    'score' : ref.watch(TeamB)
                  });
                },
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('戻る'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
