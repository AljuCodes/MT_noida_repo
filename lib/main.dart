import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_listing_noida/control_methods/logic_methods.dart';
import 'package:json_listing_noida/control_methods/network_provider.dart';

final networkC = Networkcontroller();
final logicC = LogicMethods();
void main() {
  Networkcontroller().extractAllFiles();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isGrid = false;
  @override
  Widget build(BuildContext context) {
    List files = Networkcontroller().extractAllFiles();

    int num = 5;
    int times = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoSwitch(
                value: isGrid,
                onChanged: (value) {
                  setState(() {
                    isGrid = value;
                  });
                }),
            isGrid
                ? Container(
                  padding: EdgeInsets.all(6),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 235, 229, 229)),
                    child: Wrap(
                      children: [
                        Row(
                          children: [
                            ...networkC.fetchAllIcons().map((e) {
                              times++;
                              final list2 = networkC.fetchIconData(e);
                              if (times <= 3) {
                                return TheFlex(num: int.parse(list2.last));
                              } else {
                                return Container();
                              }
                            }),
                          ],
                        ),
                        SizedBox(height: 43,),
                        Row(
                          children: [
                    
                            ...networkC.fetchAllIcons().map((e) {
                              times++;
                              final list2 = networkC.fetchIconData(e);
                              if (times > 9&& times<=14) {
                                times++;
                                return TheFlex(num: int.parse(list2.last));
                                
                              } else {
                                return Container();
                              }
                            }),
                          ],
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(
                                  decoration:
                                      BoxDecoration(color: Color(0xFF1b1464)),
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text('symbol',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    ...Networkcontroller()
                                        .extractAllFiles()
                                        .map((e) => Container(
                                              margin: EdgeInsets.all(10),
                                              child: Text(e,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text('count of all files',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ]),
                              // row 2
                              ...networkC.fetchAllIcons().map(
                                    (e) => TableRow(
                                        // decoration: BoxDecoration(color: Color(0xFF1b1464)),
                                        children: [
                                          ...networkC
                                              .fetchIconData(e)
                                              .map((e) => Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Text(e,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  )),
                                        ]),
                                  )
                            ],
                          ),
                        ),
                      ]))
          ],
        ),
      ),
    );
  }
}

class TheFlex extends StatelessWidget {
  const TheFlex({
    Key? key,
    required this.num,
  }) : super(key: key);

  final int num;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: num,
      fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 102, 88, 255),
        ),
        child: Center(
          child: Text(
            num.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
