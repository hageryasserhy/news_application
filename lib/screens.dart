import 'package:flutter/material.dart';
import 'package:flutter_assginment_6_1/view/list_OF_VIEW_TECHNOLOGY.dart';
import 'package:flutter_assginment_6_1/view/list_of_view_health.dart';

import 'view/list_of_view_design.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Categories",textAlign:TextAlign.center,style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "General",
              ),
              Tab(
                text: "Health",
              ),
              Tab(
                text: "Technology",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: ListOfViewsGeneral(),
            ),
            Center(
              child: ListOfViewsHealth(),
            ),
            Center(
              child: ListOfViewsTechnology(),
            ),
          ],
        ),
      ),
    );
  }
}