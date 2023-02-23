import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './Inputter.dart';

class commentButtonWidget extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }

  //デフォルト
  Widget build_default_happen_button(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 500,
      height: 230,
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        // print('成功');
                        // print(button_visible_list);
                        button_visible_list['default'] = false;
                        button_visible_list['四球'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                      ),
                      child: const Text(
                        '四球',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        // print('成功');
                        // print(button_visible_list);
                        button_visible_list['default'] = false;
                        button_visible_list['三振'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const Text(
                        '三振',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['default'] = false;
                          button_visible_list['盗塁'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text(
                          '盗塁',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['default'] = false;
                          button_visible_list['バント'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return build_bunt_button(context, ref, function);
                          //     }
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text(
                          'バント',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['default'] = false;
                          button_visible_list['デッドボール'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text(
                          'デッドボール',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['default'] = false;
                          button_visible_list['その他'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: const Text(
                          'その他',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          // ref.read(NowScore.notifier).state = 0;
                          // ref.read(Inning.notifier).state ++;
                          // bool _front =  (ref.read(Inning.notifier).state % 2) == 0 ? true : false;
                          // ref.read(Front.state).state = _front;

                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['default'] = false;
                          button_visible_list['チェンジ'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                        child: const Text(
                          'チェンジ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['default'] = false;
                          button_visible_list['打った'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[300],
                        ),
                        child: const Text(
                          '打った',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }


  //ファーボール
  Widget build_fourball_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {

    return Container(
      height: 230,
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
                          // ref.read(CommentLineList.state).state.add('');
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['四球'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          var next_batter = nextBatter();

                          var create_comment = countAndRunnerCheck('四球');
                          create_comment += '\n次の打者 $next_batter';
                          // var create_comment = countAndRunnerCheck('四球');
                          // InputterPage.countAnd;
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '次の打者',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['四球'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const Text(
                        '戻る',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }


  //三振
  Widget build_strikeout_button(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 230,
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['三振'] = false;
                          button_visible_list['三振_空振りと見逃し'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                          ref.read(BeforePushedButton.state).state = '空振り三振';
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '空振り',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['三振'] = false;
                          button_visible_list['三振_空振りと見逃し'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                          ref.read(BeforePushedButton.state).state = '見逃し三振';
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '見逃し',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['三振'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
          )
      ),
    );
  }

  Widget build_strikeout_missedandwhiff_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {
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

    return SizedBox(
      height: 230,
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['三振_空振りと見逃し'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          var next_batter = nextBatter();

                          var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                          create_comment += '\n次の打者 $next_batter';

                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n' + create_comment;
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '次の打者',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['三振_空振りと見逃し'] = false;
                          button_visible_list['三振_空振りと見逃し_振り逃げ'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                          ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 振り逃げ';
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '振り逃げ',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['三振_空振りと見逃し'] = false;
                            button_visible_list['default'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                            if(ref.watch(AllScore.state).state[ref.watch(Inning.state).state] == '　') {
                              ref.read(AllScore.state).state[ref.read(Inning.state).state] = '0';
                            }
                            var AllScoreList = ref.watch(AllScore.state).state;
                            splitScoreBoard(AllScoreList);
                            FirebaseFirestore.instance.collection('game1').doc('TeamA').update({
                              'score' : ref.watch(TeamA)
                            });
                            FirebaseFirestore.instance.collection('game1').doc('TeamB').update({
                              'score' : ref.watch(TeamB)
                            });

                            ref.read(NowScore.notifier).state = 0;
                            ref.read(Inning.notifier).state ++;
                            bool _front =  (ref.read(Inning.notifier).state % 2) == 0 ? true : false;
                            ref.read(Front.state).state = _front;
                            nextBatter();

                            var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                            create_comment += ' チェンジ';
                            if (ref.read(Comment.state).state == '') {
                              ref.read(Comment.state).state = create_comment;
                            }else {
                              ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                            }

                            FirebaseFirestore.instance.collection('game1').doc('comment').update({
                              'content' : ref.watch(Comment)
                            });

                            ref.refresh(CountBallOpacityList);
                            ref.refresh(CountStrikeOpacityList);
                            ref.refresh(CountOutOpacityList);
                            ref.refresh(RunnerOpacityList);
                            ref.read(Count.state).state['B'] = 0;
                            ref.read(Count.state).state['S'] = 0;
                            ref.read(Count.state).state['O'] = 0;
                            ref.read(Runner.state).state['1塁'] = false;
                            ref.read(Runner.state).state['2塁'] = false;
                            ref.read(Runner.state).state['3塁'] = false;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'チェンジ',
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
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['三振_空振りと見逃し'] = false;
                            button_visible_list['三振'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget build_strikeout_missedandwhiff_swingaway_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {

    return SizedBox(
      height: 230,
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['三振_空振りと見逃し_振り逃げ'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          var next_batter = nextBatter();

                          var create_comment = countAndRunnerCheck(ref.read(BeforePushedButton.state).state);
                          create_comment += '\n次の打者 $next_batter';
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n' + create_comment;
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '次の打者',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['三振_空振りと見逃し_振り逃げ'] = false;
                        button_visible_list['三振_空振りと見逃し'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        var _before_pushed_button = ref.read(BeforePushedButton.state).state;
                        ref.read(BeforePushedButton.state).state = _before_pushed_button.split('振り逃げ')[0];
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const Text(
                        '戻る',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }


  //盗塁
  Widget build_stolenbase_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck) {
    return SizedBox(
      height: 230,
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['盗塁'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                          var create_comment = countAndRunnerCheck('盗塁 セーフ');
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n' + create_comment;
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'セーフ',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['盗塁'] = false;
                          button_visible_list['盗塁_アウト'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'アウト',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['盗塁'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
          )
      ),
    );
  }

  Widget build_stolenbase_out_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {
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

    return SizedBox(
      height: 230,
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['盗塁_アウト'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                          var create_comment = countAndRunnerCheck('盗塁 アウト');
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '打席に戻る',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['盗塁_アウト'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          nextBatter();

                          if(ref.watch(AllScore.state).state[ref.watch(Inning.state).state] == '　') {
                            ref.read(AllScore.state).state[ref.read(Inning.state).state] = '0';
                          }
                          var AllScoreList = ref.watch(AllScore.state).state;
                          splitScoreBoard(AllScoreList);
                          FirebaseFirestore.instance.collection('game1').doc('TeamA').update({
                            'score' : ref.watch(TeamA)
                          });
                          FirebaseFirestore.instance.collection('game1').doc('TeamB').update({
                            'score' : ref.watch(TeamB)
                          });

                          ref.read(NowScore.notifier).state = 0;
                          ref.read(Inning.notifier).state ++;
                          bool _front =  (ref.read(Inning.notifier).state % 2) == 0 ? true : false;
                          ref.read(Front.state).state = _front;

                          var create_comment = countAndRunnerCheck('盗塁 アウト');
                          create_comment += ' チェンジ';
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.refresh(CountOutOpacityList);
                          ref.refresh(RunnerOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                          ref.read(Count.state).state['O'] = 0;
                          ref.read(Runner.state).state['1塁'] = false;
                          ref.read(Runner.state).state['2塁'] = false;
                          ref.read(Runner.state).state['3塁'] = false;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'チェンジ',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['盗塁_アウト'] = false;
                        button_visible_list['盗塁'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
          )
      ),
    );
  }


  //バント
  Widget build_bunt_button(BuildContext context, WidgetRef ref) {

    return Container(
      height: 230,
      // color: Colors.grey,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 40,
                      height: 20,
                      child: ElevatedButton(
                          onPressed: () {
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['バント'] = false;
                            button_visible_list['default'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.zero,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '←戻る',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '打球を処理した場所',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Container(
                    width: 200,
                    height: 200,
                    // color: Colors.grey,
                    child: Stack(
                        children: [
                          FittedBox(
                              fit: BoxFit.fill,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                                child: Image.asset(
                                  'images/野球場イラスト1.png',
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed: () {
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (context) {
                                      //       return build_bunt_position_button(context, ref, function);
                                      //     }
                                      // );
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '投',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(bottom: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '捕',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top:35, right: 35),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '一',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 50, left: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '二',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 50, right: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '遊',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 35, left: 35),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '三',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 25, right: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '右',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '中',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 25, left: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['バント'] = false;
                                      button_visible_list['バント_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      // ref.read(BeforePushedButton.state).state = '投';
                                      ref.read(BeforePushedButton.state).state = 'バント';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '左',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          )
                        ]
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget build_bunt_position_button(BuildContext context, WidgetRef ref) {

    return Container(
      height: 230,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  FittedBox(
                      fit: BoxFit.contain,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                        child: Image.asset(
                          'images/野球場イラスト2.jpeg',
                          alignment: Alignment.center,
                        ),
                      )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(right: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[0],
                        // opacity: 1.0,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            // ref.watch(ButtonVisibleThrowingBallList.state).state[0] = 1.0;
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[0] = 1.0;
                            // print(ref.read(ButtonVisibleThrowingBallList.state).state);
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                            // print(ref.read(ButtonVisibleThrowingBallList.state).state);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '一',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black),
                      //   shape: BoxShape.circle,
                      // ),
                      // child: Opacity(
                      //   // opacity: ref.read(RunnerOpacityList.state).state[0],
                      //   opacity: 1,
                      //   child: Container(
                      //       decoration: const BoxDecoration(
                      //         color: Colors.yellow,
                      //         shape: BoxShape.circle,
                      //       ),
                      //   ),
                      // )
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(top: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[1],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[1] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '二',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(left: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[2],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[2] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '三',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[3],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[3] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '捕',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 300,
                height: 80,
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['バント_打球先'] = false;
                                button_visible_list['バント_打球先_送球先'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 アウト';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 アウト';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 アウト';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 アウト';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'アウト',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['バント_打球先'] = false;
                                button_visible_list['バント_打球先_送球先'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 セーフ';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[700],
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'セーフ',
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['バント_打球先'] = false;
                                  button_visible_list['バント_次の打者'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                  var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                  if(destination.indexOf(1.0)==0) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==1) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==2) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==3) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 暴投';
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.brown,
                                ),
                                child: const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    '暴投',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['バント_打球先'] = false;
                                  button_visible_list['バント'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_bunt_position_nextthrowing_button(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 230,

      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  '次の送球',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['バント_打球先_送球先'] = false;
                          button_visible_list['バント_打球先'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          //
                          // var create_comment = function('盗塁 セーフ');
                          // if (ref.read(Comment.state).state == '') {
                          //   ref.read(Comment.state).state = create_comment;
                          // }else {
                          //   ref.read(Comment.state).state = ref.watch(Comment.state).state + '\n' + create_comment;
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'あり',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['バント_打球先_送球先'] = false;
                          button_visible_list['バント_次の打者'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'なし',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['バント_打球先_送球先'] = false;
                        button_visible_list['バント_打球先'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
          )
      ),
    );
  }

  Widget build_bunt_nextbutter_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {
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

    return SizedBox(
      height: 230,
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['バント_次の打者'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          var next_batter = nextBatter();

                          var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                          create_comment += '\n次の打者 $next_batter';
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '次の打者',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['バント_次の打者'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          nextBatter();

                          if(ref.watch(AllScore.state).state[ref.watch(Inning.state).state] == '　') {
                            ref.read(AllScore.state).state[ref.read(Inning.state).state] = '0';
                          }
                          var AllScoreList = ref.watch(AllScore.state).state;
                          splitScoreBoard(AllScoreList);
                          FirebaseFirestore.instance.collection('game1').doc('TeamA').update({
                            'score' : ref.watch(TeamA)
                          });
                          FirebaseFirestore.instance.collection('game1').doc('TeamB').update({
                            'score' : ref.watch(TeamB)
                          });

                          ref.read(NowScore.notifier).state = 0;
                          ref.read(Inning.notifier).state ++;
                          bool _front =  (ref.read(Inning.notifier).state % 2) == 0 ? true : false;
                          ref.read(Front.state).state = _front;

                          var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                          create_comment += ' チェンジ';
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.refresh(CountOutOpacityList);
                          ref.refresh(RunnerOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                          ref.read(Count.state).state['O'] = 0;
                          ref.read(Runner.state).state['1塁'] = false;
                          ref.read(Runner.state).state['2塁'] = false;
                          ref.read(Runner.state).state['3塁'] = false;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'チェンジ',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['バント_次の打者'] = false;
                        button_visible_list['バント_打球先_送球先'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
          )
      ),
    );
  }


  //デッドボール
  Widget build_deadball_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {

    return SizedBox(
      height: 230,
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['デッドボール'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        var next_batter = nextBatter();

                        var create_comment = countAndRunnerCheck('死球');
                        create_comment += '\n次の打者 $next_batter';
                        if (ref.read(Comment.state).state == '') {
                          ref.read(Comment.state).state = create_comment;
                        }else {
                          ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                        }

                        FirebaseFirestore.instance.collection('game1').doc('comment').update({
                          'content' : ref.watch(Comment)
                        });

                        ref.refresh(CountBallOpacityList);
                        ref.refresh(CountStrikeOpacityList);
                        ref.read(Count.state).state['B'] = 0;
                        ref.read(Count.state).state['S'] = 0;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '次の打者',
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
                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                      button_visible_list['デッドボール'] = false;
                      button_visible_list['default'] = true;
                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text(
                      '戻る',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  //打った
  Widget build_hit_button(BuildContext context, WidgetRef ref) {

    return SizedBox(
      height: 230,
      // color: Colors.grey,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 40,
                      height: 20,
                      child: ElevatedButton(
                          onPressed: () {
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['打った'] = false;
                            button_visible_list['default'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.zero,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '←戻る',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '打球を処理した場所',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: SizedBox(
                    width: 200,
                    height: 200,
                    // color: Colors.grey,
                    child: Stack(
                        children: [
                          FittedBox(
                              fit: BoxFit.fill,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
                                child: Image.asset(
                                  'images/野球場イラスト1.png',
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed: () {
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (context) {
                                      //       return build_bunt_position_button(context, ref, function);
                                      //     }
                                      // );
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '投';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '投',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(bottom: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '捕';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '捕',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top:35, right: 35),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '一';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '一',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 50, left: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '二';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '二',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 50, right: 50),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '遊';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '遊',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 35, left: 35),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '三';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '三',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 25, right: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '右';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '右',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '中';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '中',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 25, left: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                      button_visible_list['打った'] = false;
                                      button_visible_list['打った_打球先'] = true;
                                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                      ref.read(BeforePushedButton.state).state = '左';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: Colors.yellow,
                                      side: const BorderSide(
                                          color: Colors.black
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '左',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          )
                        ]
                    )
                )
            ),
          ],
        ),
      ),
    );

  }

  Widget build_hit_position_button(BuildContext context, WidgetRef ref) {

    return Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 90,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                      ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}直';
                      if(_runner_opacity_list.indexOf(1.0)==-1) {
                        //ランナーがいない
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_打球先'] = false;
                        button_visible_list['打った_次の打者'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      } else {
                        //ランナーがいる
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_打球先'] = false;
                        button_visible_list['打った_ランナー有り'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[700],
                    ),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'ライナー\n(アウト)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                        ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}飛';
                        if(_runner_opacity_list.indexOf(1.0)==-1) {
                          //ランナーがいない
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_打球先'] = false;
                          button_visible_list['打った_次の打者'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        } else {
                          //ランナーがいる
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_打球先'] = false;
                          button_visible_list['打った_ランナー有り'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'フライ',
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
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                          ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}邪飛';
                          if(_runner_opacity_list.indexOf(1.0)==-1) {
                            //ランナーがいない
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['打った_打球先'] = false;
                            button_visible_list['打った_次の打者'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          } else {
                            //ランナーがいる
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['打った_打球先'] = false;
                            button_visible_list['打った_ランナー有り'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.zero,

                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'ファウル\nフライ',
                            textAlign: TextAlign.center,
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
                        var _handle_position = ref.watch(BeforePushedButton.state).state;
                        if ((_handle_position == '右') || (_handle_position == '中') || (_handle_position == '左')) {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_打球先'] = false;
                          button_visible_list['打った_ヒット_外野'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        } else {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_打球先'] = false;
                          button_visible_list['打った_ヒット_内野'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                      ),
                      child: const Text(
                        'ヒット',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_打球先'] = false;
                        button_visible_list['打った_次の打者'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}失';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      ),
                      child: const Text(
                        'エラー',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_打球先'] = false;
                        button_visible_list['打った_ゴロ'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}ゴロ';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Text(
                        'ゴロ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_打球先'] = false;
                        button_visible_list['打った'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: const Text(
                        '戻る',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget build_hit_nextbutter_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {

    return SizedBox(
      height: 230,
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
                          // ref.read(CommentLineList.state).state.add('');
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_次の打者'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          var next_batter = nextBatter();

                          var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                          create_comment += '\n次の打者 $next_batter';
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '次の打者',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_次の打者'] = false;
                        button_visible_list['打った_打球先'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const Text(
                        '戻る',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );

  }

  Widget build_hit_runners_button(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 230,

      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  '送球',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_ランナー有り'] = false;
                          button_visible_list['打った_ランナー有り_送球あり'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          //
                          // var create_comment = function('盗塁 セーフ');
                          // if (ref.read(Comment.state).state == '') {
                          //   ref.read(Comment.state).state = create_comment;
                          // }else {
                          //   ref.read(Comment.state).state = ref.watch(Comment.state).state + '\n' + create_comment;
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'あり',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_ランナー有り'] = false;
                          button_visible_list['打った_次の打者'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'なし',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['打った_ランナー有り'] = false;
                            button_visible_list['打った_ランナー有り_タッチアップ'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                            //
                            // var create_comment = function('盗塁 セーフ');
                            // if (ref.read(Comment.state).state == '') {
                            //   ref.read(Comment.state).state = create_comment;
                            // }else {
                            //   ref.read(Comment.state).state = ref.watch(Comment.state).state + '\n' + create_comment;
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orangeAccent,
                            padding: EdgeInsets.zero,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'タッチアップ',
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
                            var button_visible_list = ref.read(ButtonVisibleList.state).state;
                            button_visible_list['打った_ランナー有り'] = false;
                            button_visible_list['打った_打球先'] = true;
                            ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget build_hit_runners_throwing_button(BuildContext context, WidgetRef ref) {

    return Container(
      height: 230,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  FittedBox(
                      fit: BoxFit.contain,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                        child: Image.asset(
                          'images/野球場イラスト2.jpeg',
                          alignment: Alignment.center,
                        ),
                      )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(right: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[0],
                        // opacity: 1.0,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            // ref.watch(ButtonVisibleThrowingBallList.state).state[0] = 1.0;
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[0] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '一',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black),
                      //   shape: BoxShape.circle,
                      // ),
                      // child: Opacity(
                      //   // opacity: ref.read(RunnerOpacityList.state).state[0],
                      //   opacity: 1,
                      //   child: Container(
                      //       decoration: const BoxDecoration(
                      //         color: Colors.yellow,
                      //         shape: BoxShape.circle,
                      //       ),
                      //   ),
                      // )
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(top: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[1],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[1] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '二',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(left: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[2],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[2] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '三',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[3],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[3] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '捕',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 300,
                height: 80,
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ランナー有り_送球あり'] = false;
                                button_visible_list['打った_次の打者_チェンジ'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 アウト';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 アウト';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 アウト';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 アウト';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'アウト',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ランナー有り_送球あり'] = false;
                                button_visible_list['打った_次の打者_チェンジ'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 セーフ';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[700],
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'セーフ',
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ランナー有り_送球あり'] = false;
                                  button_visible_list['打った_次の打者_チェンジ'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                  var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                  if(destination.indexOf(1.0)==0) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==1) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==2) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==3) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 暴投';
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.brown,
                                ),
                                child: const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    '暴投',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ランナー有り_送球あり'] = false;
                                  button_visible_list['打った_ランナー有り'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_hit_runners_tuchup_button(BuildContext context, WidgetRef ref) {

    return Container(
      height: 230,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  FittedBox(
                      fit: BoxFit.contain,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                        child: Image.asset(
                          'images/野球場イラスト2.jpeg',
                          alignment: Alignment.center,
                        ),
                      )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(right: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[0],
                        // opacity: 1.0,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            // ref.watch(ButtonVisibleThrowingBallList.state).state[0] = 1.0;
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[0] = 1.0;
                            // print(ref.read(ButtonVisibleThrowingBallList.state).state);
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                            // print(ref.read(ButtonVisibleThrowingBallList.state).state);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '一',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black),
                      //   shape: BoxShape.circle,
                      // ),
                      // child: Opacity(
                      //   // opacity: ref.read(RunnerOpacityList.state).state[0],
                      //   opacity: 1,
                      //   child: Container(
                      //       decoration: const BoxDecoration(
                      //         color: Colors.yellow,
                      //         shape: BoxShape.circle,
                      //       ),
                      //   ),
                      // )
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(top: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[1],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[1] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '二',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(left: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[2],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[2] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '三',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[3],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[3] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '捕',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 300,
                height: 80,
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ランナー有り_タッチアップ'] = false;
                                button_visible_list['打った_次の打者_チェンジ'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 アウト';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 アウト';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 アウト';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 アウト';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'アウト',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ランナー有り_タッチアップ'] = false;
                                button_visible_list['打った_次の打者_チェンジ'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 セーフ';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[700],
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'セーフ',
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
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 80,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              var button_visible_list = ref.read(ButtonVisibleList.state).state;
                              button_visible_list['打った_ランナー有り_タッチアップ'] = false;
                              button_visible_list['打った_ランナー有り'] = true;
                              ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_hit_nextbutter_change_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck, Function nextBatter) {

    var _before_push = ref.watch(BeforePushedButton.state).state;
    var _next_screen = '';

    if (_before_push.length > 0) {
      if (_before_push == 'ゴ') {
        _next_screen = '打った_ゴロ_送球先';
      } else {
        _next_screen = '打った_ランナー有り';
      }
    }

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

    return SizedBox(
      height: 230,
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
                          // ref.read(CommentLineList.state).state.add('');
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_次の打者_チェンジ'] = false;
                          button_visible_list['default'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          var next_batter = nextBatter();

                          var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                          create_comment += '\n次の打者 $next_batter';
                          if (ref.read(Comment.state).state == '') {
                            ref.read(Comment.state).state = create_comment;
                          }else {
                            ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                          }

                          FirebaseFirestore.instance.collection('game1').doc('comment').update({
                            'content' : ref.watch(Comment)
                          });

                          ref.refresh(CountBallOpacityList);
                          ref.refresh(CountStrikeOpacityList);
                          ref.read(Count.state).state['B'] = 0;
                          ref.read(Count.state).state['S'] = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '次の打者',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_次の打者_チェンジ'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        nextBatter();

                        if(ref.watch(AllScore.state).state[ref.watch(Inning.state).state] == '　') {
                          ref.read(AllScore.state).state[ref.read(Inning.state).state] = '0';
                        }
                        var AllScoreList = ref.watch(AllScore.state).state;
                        splitScoreBoard(AllScoreList);
                        FirebaseFirestore.instance.collection('game1').doc('TeamA').update({
                          'score' : ref.watch(TeamA)
                        });
                        FirebaseFirestore.instance.collection('game1').doc('TeamB').update({
                          'score' : ref.watch(TeamB)
                        });

                        ref.read(NowScore.notifier).state = 0;
                        ref.read(Inning.notifier).state ++;
                        bool _front =  (ref.read(Inning.notifier).state % 2) == 0 ? true : false;
                        ref.read(Front.state).state = _front;

                        var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                        create_comment += ' チェンジ';
                        if (ref.read(Comment.state).state == '') {
                          ref.read(Comment.state).state = create_comment;
                        }else {
                          ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                        }

                        FirebaseFirestore.instance.collection('game1').doc('comment').update({
                          'content' : ref.watch(Comment)
                        });

                        ref.refresh(CountBallOpacityList);
                        ref.refresh(CountStrikeOpacityList);
                        ref.refresh(CountOutOpacityList);
                        ref.refresh(RunnerOpacityList);
                        ref.read(Count.state).state['B'] = 0;
                        ref.read(Count.state).state['S'] = 0;
                        ref.read(Count.state).state['O'] = 0;
                        ref.read(Runner.state).state['1塁'] = false;
                        ref.read(Runner.state).state['2塁'] = false;
                        ref.read(Runner.state).state['3塁'] = false;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'チェンジ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 90,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_次の打者_チェンジ'] = false;
                        button_visible_list[_next_screen] = true;
                        // button_visible_list['打った_ランナー有り'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
              )
            ],
          )
      ),
    );

  }

  Widget build_hit_infield_button(BuildContext context, WidgetRef ref) {

    return Container(
      height: 230,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: ,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 90,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_ヒット_内野'] = false;
                        button_visible_list['打った_次の打者'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}内安';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '内野安打',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_ヒット_内野'] = false;
                        button_visible_list['打った_次の打者'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}強安';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '強襲',
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
                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                      button_visible_list['打った_ヒット_内野'] = false;
                      button_visible_list['打った_打球先'] = true;
                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
            )
          ],
        ),
      ),
    );
  }

  Widget build_hit_outfield_button(BuildContext context, WidgetRef ref) {

    var _before_button = ref.watch(BeforePushedButton.state).state;
    var button1 = '';
    var button2 = '';
    var button3 = '';
    var button4 = '';
    var display_comment_1 = '';
    var display_comment_2 = '';
    var display_comment_3 = '';
    var display_comment_4 = '';
    if(_before_button == '左') {
      button1 = 'レフト前';
      button2 = 'レフト\nオーバー';
      button3 = 'レフト線';
      button4 = '左中間';
      var display_comment_1 = ' 左';
      var display_comment_2 = ' レフト線';
      var display_comment_3 = ' 左越';
      var display_comment_4 = ' 左中';
    } else if(_before_button == '中') {
      button1 = 'センター前';
      button2 = 'センター\nオーバー';
      button3 = '左中間';
      button4 = '右中間';
      var display_comment_1 = ' 中';
      var display_comment_2 = ' 中越';
      var display_comment_3 = ' 左中';
      var display_comment_4 = ' 右中';
    } else {
      button1 = 'ライト前';
      button2 = 'ライト\nオーバー';
      button3 = 'ライト線';
      button4 = '右中間';
      var display_comment_1 = ' 右';
      var display_comment_2 = ' 右越';
      var display_comment_3 = ' ライト線';
      var display_comment_4 = ' 右中';
    }

    double _width = 90;
    double _height = 45;

    return Container(
      height: 230,
      // color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                // width: 300,
                // height: 80,
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: _width,
                          height: _height,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ヒット_外野'] = false;
                                button_visible_list['打った_ヒット_外野_次'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_1;
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[700],
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  button1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: _width,
                          height: _height,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ヒット_外野'] = false;
                                button_visible_list['打った_ヒット_外野_次'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_2;
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  button2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ヒット_外野'] = false;
                                  button_visible_list['打った_ヒット_外野_次'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                  ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_3;
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[300],
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    button3,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ヒット_外野'] = false;
                                  button_visible_list['打った_ヒット_外野_次'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                  ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_4;
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    button4,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: _width,
                        height: _height,
                        child: ElevatedButton(
                            onPressed: () {
                              var button_visible_list = ref.read(ButtonVisibleList.state).state;
                              button_visible_list['打った_ヒット_外野'] = false;
                              button_visible_list['打った_打球先'] = true;
                              ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
            ),
          ],
        ),
      ),
    );
  }

  Widget build_hit_outfield_next_button(BuildContext context, WidgetRef ref) {

    var button1 = 'シングル';
    var button2 = 'ツーベース';
    var button3 = 'スリ\nベース';
    var button4 = 'ホームラン';
    var button5 = 'ランニン\nHR';

    var display_comment_1 = '安';
    var display_comment_2 = '2';
    var display_comment_3 = '3';
    var display_comment_4 = '本';
    var display_comment_5 = '走本';

    double _width = 90;
    double _height = 45;

    return Container(
      height: 230,
      // color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                // width: 300,
                // height: 130,
                // color: Colors.grey,
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: _width,
                          height: _height,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ヒット_外野_次'] = false;
                                button_visible_list['打った_次の打者'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_1;
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[700],
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  button1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: _width,
                          height: _height,
                          child: ElevatedButton(
                              onPressed: () {
                                var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                button_visible_list['打った_ヒット_外野_次'] = false;
                                button_visible_list['打った_次の打者'] = true;
                                ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_2;
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  button2,
                                  style: const TextStyle(
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ヒット_外野_次'] = false;
                                  button_visible_list['打った_次の打者'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                  ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_3;
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[300],
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    button3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ヒット_外野_次'] = false;
                                  button_visible_list['打った_次の打者'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                  ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_4;
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    button4,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ヒット_外野_次'] = false;
                                  button_visible_list['打った_次の打者'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                                  ref.read(BeforePushedButton.state).state = ref.watch(BeforePushedButton.state).state + display_comment_5;
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    button5,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: _width,
                            height: _height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ヒット_外野_次'] = false;
                                  button_visible_list['打った_ヒット_外野'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_hit_goro_button(BuildContext context, WidgetRef ref) {

    return Container(
      height: 230,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  FittedBox(
                      fit: BoxFit.contain,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                        child: Image.asset(
                          'images/野球場イラスト2.jpeg',
                          alignment: Alignment.center,
                        ),
                      )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(right: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[0],
                        // opacity: 1.0,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            // ref.watch(ButtonVisibleThrowingBallList.state).state[0] = 1.0;
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[0] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '一',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black),
                      //   shape: BoxShape.circle,
                      // ),
                      // child: Opacity(
                      //   // opacity: ref.read(RunnerOpacityList.state).state[0],
                      //   opacity: 1,
                      //   child: Container(
                      //       decoration: const BoxDecoration(
                      //         color: Colors.yellow,
                      //         shape: BoxShape.circle,
                      //       ),
                      //   ),
                      // )
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(top: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[1],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[1] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '二',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(left: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[2],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[2] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '三',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Opacity(
                        opacity: ref.read(ButtonVisibleThrowingBallList.state).state[3],
                        child: ElevatedButton(
                          onPressed: () {
                            ref.refresh(ButtonVisibleThrowingBallList);
                            var _throwing_opacity_list = ref.read(ButtonVisibleThrowingBallList.state).state;
                            _throwing_opacity_list[3] = 1.0;
                            ref.watch(ButtonVisibleThrowingBallList.state).state = [..._throwing_opacity_list];
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: Colors.yellow,
                            side: const BorderSide(
                                color: Colors.black
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Center(
                            child: Text(
                              '捕',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 300,
                height: 80,
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                                if(_runner_opacity_list.indexOf(1.0)==-1) {
                                  //ランナーがいない
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ゴロ'] = false;
                                  button_visible_list['打った_次の打者_チェンジ'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                } else {
                                  //ランナーがいる
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ゴロ'] = false;
                                  button_visible_list['打った_ゴロ_送球先'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                }

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 アウト';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 アウト';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 アウト';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 アウト';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'アウト',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                                ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}直';
                                if(_runner_opacity_list.indexOf(1.0)==-1) {
                                  //ランナーがいない
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ゴロ'] = false;
                                  button_visible_list['打った_次の打者_チェンジ'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                } else {
                                  //ランナーがいる
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ゴロ'] = false;
                                  button_visible_list['打った_ゴロ_送球先'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                }

                                var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                if(destination.indexOf(1.0)==0) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==1) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==2) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 セーフ';
                                } else if(destination.indexOf(1.0)==3) {
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 セーフ';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[700],
                              ),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'セーフ',
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}直';
                                  if(_runner_opacity_list.indexOf(1.0)==-1) {
                                    //ランナーがいない
                                    var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                    button_visible_list['打った_ゴロ'] = false;
                                    button_visible_list['打った_次の打者_チェンジ'] = true;
                                    ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                  } else {
                                    //ランナーがいる
                                    var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                    button_visible_list['打った_ゴロ'] = false;
                                    button_visible_list['打った_ゴロ_送球先'] = true;
                                    ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                  }

                                  var destination = ref.watch(ButtonVisibleThrowingBallList.state).state;
                                  if(destination.indexOf(1.0)==0) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 1塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==1) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 2塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==2) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 3塁送球 暴投';
                                  } else if(destination.indexOf(1.0)==3) {
                                    ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state} 本塁へ送球 暴投';
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.brown,
                                ),
                                child: const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    '暴投',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                                  ref.read(BeforePushedButton.state).state = '${ref.watch(BeforePushedButton.state).state}直';
                                  if(_runner_opacity_list.indexOf(1.0)==-1) {
                                    //ランナーがいない
                                    var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                    button_visible_list['打った_ゴロ'] = false;
                                    button_visible_list['打った_次の打者_チェンジ'] = true;
                                    ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                  } else {
                                    //ランナーがいる
                                    var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                    button_visible_list['打った_ゴロ'] = false;
                                    button_visible_list['打った_ゴロ_送球先'] = true;
                                    ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                ),
                                child: const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'エラー',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  var button_visible_list = ref.read(ButtonVisibleList.state).state;
                                  button_visible_list['打った_ゴロ'] = false;
                                  button_visible_list['打った_打球先'] = true;
                                  ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_hit_goro_nextthrowing_button(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 230,

      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  '次の送球',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_ゴロ_送球先'] = false;
                          button_visible_list['打った_ゴロ'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                          //
                          // var create_comment = function('盗塁 セーフ');
                          // if (ref.read(Comment.state).state == '') {
                          //   ref.read(Comment.state).state = create_comment;
                          // }else {
                          //   ref.read(Comment.state).state = ref.watch(Comment.state).state + '\n' + create_comment;
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'あり',
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
                          var button_visible_list = ref.read(ButtonVisibleList.state).state;
                          button_visible_list['打った_ゴロ_送球先'] = false;
                          button_visible_list['打った_次の打者_チェンジ'] = true;
                          ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'なし',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['打った_ゴロ_送球先'] = false;
                        button_visible_list['打った_ゴロ'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
          )
      ),
    );
  }


  //その他
  Widget build_other_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck) {

    return SizedBox(
      height: 230,
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['その他'] = false;
                        button_visible_list['その他_パスワイルド'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        ref.read(BeforePushedButton.state).state = 'パスボール';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'パス\nボール',
                          textAlign: TextAlign.center,
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['その他'] = false;
                        button_visible_list['その他_パスワイルド'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        ref.read(BeforePushedButton.state).state = 'ワイルドピッチ';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'ワイルド\nピッチ',
                          textAlign: TextAlign.center,
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
                      var button_visible_list = ref.read(ButtonVisibleList.state).state;
                      button_visible_list['その他'] = false;
                      button_visible_list['default'] = true;
                      ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
    );
  }

  Widget build_other_pathwild_button(BuildContext context, WidgetRef ref, Function countAndRunnerCheck) {

    return SizedBox(
      height: 230,
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['その他_パスワイルド'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        var create_comment = countAndRunnerCheck(ref.watch(BeforePushedButton.state).state);
                        if (ref.read(Comment.state).state == '') {
                          ref.read(Comment.state).state = create_comment;
                        }else {
                          ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
                        }

                        FirebaseFirestore.instance.collection('game1').doc('comment').update({
                          'content' : ref.watch(Comment)
                        });

                        ref.refresh(CountBallOpacityList);
                        ref.refresh(CountStrikeOpacityList);
                        ref.read(Count.state).state['B'] = 0;
                        ref.read(Count.state).state['S'] = 0;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '打席に戻る',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['その他_パスワイルド'] = false;
                        button_visible_list['その他'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
              ],
            ),
          ],
        ),
      ),
    );
  }


  //チェンジ
  Widget build_change_button(BuildContext context, WidgetRef ref) {
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

    return SizedBox(
      height: 230,
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['チェンジ'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};

                        if(ref.watch(AllScore.state).state[ref.watch(Inning.state).state] == '　') {
                          ref.read(AllScore.state).state[ref.read(Inning.state).state] = '0';
                        }

                        var AllScoreList = ref.watch(AllScore.state).state;
                        splitScoreBoard(AllScoreList);
                        FirebaseFirestore.instance.collection('game1').doc('TeamA').update({
                          'score' : ref.watch(TeamA)
                        });
                        FirebaseFirestore.instance.collection('game1').doc('TeamB').update({
                          'score' : ref.watch(TeamB)
                        });

                        ref.read(NowScore.notifier).state = 0;
                        ref.read(Inning.notifier).state ++;
                        bool _front =  (ref.read(Inning.notifier).state % 2) == 0 ? true : false;
                        ref.read(Front.state).state = _front;

                        var _runner = ref.read(Runner.state).state;
                        var _runner_count_list = [];
                        var _runner_count = '';
                        _runner.forEach((key,value) {
                          if(value) {
                            _runner_count_list.add(key);
                          }
                        });
                        if(_runner_count_list.length == 0) {
                          _runner_count = '無し';
                        } else {
                          for (var value in _runner_count_list) {
                            _runner_count += value;
                          }
                        }

                        var create_comment = '';
                        var _runner_opacity_list = ref.watch(RunnerOpacityList.state).state;
                        if(_runner_opacity_list.indexOf(1.0)==-1) {
                          //ランナーがいない
                          create_comment = 'ランナー無し　チェンジ';
                        } else {
                          //ランナーがいる
                          create_comment = '${_runner_count}ランナー残留　チェンジ';
                        }
                        ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';

                        FirebaseFirestore.instance.collection('game1').doc('comment').update({
                          'content' : ref.watch(Comment)
                        });

                        ref.refresh(CountBallOpacityList);
                        ref.refresh(CountStrikeOpacityList);
                        ref.refresh(CountOutOpacityList);
                        ref.refresh(RunnerOpacityList);
                        ref.read(Count.state).state['B'] = 0;
                        ref.read(Count.state).state['S'] = 0;
                        ref.read(Count.state).state['O'] = 0;
                        ref.read(Runner.state).state['1塁'] = false;
                        ref.read(Runner.state).state['2塁'] = false;
                        ref.read(Runner.state).state['3塁'] = false;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[700],
                      ),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'チェンジ',
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
                        var button_visible_list = ref.read(ButtonVisibleList.state).state;
                        button_visible_list['チェンジ'] = false;
                        button_visible_list['default'] = true;
                        ref.watch(ButtonVisibleList.state).state = {...button_visible_list};
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}


