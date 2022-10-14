import 'package:bmi_calculator/tabViews/MaleTabView.dart';
import 'package:bmi_calculator/tabViews/WomanTabView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with SingleTickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "vazir",
      ),
      home: Scaffold(
        appBar: _getAppBar(),
        body: SafeArea(
          child: _getBody(),
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Colors.pink,
      centerTitle: true,
      title: Text("‌BMI محاسبه‌گر"),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 28,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.pink,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              _getTab("مرد", FontAwesomeIcons.mars),
              _getTab("زن", FontAwesomeIcons.venus),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ManTabView(),
              WomanTabView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getTab(String title, IconData icon) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 8,
          ),
          FaIcon(
            icon,
            size: 16,
          ),
        ],
      ),
    );
  }
}
