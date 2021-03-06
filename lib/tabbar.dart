import 'package:flutter/material.dart';
import 'Controller/detailController.dart';
import 'Controller/ChartController.dart';
import 'Controller/AddController.dart';
import 'Controller/CommunityController.dart';
import 'Controller/MineController.dart';

class Tabbar extends StatefulWidget {
  @override
  tabbarState createState() {
    return new tabbarState();
  }
}

class tabbarState extends State<Tabbar> {


  int _selectedIndex = 0;
  List<Widget> pages = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages.add(detailController());
    pages.add(ChartController());
    pages.add(AddController());
    pages.add(CommunityController());
    pages.add(MineController());

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar:
      BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),onPressed: (){
              _onItemTapped(0);
            }),
            IconButton(icon: Icon(Icons.insert_chart),onPressed: () {
              _onItemTapped(1);
            },),
            SizedBox(),
            IconButton(icon: Icon(Icons.mode_comment),onPressed: (){
              _onItemTapped(3);
            },),
            IconButton(icon: Icon(Icons.my_location),onPressed: () {
              _onItemTapped(4);
            },),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () {
            _onItemTapped(2);
          },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("明细")),
//          BottomNavigationBarItem(icon: Icon(Icons.insert_chart),title: Text("图表")),
//          BottomNavigationBarItem(icon: Icon(Icons.library_add),title: Text("添加")),
//          BottomNavigationBarItem(icon: Icon(Icons.mode_comment),title: Text("社区")),
//          BottomNavigationBarItem(icon: Icon(Icons.my_location),title: Text("我的")),
//
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        type: BottomNavigationBarType.fixed,
//        unselectedItemColor: Colors.grey,
//        elevation: 2.0,
//        onTap: _onItemTapped,
//      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}