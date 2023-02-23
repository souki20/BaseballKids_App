import 'package:baseballboy_ver2/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetMemberPage extends ConsumerWidget {
  SetMemberPage(this.front_set_member,  {Key? key}) : super(key: key);


  final valueController = TextEditingController();
  final bool front_set_member;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var toggle_list = ref.read(ToggleList.notifier).state;
    final change_opacity = ref.watch(ChangeOpacity);

    if(front_set_member) {
      return Scaffold(
          body: SingleChildScrollView(
              child: Container(
                color: const Color(0xff000080).withOpacity(1),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 50.0, right: 0, bottom: 50),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //テキスト
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.black)
                            ),
                            child: const Text(
                              '先攻',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          //ボタン
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  child: const Text('戻る'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection('game1').doc('TeamA').update({
                                      'member_name' : ref.watch(FrontMemberNameList.state).state,
                                      'member_position' : ref.watch(FrontMemberPositionList.state).state,
                                      'member_arm' : ref.watch(FrontMemberArmList.state).state,
                                    });

                                    Navigator.pop(context, 'OK');
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                          //リスト
                          Column(
                            children: [
                              Padding(
                                // padding: const EdgeInsets.only(left: 10.0, top: 100.0, right: 10.0),
                                padding: const EdgeInsets.only(left: 0, top: 20.0, right: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      '先発',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 20,
                                      ),
                                    ),
                                    ListView.builder(
                                      // scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 0),
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              //打順
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  // width: 15,
                                                  // width:double.infinity,
                                                  // height: 20,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: (index == 0) ? const Text('打順') : Text("$index"),
                                                  ),
                                                ),
                                              ),
                                              //名前
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return SetMemberDialog(index,front_set_member);
                                                          }
                                                      );
                                                    },
                                                    // child: (index == 0) ? const Text('名前') : Text(ref.watch(FrontMemberNameList.state).state[index]),
                                                    child: Text(ref.read(FrontMemberNameList.state).state[index]),
                                                    // child: StreamBuilder<DocumentSnapshot>(
                                                    //     stream: FirebaseFirestore.instance.collection('game1').doc('TeamA').snapshots(),
                                                    //     builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                                    //       if (snapshot.hasData) {
                                                    //         return Text(
                                                    //           snapshot.data!['member_name'][index],
                                                    //           textAlign: TextAlign.center,
                                                    //           style: const TextStyle(
                                                    //             color: Colors.black,
                                                    //           ),
                                                    //         );
                                                    //       } else {
                                                    //         return Container();
                                                    //       }
                                                    //     }
                                                    // ),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberNameList.state).state[index]) : Text(ref.read(BackMemberNameList.state).state[index]),
                                                  ),
                                                ),
                                              ),
                                              //ポジション
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  // width: 15,
                                                  // width:double.infinity,
                                                  // height: 20,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    // child: (index == 0) ? const Text('ポジション') : Text(ref.watch(FrontMemberPositionList.state).state[index]),
                                                    child: Text(ref.watch(FrontMemberPositionList.state).state[index]),
                                                    // child: StreamBuilder<DocumentSnapshot>(
                                                    //     stream: FirebaseFirestore.instance.collection('game1').doc('TeamA').snapshots(),
                                                    //     builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                                    //       if (snapshot.hasData) {
                                                    //         return Text(
                                                    //           snapshot.data!['member_position'][index],
                                                    //           textAlign: TextAlign.center,
                                                    //           style: const TextStyle(
                                                    //             color: Colors.black,
                                                    //           ),
                                                    //         );
                                                    //       } else {
                                                    //         return Container();
                                                    //       }
                                                    //     }
                                                    // ),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberPositionList.state).state[index]) : Text(ref.read(BackMemberPositionList.state).state[index]),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                // padding: const EdgeInsets.only(left: 10.0, top: 100.0, right: 10.0),
                                padding: const EdgeInsets.only(left: 0, top: 20.0, right: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      '控え',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 20,
                                      ),
                                    ),
                                    ListView.builder(
                                      // scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 0),
                                        itemCount: 16,
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
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    // child: (index == 0) ? const Text('打順') : Text("${index+9}"),
                                                    child: Text('${index+10}'),
                                                  ),
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
                                                  child: TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return SetMemberDialog(index+10,front_set_member);
                                                          }
                                                      );
                                                    },
                                                    // child: (index == 0) ? const Text('名前') : Text(ref.watch(FrontMemberNameList.state).state[index]),
                                                    child: Text(ref.read(FrontMemberNameList.state).state[index+10]),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberNameList.state).state[index+10]) : Text(ref.read(BackMemberNameList.state).state[index+10]),
                                                  ),
                                                ),
                                              ),
                                              //ポジション
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(ref.watch(FrontMemberPositionList.state).state[index+10]),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberPositionList.state).state[index+10]) : Text(ref.read(BackMemberPositionList.state).state[index+10]),
                                                  ),
                                                ),
                                              )
                                              // //ポジション
                                              // Expanded(
                                              //   flex: 4,
                                              //   child: Container(
                                              //     height: 35,
                                              //     decoration: BoxDecoration(
                                              //       border: Border.all(color: Colors.black),
                                              //     ),
                                              //     child: TextButton(
                                              //       onPressed: () {},
                                              //       child: (index == 0) ? const Text('ポジション') : Text('position'),
                                              //     ),
                                              //   ),
                                              // ),
                                              // //名前
                                              // Expanded(
                                              //   flex: 4,
                                              //   child: Container(
                                              //     // width: 15,
                                              //     // width:double.infinity,
                                              //     // height: 20,
                                              //     height: 35,
                                              //     decoration: BoxDecoration(
                                              //       border: Border.all(color: Colors.black),
                                              //     ),
                                              //     child: TextButton(
                                              //       onPressed: () {},
                                              //       child: (index == 0) ? const Text('名前') : Text('name'),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          );
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          )
      );
    } else {
      return Scaffold(
          body: SingleChildScrollView(
              child: Container(
                color: const Color(0xff000080).withOpacity(1),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 100.0, right: 0, bottom: 50),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.black)
                            ),
                            padding: const EdgeInsets.only(bottom: 20),
                            child: const Text(
                              '後攻',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
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
                                  child: const Text('戻る'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection('game1').doc('TeamB').update({
                                      'member_name' : ref.watch(BackMemberNameList.state).state,
                                      'member_position' : ref.watch(BackMemberPositionList.state).state,
                                      'member_arm' : ref.watch(BackMemberArmList.state).state,
                                    });
                                    Navigator.pop(context, 'OK');
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                // padding: const EdgeInsets.only(left: 10.0, top: 100.0, right: 10.0),
                                padding: const EdgeInsets.only(left: 0, top: 20.0, right: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      '先発',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 20,
                                      ),
                                    ),
                                    ListView.builder(
                                      // scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 0),
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              //打順
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  // width: 15,
                                                  // width:double.infinity,
                                                  // height: 20,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: (index == 0) ? const Text('打順') : Text("$index"),
                                                  ),
                                                ),
                                              ),
                                              //名前
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return SetMemberDialog(index,front_set_member);
                                                          }
                                                      );
                                                    },
                                                    // child: (index == 0) ? const Text('名前') : Text(ref.watch(FrontMemberNameList.state).state[index]),
                                                    child: Text(ref.read(BackMemberNameList.state).state[index]),
                                                    // child: StreamBuilder<DocumentSnapshot>(
                                                    //     stream: FirebaseFirestore.instance.collection('game1').doc('TeamB').snapshots(),
                                                    //     builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                                    //       if (snapshot.hasData) {
                                                    //         return Text(
                                                    //           snapshot.data!['member_name'][index],
                                                    //           textAlign: TextAlign.center,
                                                    //           style: const TextStyle(
                                                    //             color: Colors.black,
                                                    //           ),
                                                    //         );
                                                    //       } else {
                                                    //         return Container();
                                                    //       }
                                                    //     }
                                                    // ),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberNameList.state).state[index]) : Text(ref.read(BackMemberNameList.state).state[index]),
                                                  ),
                                                ),
                                              ),
                                              //ポジション
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  // width: 15,
                                                  // width:double.infinity,
                                                  // height: 20,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    // child: (index == 0) ? const Text('ポジション') : Text(ref.watch(FrontMemberPositionList.state).state[index]),
                                                    child: Text(ref.watch(BackMemberPositionList.state).state[index]),
                                                    // child: StreamBuilder<DocumentSnapshot>(
                                                    //     stream: FirebaseFirestore.instance.collection('game1').doc('TeamB').snapshots(),
                                                    //     builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                                    //       if (snapshot.hasData) {
                                                    //         return Text(
                                                    //           snapshot.data!['member_position'][index],
                                                    //           textAlign: TextAlign.center,
                                                    //           style: const TextStyle(
                                                    //             color: Colors.black,
                                                    //           ),
                                                    //         );
                                                    //       } else {
                                                    //         return Container();
                                                    //       }
                                                    //     }
                                                    // ),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberPositionList.state).state[index]) : Text(ref.read(BackMemberPositionList.state).state[index]),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                // padding: const EdgeInsets.only(left: 10.0, top: 100.0, right: 10.0),
                                padding: const EdgeInsets.only(left: 0, top: 20.0, right: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      '控え',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 20,
                                      ),
                                    ),
                                    ListView.builder(
                                      // scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 0),
                                        itemCount: 16,
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
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    // child: (index == 0) ? const Text('打順') : Text("${index+9}"),
                                                    child: Text('${index+10}'),
                                                  ),
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
                                                  child: TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return SetMemberDialog(index+10,front_set_member);
                                                          }
                                                      );
                                                    },
                                                    // child: (index == 0) ? const Text('名前') : Text(ref.watch(FrontMemberNameList.state).state[index]),
                                                    child: Text(ref.read(BackMemberNameList.state).state[index+10]),
                                                    // child: (front_set_member) ? Text(ref.read(BackMemberPositionList.state).state[index+10]) : Text(ref.read(BackMemberNameList.state).state[index+10]),
                                                  ),
                                                ),
                                              ),
                                              //ポジション
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    color: Colors.white,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(ref.watch(BackMemberPositionList.state).state[index+10]),
                                                    // child: (front_set_member) ? Text(ref.read(FrontMemberPositionList.state).state[index+10]) : Text(ref.read(BackMemberPositionList.state).state[index+10]),
                                                  ),
                                                ),
                                              )
                                              // //ポジション
                                              // Expanded(
                                              //   flex: 4,
                                              //   child: Container(
                                              //     height: 35,
                                              //     decoration: BoxDecoration(
                                              //       border: Border.all(color: Colors.black),
                                              //     ),
                                              //     child: TextButton(
                                              //       onPressed: () {},
                                              //       child: (index == 0) ? const Text('ポジション') : Text('position'),
                                              //     ),
                                              //   ),
                                              // ),
                                              // //名前
                                              // Expanded(
                                              //   flex: 4,
                                              //   child: Container(
                                              //     // width: 15,
                                              //     // width:double.infinity,
                                              //     // height: 20,
                                              //     height: 35,
                                              //     decoration: BoxDecoration(
                                              //       border: Border.all(color: Colors.black),
                                              //     ),
                                              //     child: TextButton(
                                              //       onPressed: () {},
                                              //       child: (index == 0) ? const Text('名前') : Text('name'),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          );
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          )
      );
    }
  }
}


class SetMemberDialog extends ConsumerWidget {

  SetMemberDialog(this.index, this.front_set_member, {Key? key}) : super(key: key);

  final valueController = TextEditingController();
  final int index;
  final bool front_set_member;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var change_opacity = ref.watch(ChangeOpacity.state).state;
    final toggle_list = ref.watch(ToggleList.state).state;
    final opacity_list = ref.watch(OpacityList.state).state;
    final opacity_list_arms = ref.watch(OpacityListArms.state).state;

    final front_member_list = ref.read(FrontMemberList.state).state;
    final front_member_name_list = ref.read(FrontMemberNameList.state).state;
    final front_member_position_list = ref.read(FrontMemberPositionList.state).state;
    final front_member_arm_list = ref.read(FrontMemberArmList.state).state;

    final back_member_list = ref.read(BackMemberList.state).state;
    final back_member_name_list = ref.read(BackMemberNameList.state).state;
    final back_member_position_list = ref.read(BackMemberPositionList.state).state;
    final back_member_arm_list = ref.read(BackMemberArmList.state).state;

    final position_contents_list = ['投', '捕', '一', '二', '三', '遊', '右', '中', '左'];
    final arm_contents_list = ['左', '右', '両'];


    if (front_set_member) {
      var member_list = [];
      var position = '';
      var arm = '';
      return AlertDialog(
        title: const Text('メンバーを登録'),
        content: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        const Text('名前を入力'),
                        /*選手名*/
                        TextField(
                          controller: valueController,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('ポジションを選択',),
                        ),
                        /*ポジション*/
                        Center(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Opacity(
                                          opacity: opacity_list[0],
                                          child: ElevatedButton(
                                              onPressed: () {
                                                ref.refresh(OpacityList);
                                                ref.read(OpacityList.notifier).state[0] = 1.0;
                                                // _toggle_list[0] = true;
                                                // ref.refresh(ToggleList);
                                                // print(ref.read(ToggleList.state).state);
                                                // toggle_list = [true, false, false, false, false, false, false, false, false];
                                                // ref.watch(ToggleList.state).state = [...toggle_list];
                                                // print(ref.read(ToggleList.notifier).state);
                                                // ref.read(ChangeOpacity.state).update((state) => 1.0);
                                              },
                                              // style: ButtonStyle(
                                              //   // backgroundColor: ButtonBackgroundColor(Colors.red),
                                              // ),
                                              style: ElevatedButton.styleFrom(
                                                // primary: (ref.watch(ToggleList.notifier).state[0] == true) ? Colors.red : Colors.red.withOpacity(0.3),
                                                primary: Colors.red,
                                                onPrimary: Colors.white,
                                              ),
                                              child: Text(
                                                position_contents_list[0],
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              )
                                          ),
                                        ),
                                        Opacity(
                                          opacity: opacity_list[1],
                                          child: ElevatedButton(
                                              onPressed: () {
                                                ref.refresh(OpacityList);
                                                ref.read(OpacityList.notifier).state[1] = 1.0;
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.blue,
                                                onPrimary: Colors.white,
                                              ),
                                              child: Text(
                                                position_contents_list[1],
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[2],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[2] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[2],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: opacity_list[3],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[3] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[3],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[4],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[4] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[4],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: opacity_list[5],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[5] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[5],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),                                                                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[6],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[6] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[6],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: opacity_list[7],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[7] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[7],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[8],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[8] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[8],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.0,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('')
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),                                                                                  ),
                                ],
                              ),
                              //ポジションのイメージ画像
                              // Container(),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('利き手を選択',),
                        ),
                        /*利き手*/
                        Center(
                          child: Row(
                            children: [
                              Opacity(
                                opacity: opacity_list_arms[0],
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(OpacityListArms);
                                      ref.read(OpacityListArms.notifier).state[0] = 1.0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.lightBlue[200],
                                      onPrimary: Colors.blue[800],
                                    ),
                                    child: Text(
                                      arm_contents_list[0],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                ),
                              ),
                              Opacity(
                                opacity: opacity_list_arms[1],
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(OpacityListArms);
                                      ref.read(OpacityListArms.notifier).state[1] = 1.0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.amberAccent,
                                      onPrimary: Colors.yellow[800],
                                    ),
                                    child: Text(
                                      arm_contents_list[1],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                ),
                              ),
                              Opacity(
                                opacity: opacity_list_arms[2],
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(OpacityListArms);
                                      ref.read(OpacityListArms.notifier).state[2] = 1.0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.lightGreen[200],
                                      onPrimary: Colors.green[800],
                                    ),
                                    child: Text(
                                      arm_contents_list[2],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*button*/
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
                                  position = position_contents_list[opacity_list.indexOf(1.0)];
                                  arm = arm_contents_list[opacity_list_arms.indexOf(1.0)];

                                  front_member_name_list[index] = valueController.text;
                                  front_member_position_list[index] = position;
                                  front_member_arm_list[index] = arm;

                                  member_list.add(valueController.text);
                                  member_list.add(position);
                                  member_list.add(arm);

                                  ref.watch(FrontMemberList.state).state[index] = [...member_list];

                                  ref.watch(FrontMemberNameList.state).state = [...front_member_name_list];
                                  ref.watch(FrontMemberPositionList.state).state = [...front_member_position_list];
                                  ref.watch(FrontMemberArmList.state).state = [...front_member_arm_list];

                                  ref.refresh(OpacityList);
                                  ref.refresh(OpacityListArms);
                                  Navigator.pop(context, 'OK');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      var member_list = [];
      var position = '';
      var arm = '';
      return AlertDialog(
        title: const Text('メンバーを登録'),
        content: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        const Text('名前を入力'),
                        /*選手名*/
                        TextField(
                          controller: valueController,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('ポジションを選択',),
                        ),
                        /*ポジション*/
                        Center(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Opacity(
                                          opacity: opacity_list[0],
                                          child: ElevatedButton(
                                              onPressed: () {
                                                ref.refresh(OpacityList);
                                                ref.read(OpacityList.notifier).state[0] = 1.0;
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                onPrimary: Colors.white,
                                              ),
                                              child: Text(
                                                position_contents_list[0],
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              )
                                          ),
                                        ),
                                        Opacity(
                                          opacity: opacity_list[1],
                                          child: ElevatedButton(
                                              onPressed: () {
                                                ref.refresh(OpacityList);
                                                ref.read(OpacityList.notifier).state[1] = 1.0;
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.blue,
                                                onPrimary: Colors.white,
                                              ),
                                              child: Text(
                                                position_contents_list[1],
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              )
                                          ),
                                        ),
                                        // ElevatedButton(
                                        //     onPressed: () {},
                                        //     style: ElevatedButton.styleFrom(
                                        //       primary: Colors.blue.withOpacity(0.3),
                                        //       onPrimary: Colors.white,
                                        //     ),
                                        //     child: const Text(
                                        //       '捕',
                                        //       style: TextStyle(fontWeight: FontWeight.bold),
                                        //     )
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[2],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[2] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[2],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: opacity_list[3],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[3] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[3],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[4],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[4] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[4],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: opacity_list[5],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[5] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow[800],
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[5],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),                                                                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[6],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[6] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[6],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: opacity_list[7],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[7] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[7],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Opacity(
                                              opacity: opacity_list[8],
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref.refresh(OpacityList);
                                                    ref.read(OpacityList.notifier).state[8] = 1.0;
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: Text(
                                                    position_contents_list[8],
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.0,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('')
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),                                                                                  ),
                                ],
                              ),
                              //ポジションのイメージ画像
                              // Container(),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('利き手を選択',),
                        ),
                        /*利き手*/
                        Center(
                          child: Row(
                            children: [
                              Opacity(
                                opacity: opacity_list_arms[0],
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(OpacityListArms);
                                      ref.read(OpacityListArms.notifier).state[0] = 1.0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.lightBlue[200],
                                      onPrimary: Colors.blue[800],
                                    ),
                                    child: Text(
                                      arm_contents_list[0],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                ),
                              ),
                              Opacity(
                                opacity: opacity_list_arms[1],
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(OpacityListArms);
                                      ref.read(OpacityListArms.notifier).state[1] = 1.0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.amberAccent,
                                      onPrimary: Colors.yellow[800],
                                    ),
                                    child: Text(
                                      arm_contents_list[1],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                ),
                              ),
                              Opacity(
                                opacity: opacity_list_arms[2],
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(OpacityListArms);
                                      ref.read(OpacityListArms.notifier).state[2] = 1.0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.lightGreen[200],
                                      onPrimary: Colors.green[800],
                                    ),
                                    child: Text(
                                      arm_contents_list[2],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*button*/
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
                                  position = position_contents_list[opacity_list.indexOf(1.0)];
                                  arm = arm_contents_list[opacity_list_arms.indexOf(1.0)];

                                  back_member_name_list[index] = valueController.text;
                                  back_member_position_list[index] = position;
                                  back_member_arm_list[index] = arm;

                                  member_list.add(valueController.text);
                                  member_list.add(position);
                                  member_list.add(arm);

                                  ref.watch(BackMemberList.state).state[index] = [...member_list];

                                  ref.watch(BackMemberNameList.state).state = [...back_member_name_list];
                                  ref.watch(BackMemberPositionList.state).state = [...back_member_position_list];
                                  ref.watch(BackMemberArmList.state).state = [...back_member_arm_list];

                                  ref.refresh(OpacityList);
                                  ref.refresh(OpacityListArms);
                                  Navigator.pop(context, 'OK');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

}
