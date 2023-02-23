// import 'dart:ffi';
// import 'dart:html';

import 'package:baseballboy_ver2/Inputter.dart';
import 'package:baseballboy_ver2/ButtonWidget.dart';
import 'package:baseballboy_ver2/Viewer.dart';
import 'package:baseballboy_ver2/Questionnaire.dart';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/foundation.dart';

// --------------------------------------------------------
//修正前
// final nowTurnScore = StateProvider((ref) => 0);
// final Team1 = StateProvider((ref) => []..length = 9);
// final Team2 = StateProvider((ref) => []..length = 9);
// final nowTable = StateProvider((ref) => [[1][1]]);
// --------------------------------------------------------

final Inning = StateProvider<int>((ref) => 0);
final Front = StateProvider<bool>((ref) => true);
final AllScore = StateProvider((ref) => List.filled(18, '　', growable: true));
final TeamA = StateProvider((ref) => List.filled(9, '　', growable: true));
final TeamATotallScore = StateProvider((ref) => 0);
final TeamB = StateProvider((ref) => List.filled(9, '　', growable: true));
final TeamBTotallScore = StateProvider((ref) => 0);
final NowScore = StateProvider((ref) => 0);

final TeamNameA = StateProvider((ref) => 'チームA');
final TeamNameB = StateProvider((ref) => 'チームB');

final NowBatterFront = StateProvider((ref) => 1);
final NowBatterBack = StateProvider((ref) => 1);
final PitcherFront = StateProvider((ref) => 1);
// final PitcherBack = StateProvider((ref) => 1);

final ToggleList = StateProvider((ref) => [false, false, false, false, false, false, false, false, false]);
final ChangeOpacity = StateProvider((ref) => 0.5);
final OpacityList = StateProvider((ref) => List.filled(9, 0.5));
final OpacityListArms = StateProvider((ref) => List.filled(3, 0.5));

final FrontMemberList = StateProvider((ref) => List.filled(26,[]));
final FrontMemberNameList = StateProvider((ref) => List.filled(26, ''));
final FrontMemberPositionList = StateProvider((ref) => List.filled(26, ''));
final FrontMemberArmList = StateProvider((ref) => List.filled(26, ''));

final BackMemberList = StateProvider((ref) => List.filled(26,[]));
final BackMemberNameList = StateProvider((ref) => List.filled(26, ''));
final BackMemberPositionList = StateProvider((ref) => List.filled(26, ''));
final BackMemberArmList = StateProvider((ref) => List.filled(26, ''));

final CountBallOpacityList = StateProvider((ref) => List.filled(3, 0.3));
final CountStrikeOpacityList = StateProvider((ref) => List.filled(2, 0.3));
final CountOutOpacityList = StateProvider((ref) => List.filled(2, 0.3));
final Count = StateProvider((ref) => {'B':0, 'S':0, 'O':0});

final RunnerOpacityList = StateProvider((ref) => List.filled(3, 0.3));
final Runner = StateProvider((ref) => {'1塁':false, '2塁':false, '3塁':false});

final ButtonVisibleList = StateProvider((ref) => {
  'default' : true,
  '四球' : false,
  '三振' : false,
  '盗塁' : false,
  'バント' : false,
  'デッドボール' : false,
  'その他' : false,
  'チェンジ' : false,
  '打った' : false,
  '三振_空振りと見逃し' : false,
  '三振_空振りと見逃し_振り逃げ' : false,
  '盗塁_アウト' : false,
  'バント_打球先' : false,
  'バント_打球先_送球先' : false,
  // 'バント_次の送球' : false,
  'バント_次の打者': false,
  // 'バント_アウトとセーフ' : false,
  'その他_パスワイルド': false,
  '打った_打球先': false,
  '打った_次の打者': false,
  '打った_ランナー有り': false,
  '打った_ランナー有り_送球あり': false,
  '打った_ランナー有り_タッチアップ': false,
  '打った_次の打者_チェンジ': false,
  '打った_ヒット_内野': false,
  '打った_ヒット_外野': false,
  '打った_ヒット_外野_次': false,
  '打った_ゴロ': false,
  '打った_ゴロ_送球先': false,
});

final ButtonVisibleThrowingBallList = StateProvider((ref) => List.filled(4, 0.5));

final ChangeMemberBroderCheck = StateProvider((ref) => List.filled(26, false));
final ChangeMemberBorderTrue = StateProvider((ref) => BorderSide( width: 3, color: Colors.red,));
final ChangeMemberBorderFalse = StateProvider((ref) => BorderSide());

// final CommentLineList = StateProvider((ref) => List.filled(1, '', growable: true));
final Comment = StateProvider((ref) => '');
final BeforePushedButton = StateProvider((ref) => 'default');

final selectedValueMatchFormat = StateProvider((ref) => '未設定');
final selectedValueCategory = StateProvider((ref) => '未設定');
final selectedValueMatchPlace = StateProvider((ref) => '未設定');
final selectedValueSex = StateProvider((ref) => '未設定');
final selectedValueAge = StateProvider((ref) => '未設定');
final selectedValueParticipants = StateProvider((ref) => '未設定');

final gameName = StateProvider((ref) => '');
final url = StateProvider((ref) => '');
final userRole = StateProvider((ref) => 'Viewer');


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.read(FrontMemberNameList.state).state[0] = '名前';
    ref.read(FrontMemberPositionList.state).state[0] = 'ポジション';

    ref.read(BackMemberNameList.state).state[0] = '名前';
    ref.read(BackMemberPositionList.state).state[0] = 'ポジション';


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'baseball score board',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Top()
    );
  }
}


class Top extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context, WidgetRef ref) {

    checkUrl(value) {
      final url_correct = 'zenny.jp/Baseball-Kids/';
      var url_paramete = '';

      List<dynamic> url_list = [];
      int count_slash = 0;


      if ((value.contains(url_correct)) && (value?.indexOf(url_correct) == 0)) {
        url_paramete = value.split(url_correct)[1];

        if (url_paramete.contains('/')) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            url_paramete = value.split(url_correct)[1];
            ref.read(userRole.state).state = url_paramete.split('/')[0];
            ref.read(gameName.state).state = url_paramete.split('/')[1];
          });
        };
      } else {
        return '正しいURLを入力してください';
      };
    };

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'images/yakyukozo_logo.png',
            height: 50,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: const Color(0xff000080).withOpacity(1),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 150),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'URLやパスワードをコピーしたものを貼り付けてください',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30 ,left: 30, right: 30),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.all(10),
                    //     border: OutlineInputBorder(),
                    //     fillColor: Colors.white,
                    //     filled: true,
                    //   ),
                    //   onChanged: (value) {
                    //     var value_split;
                    //     var list_length;
                    //
                    //     value_split = value.split('/');
                    //     list_length = value_split.length;
                    //     value_split = value_split.getRange(list_length-3 , list_length).toList();
                    //     ref.read(gameName.state).state = value_split[2];
                    //
                    //     value_split = value_split.getRange(list_length-3 , list_length-1).toList();
                    //     ref.read(urlCheckList.state).state = value_split;
                    //   },
                    // ),
                    child: TextFormField(
                      // controller: TextEditingController(text: ref.watch(url)),
                      decoration: InputDecoration(
                          labelText: "URL",
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                          )
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        final url_correct = 'zenny.jp/Baseball-Kids/';
                        var url_paramete = '';

                        if (value == null || value.isEmpty) {
                          return '正しいURLを入力してください';
                        } else {
                          return checkUrl(value);
                          // ref.read(url.state).state = value;
                          // if ((value.contains(url_correct)) && (value?.indexOf(url_correct) == 0)) {
                          //   WidgetsBinding.instance.addPostFrameCallback((_) {
                          //     url_paramete = value.split(url_correct)[1];
                          //     ref.read(userRole.state).state = url_paramete.split('/')[0];
                          //     ref.read(gameName.state).state = url_paramete.split('/')[1];
                          //   });
                          // } else {
                          //   return '正しいURLを入力してください';
                          // }
                        };
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var game_name = ref.watch(gameName);

                          var check = await FirebaseFirestore.instance.collection(game_name).doc("checkData").get();
                          if (!check.exists) {
                            FirebaseFirestore.instance.collection(game_name).doc('TeamA').set({
                                'attack_or_defense' : '打者',
                                'display_member' : '',
                                'member_arm' : List.filled(26, ''),
                                'member_name' : List.filled(26, ''),
                                'member_position' : List.filled(26, ''),
                                'score' : List.filled(9, ''),
                                'team_name' : 'チームA',
                                'total_score' : 0,
                              });
                              FirebaseFirestore.instance.collection(game_name).doc('TeamB').set({
                                'attack_or_defense' : '投手',
                                'display_member' : '',
                                'member_arm' : List.filled(26, ''),
                                'member_name' : List.filled(26, ''),
                                'member_position' : List.filled(26, ''),
                                'score' : List.filled(9, ''),
                                'team_name' : 'チームB',
                                'total_score' : 0,
                              });
                              FirebaseFirestore.instance.collection(game_name).doc('board').set({
                                'count_ball' : [0.3, 0.3, 0.3],
                                'count_out' : [0.3, 0.3],
                                'count_strike' : [0.3, 0.3],
                                'inning' : '1回表',
                                'runner' : [0.3, 0.3, 0.3],
                              });
                              FirebaseFirestore.instance.collection(game_name).doc('comment').set({
                                'content' : '',
                              });
                              FirebaseFirestore.instance.collection(game_name).doc('checkData').set({
                                'check' : 'これはこのゲームの最初のデータ追加です',
                              });
                          } else {
                            print('存在します');
                          };

                          if (ref.watch(userRole.state).state == 'Inputter') {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InputterQuestionnaier()),
                            );
                          } else if (ref.watch(userRole.state).state == 'Viewer') {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewerQuestionnaier()),
                            );
                          } else {
                            // return 'もう一度URLを入力してください';
                          };
                        }
                      },
                      child: const Text('送信する'),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}


class Home extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('野球小僧'),
        title: Center(
          child: Image.asset(
              'images/yakyukozo_logo.png',
              height: 50,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: const Color(0xff000080).withOpacity(1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'どちらのページに行きますか？',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InputterConfirm()),
                        );
                      },
                      child: const Text('入力者'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewerQuestionnaier()),
                        );
                      },
                      child: const Text('閲覧者'),
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


// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   // メッセージ表示用
//   String infoText = '';
//   // 入力したメールアドレス・パスワード
//   String email = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('野球小僧'),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           // color: Color(0xff000080).withOpacity(1),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // メールアドレス入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'ID'),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               // パスワード入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'パスワード'),
//                 obscureText: true,
//                 onChanged: (String value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: Text(infoText),
//               ),
//               // Container(
//               //   width: double.infinity,
//               //   // ユーザー登録ボタン
//               //   child: ElevatedButton(
//               //     child: Text('ユーザー登録'),
//               //     onPressed: () async {
//               //       try {
//               //         // メール/パスワードでユーザー登録
//               //         final FirebaseAuth auth = FirebaseAuth.instance;
//               //         await auth.createUserWithEmailAndPassword(
//               //           email: email,
//               //           password: password,
//               //         );
//               //         // ユーザー登録に成功した場合
//               //         // チャット画面に遷移＋ログイン画面を破棄
//               //         await Navigator.of(context).pushReplacement(
//               //           MaterialPageRoute(builder: (context) {
//               //             return InputterPage();
//               //           }),
//               //         );
//               //       } catch (e) {
//               //         // ユーザー登録に失敗した場合
//               //         setState(() {
//               //           infoText = "登録に失敗しました：${e.toString()}";
//               //         });
//               //       }
//               //     },
//               //   ),
//               // ),
//               const SizedBox(height: 8),
//               Container(
//                 width: double.infinity,
//                 // ログイン登録ボタン
//                 child: OutlinedButton(
//                   child: Text('ログイン'),
//                   onPressed: () async {
//                     try {
//                       // メール/パスワードでログイン
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       await auth.signInWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       // ログインに成功した場合
//                       // チャット画面に遷移＋ログイン画面を破棄
//                       await Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) {
//                           return InputterPage();
//                         }),
//                       );
//                     } catch (e) {
//                       // ログインに失敗した場合
//                       setState(() {
//                         infoText = "ログインに失敗しました：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
