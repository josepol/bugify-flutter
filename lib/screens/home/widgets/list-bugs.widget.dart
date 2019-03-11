import 'package:bugify/bug.model.dart';
import 'package:flutter/material.dart';

class ListBugsWidget extends StatefulWidget {
  ListBugsWidget({Key key, List<BugModel> bugs}) : super(key: key);

  _ListBugsWidgetState createState() => _ListBugsWidgetState();
}

class _ListBugsWidgetState extends State<ListBugsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
          crossAxisCount: 3,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <String>[
            'https://cdn.pixabay.com/photo/2017/05/09/21/49/gecko-2299365_1280.jpg',
            'https://cdn.pixabay.com/photo/2017/05/09/21/49/gecko-2299365_1280.jpg',
            'https://cdn.pixabay.com/photo/2017/05/09/21/49/gecko-2299365_1280.jpg',
            'https://cdn.pixabay.com/photo/2017/05/09/21/49/gecko-2299365_1280.jpg'
          ].map((String url) {
            return new GridTile(
              header: Image.network(url, fit: BoxFit.cover),
              child: Container(child: Text('imageadadasdas'), color: Colors.red,));
          }).toList()),
    );
  }
}
