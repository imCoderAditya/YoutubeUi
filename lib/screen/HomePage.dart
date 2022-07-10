import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtubeui/model/PixaApi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  String Data1 =
      "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg";
  Future<void> loadData() async {
    http.Response response = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=28449077-eca46fff64ec69edc0744a08d&q=yellow+flowers&image_type=photo&pretty=true"));
    final decodeData = jsonDecode(response.body);
    // print(decodeData);
    var dataItem = decodeData['hits'];

   try{
       PixaApi.hits = List.from(dataItem)
          .map<Hits>((e) => Hits.fromMap(e))
          .toList();
      setState(() {});
   }catch(e){
    print(e);
   }
    // setState(() {
    //    Data1 = dataItem[1]['largeImageURL'];

    // });
   
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: ListView.builder(
        itemCount: PixaApi.hits.length,
        itemBuilder: (context, index) {
        return Column(children: [
          Image.network(PixaApi.hits[index].largeImageURL.toString()),
          Text(PixaApi.hits[index].tags.toString()),
        ]);
      }),
    );
  }
}
