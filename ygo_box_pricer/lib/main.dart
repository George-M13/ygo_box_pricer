import 'package:flutter/material.dart';
import 'package:ygo_box_pricer/ygo_price_services.dart';
import 'package:ygo_box_pricer/ygo_set.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0x5d75cbFF), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Ygo Box Pricer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  var setName = "";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//APIARY
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future<YgoSetData?>? setFuture;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        widget.setName = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter box name',
                      ),
                    ),
                    SizedBox(height: 16),
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            setFuture =
                                YgoPriceServices.getSetData(widget.setName);
                          });
                        },
                        child: Text("Search")),
                    setFuture == null
                        ? Text("Enter a set name")
                        : FutureBuilder(
                            future: setFuture,
                            builder: (builder, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text("Error: ${snapshot.error}");
                              } else if (snapshot.hasData) {
                                return Text("Data: ${snapshot.data}");
                              } else {
                                return Text("No data");
                              }
                            })
                  ])),
        ),
      ),
    );
  }
}
