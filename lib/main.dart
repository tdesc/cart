import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  List<String> _settingsList = List<String>.from(
    ['Принимать любые изменения',
    'Принимать увеличенные коэффициенты',
    'Не принимать изменения коэффициентов'
  ]);

   final pages = [
    {
      "title": "Page One",
      "text": "Text One",
      "color": Colors.cyan
    },
    {
      "title": "Page Two",
      "text": "Text Two",
      "color": Colors.lightBlueAccent
    },
    {
      "title": "Page Three",
      "text": "Text Three",
      "color": Colors.lightGreen
    }
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 3,

        child: Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.

          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.green),
                child: DefaultTabController(
                  length: 2,
                  child: _headerNavigation()
                )
              )
          )
        ),
        body: _pageViewBody(),
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
//                  height: 64.0,
//                  color: Colors.deepOrangeAccent,
//                  alignment: Alignment.center,
              child:  _bottomNavigation2()
// Row(
//                    children: <Widget>[
//                      Text( 'Oeschinen Lake Campground',
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                        )),
//                      _bottomNavigation()
//               ],
//            ),


            ),
          ),
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
//          bottomNavigationBar:
//


    ),
    );
  }
  _pageViewBody()=>
     ListView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final item = pages[index];

        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify Widgets.
          key: Key(item['title']),
          // We also need to provide a function that tells our app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from our data source.
            setState(() {
              pages.removeAt(index);
            });

            // Then show a snackbar!
            Scaffold
                .of(context)
                .showSnackBar(
                SnackBar(content: Text("{$item['title']} dismissed")));
          },
          // Show a red background as the item is swiped away
          background: Container(color: Colors.red),
          child: ListTile(title: Text('$item')),
        );
      });

  _bottomNavigation2() =>
        new Row(
          children: <Widget>[
           new Padding(
                padding: new EdgeInsets.symmetric(horizontal: 8.0),
                child: new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    tooltip: 'Back',
                    onPressed: () {},
                  )
                )
           ,
          new Expanded(
             child: _bottomNavigation()
          ),
          ],
        );

  _headerNavigation() =>
      Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),

          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
                new Flexible(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                        constraints: BoxConstraints(
                          maxHeight: 40.0,
                          maxWidth: 280.0,
    //                                      minWidth: 150.0,
    //                                      minHeight: 150.0
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal[600],
                          borderRadius: BorderRadius.circular(8.0),

    //                                   border: Border.all(
    //                                     color: Colors.green,
    //                                     width: 2.0,
    //                                   ),
                        ),
                        child: TabBar(

                          indicator: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(8.0),

                            border: Border.all(
                              color: Colors.teal[600],
                              width: 2.0,
                            ),
                          ),
                          //                                indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(text: "Купонник"),
                            Tab(text: "Мои пари")
                          ],
                        )
                    )
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder)=>
                        Container(
                            color: Colors.white,
                            height: 280.0,
                            child: new Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: new EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                                  child: new Text("Настройки",
                                    style: TextStyle(
                                      color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  alignment: Alignment(-1.0, 0.0),
                                ),
                                Container(
                                  padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                  child: new Text("Изменение Коэффициентов".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  alignment: Alignment(-1.0, 0.0),
                                ),

                                Flexible(
//                                  height: 360.0,

                                  child:
                                      ListView.builder(
                                      itemCount: _settingsList.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return new Column(
                                          children: <Widget>[
                                            new ListTile(
                                              dense: true,
                                              title: new Text(_settingsList[index]),
                                            ),
                                            new Divider(height: 2.0,),
                                          ],
                                        );
                                      })
                                ),


                              ]),

                            )
                        );
                    })
              ]
          ));

  _bottomNavigation() =>
    Container(
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        constraints: BoxConstraints(
          maxHeight: 64.0,
            //                                      minWidth: 150.0,
          //                                      minHeight: 150.0
        ),
        child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.teal[600],
            indicator: BoxDecoration(
              color: Colors.teal,
              border: Border.all(
                color: Colors.teal[600],
                width: 2.0,
              ),
            ),
            //                                indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: new Icon(Icons.view_agenda, size: 32.0), text: "Одинары"),
              Tab(icon: new Icon(Icons.view_day, size: 32.0), text: "Экспресс"),
              Tab(icon: new Icon(Icons.casino, size: 32.0), text: "Система")
            ],
        )
    );
//       BottomNavigationBar(
//         currentIndex: _currentIndex,
//          items: <BottomNavigationBarItem>[
//
//            new BottomNavigationBarItem(
//              ,
//              title: new Text('Одинары'),
//
//            ),
//            new BottomNavigationBarItem(
//              icon: new Icon(Icons.cloud),
//              title: new Text('Экспресс'),
//            ),
//            new BottomNavigationBarItem(
//              icon: new Icon(Icons.cloud),
//              title: new Text('Система'),
//            ),
//          ],
//          onTap: (int index) {
//            //              _history.add(index);
//            //              setState(() => _currentIndex = index);
//            //              Navigator.push(context, new BottomNavigationRoute()).then((x) {
//            //                _history.removeLast();
//            //                setState(() => _currentIndex = _history.last);
//            //              });
//          },
//        )



  _bottomAppBar() =>
      BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            ),
            IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            )
          ],
        )
      );
}

