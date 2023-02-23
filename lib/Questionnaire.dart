import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseballboy_ver2/Inputter.dart';
import 'package:baseballboy_ver2/Viewer.dart';
import 'package:baseballboy_ver2/main.dart';


class InputterQuestionnaier extends ConsumerWidget {
  final matchFormat = [
    "未設定",
    "練習試合",
    "公式戦",
  ];
  final category = [
    "未設定",
    "少年野球",
    "中学野球",
    "高校野球",
    "大学野球",
    "社会人野球",
    "草野球など",
  ];
  final matchPlace = [
    "未設定",
    "北海道",
    "青森県",
    "岩手県",
    "宮城県",
    "秋田県",
    "山形県",
    "福島県",
    "茨城県",
    "栃木県",
    "群馬県",
    "埼玉県",
    "千葉県",
    "東京都",
    "神奈川県",
    "新潟県",
    "富山県",
    "石川県",
    "福井県",
    "山梨県",
    "長野県",
    "岐阜県",
    "静岡県",
    "愛知県",
    "三重県",
    "滋賀県",
    "京都府",
    "大阪府",
    "兵庫県",
    "奈良県",
    "和歌山県",
    "鳥取県",
    "島根県",
    "岡山県",
    "広島県",
    "山口県",
    "徳島県",
    "香川県",
    "愛媛県",
    "高知県",
    "福岡県",
    "佐賀県",
    "長崎県",
    "熊本県",
    "大分県",
    "宮崎県",
    "鹿児島県",
    "沖縄県"
  ];

  final sex = [
    "未設定",
    "男性",
    "女性"
  ];

  final age = [
    "未設定",
    "10代",
    "20代",
    "30代",
    "40代",
    "50代",
    "60代",
    "70代以上",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var selectedValue_matchFormat = ref.watch(selectedValueMatchFormat.state).state;
    var selectedValue_category = ref.watch(selectedValueCategory.state).state;
    var selectedValue_matchPlace = ref.watch(selectedValueMatchPlace.state).state;
    var selectedValue_sex = ref.watch(selectedValueSex.state).state;
    var selectedValue_age = ref.watch(selectedValueAge.state).state;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('野球小僧'),
        title: Image.asset(
          'images/yakyukozo_logo.png',
          height: 50,
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
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '試合形式',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton(
                      // hint: const Text(
                      //   "試合形式",
                      //   style: TextStyle(
                      //     color: Colors.white
                      //   ),
                      // ),
                      // isExpanded: true,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        dropdownColor: Colors.green,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        value: selectedValue_matchFormat,
                        //   value: ref.watch(selectedValueMatchFormat.state).state,
                        items: matchFormat.map((list) => DropdownMenuItem(
                            value: list,
                            child: Text(list)
                        )).toList(),
                        onChanged: (value) {
                          // selectedValue_matchFormat = value!;
                          ref.read(selectedValueMatchFormat.notifier).state = value!;
                          // print(value);
                        }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'カテゴリー',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton(
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        dropdownColor: Colors.green,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        value: selectedValue_category,
                        items: category.map((list) => DropdownMenuItem(
                            value: list,
                            child: Text(list)
                        )).toList(),
                        onChanged: (value) {
                          ref.read(selectedValueCategory.notifier).state = value!;
                          // print(value);
                        }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '試合会場',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton(
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        dropdownColor: Colors.green,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        value: selectedValue_matchPlace,
                        items: matchPlace.map((list) => DropdownMenuItem(
                            value: list,
                            child: Text(list)
                        )).toList(),
                        onChanged: (value) {
                          ref.read(selectedValueMatchPlace.notifier).state = value!;
                          // print(value);
                        }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '入力者の性別',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton(
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        dropdownColor: Colors.green,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        value: selectedValue_sex,
                        items: sex.map((list) => DropdownMenuItem(
                            value: list,
                            child: Text(list)
                        )).toList(),
                        onChanged: (value) {
                          ref.read(selectedValueSex.notifier).state = value!;
                          // print(value);
                        }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '入力者の年齢',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton(
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        dropdownColor: Colors.green,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        value: selectedValue_age,
                        items: age.map((list) => DropdownMenuItem(
                            value: list,
                            child: Text(list)
                        )).toList(),
                        onChanged: (value) {
                          ref.read(selectedValueAge.notifier).state = value!;
                          // print(value);
                        }
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      onPressed: () async {
                        FirebaseFirestore.instance.collection('Inputter').add({
                          '試合形式' : ref.watch(selectedValueMatchFormat.state).state,
                          'カテゴリー' : ref.watch(selectedValueCategory.state).state,
                          '試合会場' : ref.watch(selectedValueMatchPlace.state).state,
                          '入力者の性別' : ref.watch(selectedValueSex.state).state,
                          '入力者の年齢' : ref.watch(selectedValueAge.state).state,
                        });

                        ref.refresh(selectedValueMatchFormat);
                        ref.refresh(selectedValueCategory);
                        ref.refresh(selectedValueMatchPlace);
                        ref.refresh(selectedValueSex);
                        ref.refresh(selectedValueAge);

                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InputterPage()),
                        );
                      },
                      child: const Text('送信する'),
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}


class ViewerQuestionnaier extends ConsumerWidget {

  final participants = [
    "未設定",
    "子供",
    "兄弟",
    "親",
    "友達",
    "その他",
  ];

  final sex = [
    "未設定",
    "男性",
    "女性"
  ];

  final age = [
    "未設定",
    "10代",
    "20代",
    "30代",
    "40代",
    "50代",
    "60代",
    "70代以上",
  ];


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedValue_participants = ref.watch(selectedValueParticipants.state).state;
    var selectedValue_sex = ref.watch(selectedValueSex.state).state;
    var selectedValue_age = ref.watch(selectedValueAge.state).state;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('野球小僧'),
        title: Image.asset(
          'images/yakyukozo_logo.png',
          height: 50,
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '試合参加者',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      const SizedBox(width: 20),
                      DropdownButton(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          dropdownColor: Colors.green,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          value: selectedValue_participants,
                          //   value: ref.watch(selectedValueMatchFormat.state).state,
                          items: participants.map((list) => DropdownMenuItem(
                              value: list,
                              child: Text(list)
                          )).toList(),
                          onChanged: (value) {
                            // selectedValue_matchFormat = value!;
                            ref.read(selectedValueParticipants.notifier).state = value!;
                            // print(value);
                          }
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '入力者の性別',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      const SizedBox(width: 20),
                      DropdownButton(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          dropdownColor: Colors.green,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          value: selectedValue_sex,
                          items: sex.map((list) => DropdownMenuItem(
                              value: list,
                              child: Text(list)
                          )).toList(),
                          onChanged: (value) {
                            ref.read(selectedValueSex.notifier).state = value!;
                            // print(value);
                          }
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '入力者の年齢',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      const SizedBox(width: 20),
                      DropdownButton(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          dropdownColor: Colors.green,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          value: selectedValue_age,
                          items: age.map((list) => DropdownMenuItem(
                              value: list,
                              child: Text(list)
                          )).toList(),
                          onChanged: (value) {
                            ref.read(selectedValueAge.notifier).state = value!;
                            // print(value);
                          }
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: ElevatedButton(
                        onPressed: () async {
                          FirebaseFirestore.instance.collection('Viewer').add({
                            '試合参加者' : ref.watch(selectedValueParticipants.state).state,
                            '入力者の性別' : ref.watch(selectedValueSex.state).state,
                            '入力者の年齢' : ref.watch(selectedValueAge.state).state,
                          });

                          ref.refresh(selectedValueParticipants);
                          ref.refresh(selectedValueSex);
                          ref.refresh(selectedValueAge);

                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewerPage()),
                          );
                        },
                        child: const Text('送信する'),
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
