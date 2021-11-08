import 'package:betterme/betterme/home/RecordFoodScreen/RecordFoodScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class SearchFoodScreen extends StatefulWidget {
  @override
  _SearchFoodScreen createState() => _SearchFoodScreen();
}

class _SearchFoodScreen extends State<SearchFoodScreen> {

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
  final blockColor = Color(0xff333C47); // 여러 블럭들 색


  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController searching = TextEditingController();

  bool isSearching = false;
  String _searchText = "";
  List<String> suggestion = [];

  loadData() async{
    final myData = await rootBundle.loadString('data/NutritionalComponents.csv');
    List<List<dynamic>> FoodData = const CsvToListConverter().convert(myData);
    suggestion = [];
    for(int i = 1 ; i < FoodData.length - 1 ; i++){
      suggestion.add(FoodData[i][0]);
    }
    print("debug : ${FoodData[0]}");
    return suggestion;
  }

  _SearchFoodScreen() {
    searching.addListener(() {
      if (searching.text.isEmpty) {
        setState(() {
          isSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          isSearching = true;
          _searchText = searching.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("음식 검색",
            style: TextStyle(color: txtColor, fontSize: defaultSize * 15)),
        backgroundColor: bgColor,
      ),
      key: key,
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    //검색박스
                      height: valHeight * 0.045,
                      width: valWidth * 0.74,
                      decoration: BoxDecoration(
                        color: blockColor,
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                      ),
                      child: Row(
                        children: [
                          Container(
                              width: valWidth * 0.08,
                              height: valHeight * 0.045,
                              child: Image.asset('images/search_icon.png')),
                          isSearching
                              ? GestureDetector(
                            onTap: () {
                              isSearching = false;
                              searching.text = "";
                              setState(() {});
                            },
                            child: Container(),
                          )
                              : Container(),
                          Expanded(
                              child: TextField(
                                //autofocus: true,
                                controller: searching,
                                style: TextStyle(color: txtColor),
                              ))
                          ///여기에 텍스트 입력받고 검색구현
                        ],
                      )),
                  SizedBox(width: valWidth * 0.02),
                  ElevatedButton(
                    //검색 버튼
                      onPressed: () {
                        if (searching.text != "") {
                          setState(() {});
                          isSearching = true;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: blockColor,
                          minimumSize: Size(valWidth * 0.12, valHeight * 0.045),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(valWidth * 0.015))),
                      child: Text('검색',
                          style: TextStyle(
                              fontSize: defaultSize * 15, color: txtColor)))
                ]),
                SizedBox(height: 20,),
                Container(
                  height: 0.4 * valHeight,
                  child: FutureBuilder(
                      future: loadData(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView(
                              padding: new EdgeInsets.symmetric(vertical: 8.0),
                              children: _buildSearchList()
                          );
                        }else{
                          return Container();
                        }
                      }
                  ),
                )
              ],
            )),
      ),
    );
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return suggestion.map((contact) => new ChildItem(contact)).toList();
    }
    else {
      List<String> _searchList = [];
      for (int i = 0; i < suggestion.length; i++) {
        String  name = suggestion.elementAt(i);
        if (name.contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

}

class ChildItem extends StatelessWidget {
  final String name;
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  ChildItem(this.name);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecordFoodScreen(food : this.name)));
      },
      child: ListTile(title: new Text(this.name, style: TextStyle(color: txtColor))),
    );
  }
}
