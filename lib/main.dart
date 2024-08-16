import 'package:flutter/material.dart';
import 'package:flutter_listview/model/Items.dart';
import 'package:flutter_listview/data/list_items.dart';
import 'package:flutter_listview/widget/list_view_widget.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Items> _list = List.from(listItem);
  final listKey = GlobalKey<AnimatedListState>();
  void _incrementCounter() {
    setState(() {});
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Food"),
        centerTitle: true,
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: _list.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                ListViewWidget(
          items: listItem[index],
          animation: animation,
          onClicked: () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          removeItem(1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void removeItem(int index) {
    listItem.remove(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListViewWidget(
        items: listItem[index],
        animation: animation,
        onClicked: () {},
      ),
      duration: Duration(milliseconds: 400),
    );
  }
  void insertItem(){
    final index=1;
    final element= Items(title: "ChocoPie", urlImage: "https://www.google.com.vn/url?sa=i&url=http%3A%2F%2Fteasymart.com%2Fsan-pham%2Fbanh-chocopie-hop-12-chiec%2F&psig=AOvVaw37lDkkJRmsEd_WDsXzrvHD&ust=1635845034842000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJCgtuXr9vMCFQAAAAAdAAAAABAJ");
    _list.insert(index, element);
    listKey.currentState!.insertItem(index, duration: Duration(milliseconds: 200));
  }
}
