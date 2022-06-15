import 'package:app/http/http.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gallery App"),
          backgroundColor: Color.fromARGB(255, 255, 73, 7),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(1, index.isEven ? 1.4 : 1),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: list.length,
                  itemBuilder: (context, index) => CoustomCard(index),
                ),
              ),
            ],
          ),
        ));
  }

  CoustomCard(int index) => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Container(
              height: 220,
              width: double.maxFinite,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    list[index].downloadUrl.toString(),
                    fit: BoxFit.cover,
                    height: 200,
                  )),
            ),
            Positioned(
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text(list[index].author.toString())),
                ))
          ],
        ),
      );
}
