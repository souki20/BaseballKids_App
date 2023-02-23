import 'package:baseballboy_ver2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberSheet extends ConsumerWidget {
  MemberSheet(this.front_member, this.front, {Key? key}) : super(key: key);

  final bool front_member;
  final bool front;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member_list = ref.watch(FrontMemberList);

    JudgeChangeMemberBorder(index) {
      var _change_member_border_check = ref.watch(ChangeMemberBroderCheck.state).state;
      if(_change_member_border_check[index+1]) {
        return BorderSide(
          width: 3,
          color: Colors.red,
        );
      } else {
        return BorderSide();
      }
    }

    var _change_member_border_check = ref.read(ChangeMemberBroderCheck.state).state;
    var _len_border_true = _change_member_border_check.where((element) => (element==true)).toList().length;
    // print('テスト');
    //一つずつ取り出し、falseにして再度検索

    ChangePositionName(value) {
      if(value=='投') {
        return 'ピッチャー';
      }else if(value=='捕') {
        return 'キャッチャー';
      }else if(value=='一') {
        return 'ファースト';
      }else if(value=='二') {
        return 'セカンド';
      }else if(value=='三') {
        return 'サード';
      }else if(value=='遊') {
        return 'ショート';
      }else if(value=='右') {
        return 'ライト';
      }else if(value=='中') {
        return 'センター';
      }else if(value=='左') {
        return 'レフト';
      }else{
        return '';
      }
    }

    ChangeMember(){
      var _change_member_index_list = [];
      var _save_data_list = [];

      var _front_member_name_list = ref.watch(FrontMemberNameList.state).state;
      var _front_member_position_list = ref.watch(FrontMemberPositionList.state).state;
      var _front_member_arm_list = ref.watch(FrontMemberArmList.state).state;

      var _back_member_name_list = ref.watch(BackMemberNameList.state).state;
      var _back_member_position_list = ref.watch(BackMemberPositionList.state).state;
      var _back_member_arm_list = ref.watch(BackMemberArmList.state).state;

      for(var index = 0; index<2; index++){
        var _change_member_index_single = ref.read(ChangeMemberBroderCheck.state).state.indexWhere((element) => (element==true));
        _change_member_index_list.add(_change_member_index_single);
        _change_member_border_check[_change_member_index_single] = false;
      }

      if(front_member) {
        _save_data_list.add(_front_member_name_list[_change_member_index_list[0]]);
        _save_data_list.add(_front_member_position_list[_change_member_index_list[0]]);
        _save_data_list.add(_front_member_arm_list[_change_member_index_list[0]]);

        _front_member_name_list[_change_member_index_list[0]] = _front_member_name_list[_change_member_index_list[1]];
        _front_member_position_list[_change_member_index_list[0]] = _front_member_position_list[_change_member_index_list[1]];
        _front_member_arm_list[_change_member_index_list[0]] = _front_member_arm_list[_change_member_index_list[1]];

        _front_member_name_list[_change_member_index_list[1]] = _save_data_list[0];
        _front_member_position_list[_change_member_index_list[1]] = _save_data_list[1];
        _front_member_arm_list[_change_member_index_list[1]] = _save_data_list[2];

        ref.read(FrontMemberNameList.state).state = [..._front_member_name_list];
        ref.read(FrontMemberPositionList.state).state = [..._front_member_position_list];
        ref.read(FrontMemberArmList.state).state = [..._front_member_arm_list];

        var _change_position = ChangePositionName(_front_member_position_list[_change_member_index_list[0]]);
        var create_comment = '';
        if(front) {
          create_comment = '${ref.read(BeforePushedButton.state).state}'
              '${_change_member_index_list[0]}番$_change_position　${_front_member_name_list[_change_member_index_list[1]]}⇒${_front_member_name_list[_change_member_index_list[0]]}';
        }else{
          create_comment = '選手交代\n'
              + '${_change_member_index_list[0]}番$_change_position　${_front_member_name_list[_change_member_index_list[1]]}⇒${_front_member_name_list[_change_member_index_list[0]]}';
        }

        if (ref.read(Comment.state).state == '') {
          ref.read(Comment.state).state = create_comment;
        } else {
          ref.read(Comment.state).state = '${ref.watch(Comment.state).state}\n$create_comment';
        }
      } else {
        _save_data_list.add(_back_member_name_list[_change_member_index_list[0]]);
        _save_data_list.add(_back_member_position_list[_change_member_index_list[0]]);
        _save_data_list.add(_back_member_arm_list[_change_member_index_list[0]]);

        _back_member_name_list[_change_member_index_list[0]] = _back_member_name_list[_change_member_index_list[1]];
        _back_member_position_list[_change_member_index_list[0]] = _back_member_position_list[_change_member_index_list[1]];
        _back_member_arm_list[_change_member_index_list[0]] = _back_member_arm_list[_change_member_index_list[1]];

        _back_member_name_list[_change_member_index_list[1]] = _save_data_list[0];
        _back_member_position_list[_change_member_index_list[1]] = _save_data_list[1];
        _back_member_arm_list[_change_member_index_list[1]] = _save_data_list[2];

        ref.read(BackMemberNameList.state).state = [..._back_member_name_list];
        ref.read(BackMemberPositionList.state).state = [..._back_member_position_list];
        ref.read(BackMemberArmList.state).state = [..._back_member_arm_list];

        var _change_position = ChangePositionName(_back_member_position_list[_change_member_index_list[0]]);
        var create_comment = '';
        if(front){
          create_comment = '選手交代\n'
              '${_change_member_index_list[0]}番$_change_position　${_back_member_name_list[_change_member_index_list[1]]}⇒${_back_member_name_list[_change_member_index_list[0]]}';
        }else{
          create_comment = '${ref.read(BeforePushedButton.state).state}'
              '${_change_member_index_list[0]}番$_change_position　${_back_member_name_list[_change_member_index_list[1]]}⇒${_back_member_name_list[_change_member_index_list[0]]}';
        }

        if (ref.read(Comment.state).state == '') {
          ref.read(Comment.state).state = create_comment;
        } else {
          ref.read(Comment.state).state = ref.watch(Comment.state).state + '\n' + create_comment;
        }
      }
    }



    int _front_pitcher_index = ref.watch(FrontMemberPositionList.state).state.indexOf('投');
    if(_front_pitcher_index == -1) {
      // ref.read(PitcherFront.state).state = 1;
    } else {
      ref.read(PitcherFront.state).state = _front_pitcher_index;
    }



    return Scaffold(
      body: SingleChildScrollView(
        // child: Container(
        // child: Center(
        child: Container(
          color: const Color(0xff000080).withOpacity(1),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 20),
                child: Center(
                  child: Text(
                    '選手交代',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white
                      ),
                      child: const Text(
                        '戻る',
                        // style: TextStyle(
                        //   fontSize: 20
                        // ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        // print(ref.watch(FrontMemberNameList.state).state);
                        ChangeMember();
                        // print(ref.watch(FrontMemberNameList.state).state);
                        // print(_change_member_border_check);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white
                      ),
                      child: const Text(
                        'OK',
                        // style: TextStyle(
                        //   fontSize: 20,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  '入れ替えたい選手をタップしてください',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                ),
              ),
              SizedBox(
                height: 1000,
                // color: Colors.red,
                child: Row(
                  children: [
                    // スタメン
                    Expanded(
                      flex: 4,
                      child: Padding(
                        // padding: const EdgeInsets.only(),
                        padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0,),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 50,
                              // padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                // color: Colors.blue,
                                // color: Colors.black,
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: Colors.white
                                    ),
                                  )
                              ),
                              child: const Text(
                                'スタメン',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  // decoration: TextDecoration.underline
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10.0),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                            // color: Colors.green,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${index+1}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                                          // padding: const EdgeInsets.only(),
                                          child: Container(
                                            // width: 100,
                                            // height: 30,
                                            // color: listItems[index]['color'],
                                            decoration: BoxDecoration(
                                              // color: listItems[index]['color'],
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  //先攻チームと後攻チームでボーダ＾を共有しているので修正する
                                                  //現在の選手と入れ替えるので現在の選手のボーダーを赤で固定したい ←これはしなくてよさそう
                                                  // var _front = ref.watch(Front.state).state;
                                                  // var _change_member_border_check = ref.read(ChangeMemberBroderCheck.state).state;
                                                  // var _len_border_true = _change_member_border_check.where((element) => (element==true)).toList().length;
                                                  // var _pitcher_index = ref.watch(PitcherFront.state).state;
                                                  // var _batter_index = ref.watch(NowBatterFront.state).state;

                                                  // print('スタメン');
                                                  // print(_len_border_true);
                                                  if(_len_border_true < 2){
                                                    if(_change_member_border_check[index+1]) {
                                                      _change_member_border_check[index+1] = false;
                                                      ref.read(ChangeMemberBroderCheck.state).state = [..._change_member_border_check];
                                                      // print(ref.watch(ChangeMemberBroderCheck.state).state);
                                                    } else {
                                                      _change_member_border_check[index+1] = true;
                                                      ref.read(ChangeMemberBroderCheck.state).state = [..._change_member_border_check];
                                                      // print(ref.watch(ChangeMemberBroderCheck.state).state);
                                                    }
                                                  } else if (_len_border_true == 2) {
                                                    if(_change_member_border_check[index+1]) {
                                                      _change_member_border_check[index+1] = false;
                                                      ref.read(ChangeMemberBroderCheck.state).state = [..._change_member_border_check];
                                                      // print(ref.watch(ChangeMemberBroderCheck.state).state);
                                                    }
                                                  } else {
                                                    return;
                                                  }
                                                  // Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  // primary: listItems[index]['color'],
                                                  primary: Colors.grey[300],
                                                  // side: ref.watch(ChangeMemberBorderTrue.state).state,
                                                  side: JudgeChangeMemberBorder(index),
                                                ),
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: ConstrainedBox(
                                                    constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
                                                    child: Text(
                                                      // listItems[index]['name'],
                                                      (front_member) ? ref.watch(FrontMemberNameList.state).state[index+1] : ref.watch(BackMemberNameList.state).state[index+1],
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 5.0),
                                          // padding: const EdgeInsets.only(),
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                // color: listItems[index]['color'],
                                                //   color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  border: Border.all(color: Colors.black),
                                                  color: Colors.white
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: ConstrainedBox(
                                                  constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
                                                  child: Text(
                                                    // listItems[index]['position'],
                                                    (front_member) ? ref.watch(FrontMemberPositionList.state).state[index+1] : ref.watch(BackMemberPositionList.state).state[index+1],
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 控え
                    Expanded(
                      flex: 4,
                      child: Padding(
                        // padding: const EdgeInsets.only(),
                        padding: const EdgeInsets.only(left: 15.0, top: 25.0, right: 15.0, ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 140,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                // color: Colors.blue,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 3,
                                          color: Colors.white
                                      )
                                  )
                              ),
                              child: const Text(
                                '控え',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10.0),
                                itemCount: 16,
                                itemBuilder: (context, index) {
                                  return Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                                          // padding: const EdgeInsets.only(),
                                          child: Container(
                                            // width: 100,
                                            // height: 30,
                                            // color: listItems[index]['color'],
                                            decoration: BoxDecoration(
                                              // color: listItems[index]['color'],
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pop(context);

                                                  // print('控え');
                                                  // print(_len_border_true);
                                                  if(_len_border_true < 2){
                                                    if(_change_member_border_check[index+10]) {
                                                      _change_member_border_check[index+10] = false;
                                                      ref.read(ChangeMemberBroderCheck.state).state = [..._change_member_border_check];
                                                      // print(ref.watch(ChangeMemberBroderCheck.state).state);
                                                    } else {
                                                      _change_member_border_check[index+10] = true;
                                                      ref.read(ChangeMemberBroderCheck.state).state = [..._change_member_border_check];
                                                      // print(ref.watch(ChangeMemberBroderCheck.state).state);
                                                    }
                                                  } else if (_len_border_true == 2) {
                                                    if(_change_member_border_check[index+10]) {
                                                      _change_member_border_check[index+10] = false;
                                                      ref.read(ChangeMemberBroderCheck.state).state = [..._change_member_border_check];
                                                      // print(ref.watch(ChangeMemberBroderCheck.state).state);
                                                    }
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  // primary: listItems[index]['color'],
                                                  primary: Colors.grey[300],
                                                  side: JudgeChangeMemberBorder(index+9),
                                                ),
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: ConstrainedBox(
                                                    constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
                                                    child: Text(
                                                      // listItems[index]['name'],
                                                      // ref.watch(FrontMemberNameList.state).state[index+10],
                                                      (front_member) ? ref.watch(FrontMemberNameList.state).state[index+10] : ref.watch(BackMemberNameList.state).state[index+10],
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 5.0),
                                          // padding: const EdgeInsets.only(),
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                // color: listItems[index]['color'],
                                                //   color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  border: Border.all(color: Colors.black),
                                                  color: Colors.white
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: ConstrainedBox(
                                                  constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
                                                  child: Text(
                                                    // listItems[index]['position'],
                                                    // ref.watch(FrontMemberPositionList.state).state[index+10],
                                                    (front_member) ? ref.watch(FrontMemberPositionList.state).state[index+10] : ref.watch(BackMemberPositionList.state).state[index+10],
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // ),
        // ),
      ),
    );
  }
}



// class MemberChangeDialog extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final member_list = ref.watch(FrontMemberList);
//
//     // return AlertDialog(
//     //   title: const Text('メンバー登録'),
//     //   // content: Text(
//     //   //   '${ref.watch(NowScore)}',
//     //   //   textAlign: TextAlign.center,
//     //   // ),
//     //   // actions: [
//     //   //   Center(
//     //   //     child: Row(
//     //   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//     //   //       children: [
//     //   //         ElevatedButton(
//     //   //           onPressed: () {
//     //   //             ref.read(NowScore.notifier).state --;
//     //   //             All_Score_List.replaceRange(ref.watch(Inning), ref.watch(Inning)+1, ['${ref.watch(NowScore)}']);
//     //   //             // print(ref.watch(AllScore).elementAt(0));
//     //   //             ref.read(AllScore.notifier).state = [...All_Score_List];
//     //   //             splitScoreBoard(All_Score_List);
//     //   //             totalScore();
//     //   //             // print(ref.watch(TeamA));
//     //   //             // print(ref.watch(TeamB));
//     //   //           },
//     //   //           child: const Icon(Icons.remove),
//     //   //         ),
//     //   //         ElevatedButton(
//     //   //           onPressed: () {
//     //   //             ref.read(NowScore.notifier).state ++;
//     //   //             All_Score_List.replaceRange(ref.watch(Inning), ref.watch(Inning)+1, ['${ref.watch(NowScore)}']);
//     //   //             ref.read(AllScore.notifier).state = [...All_Score_List];
//     //   //             // print(ref.watch(AllScore).elementAt(0));
//     //   //             splitScoreBoard(All_Score_List);
//     //   //             totalScore();
//     //   //             // print(ref.watch(TeamA));
//     //   //             // print(ref.watch(TeamB));
//     //   //           },
//     //   //           child: const Icon(Icons.add),
//     //   //         )
//     //   //       ],
//     //   //     ),
//     //   //   ),
//     //   //   Center(
//     //   //     child: Row(
//     //   //       mainAxisAlignment: MainAxisAlignment.center,
//     //   //       children: [
//     //   //         TextButton(
//     //   //           onPressed: () => Navigator.pop(context, 'Cancel'),
//     //   //           child: const Text('戻る'),
//     //   //         ),
//     //   //         TextButton(
//     //   //           onPressed: () => Navigator.pop(context, 'OK'),
//     //   //           child: const Text('OK'),
//     //   //         ),
//     //   //       ],
//     //   //     ),
//     //   //   )
//     //   // ],
//     // );
//   }
//
// }
