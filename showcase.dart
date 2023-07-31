dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  showcaseview: ^2.0.3 // Add this package in your pubspec.yaml file

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowcaseViewApp extends StatefulWidget {
  const ShowcaseViewApp({super.key});

  @override
  State<ShowcaseViewApp> createState() => ShowcaseViewAppState();
}

class ShowcaseViewAppState extends State<ShowcaseViewApp> {
  final suggestedlist = [
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'React',
    'C#',
    'Visual Basic .NET',
    'SQL',
    'Assembly language',
    'PHP',
    'R',
    'Go',
    'Classic Visual Basic',
    'MATLAB',
    'Swift',
    'Ruby',
    'Perl',
    'Objective-C',
    'Rust',
  ];
  final searchkey = GlobalKey();
  final notificationkey = GlobalKey();
  final floatingkey = GlobalKey();
  BuildContext? mycontext;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(mycontext!)
            .startShowCase([searchkey, notificationkey, floatingkey]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      autoPlay: true,
      autoPlayDelay: Duration(seconds: 3),
      // blurValue: 4,
      // disableMovingAnimation: true,
      // disableScaleAnimation: true,
      // enableAutoPlayLock: true,
      enableShowcase: true,//use to run only once if user is new
      builder: Builder(
        builder: (context) {
          mycontext=context;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal.shade600,
                title: const Text(
                  'ShowCaseView App',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Showcase(
                    key: notificationkey,
                    title: 'Notification',
                    description: 'New updates',
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: const Icon(Icons.notification_add)),
                  )
                ],
              ),
              floatingActionButton: Showcase.withWidget(
                key: floatingkey,
                container: Container(
                  height: 60,
                  width: 120,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Search Your Product',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                height: 400,
                width: 130,
                child: FloatingActionButton(
                    backgroundColor: Colors.teal,
                    child: const Icon(Icons.search),
                    onPressed: () {}),
              ),
              drawer: const Drawer(width: 200),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Showcase(
                    key: searchkey,
                    title: 'Search',
                    description: 'Search Your Language',
                    tooltipBackgroundColor: Colors.red,
                    textColor: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 205, 208, 210),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search',
                        ),
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: suggestedlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(suggestedlist[index]),
                        onTap: () {},
                      );
                    },
                  )),
                  MaterialButton(
                      color: Colors.blue,
                      minWidth: 180,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Show Demo',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        ShowCaseWidget.of(context).startShowCase(
                            [searchkey, notificationkey, floatingkey]);
                      })
                ],
              )));
        },
      ),
    );
  }
}
