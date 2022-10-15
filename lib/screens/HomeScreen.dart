import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';
import '../tabViews/MaleTabView.dart';
import '../tabViews/WomanTabView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: _getAppBar(),
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: accentColor,
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
              color: accentColor,
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
