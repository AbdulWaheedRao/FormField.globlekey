import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> globlekey = GlobalKey<FormState>();
  GlobalKey<FormState> globlekey1 = GlobalKey<FormState>();
  GlobalKey<FormState> globlekey2 = GlobalKey<FormState>();
  GlobalKey<FormState> globlekey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                key: globlekey,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'enter the user name', labelText: 'username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a name';
                    } else {
                      if (value.length <= 5) {
                        return 'donot accept less then 5 digit';
                      } else {
                        return null;
                      }
                    }
                  },
                )),
            Form(
                key: globlekey1,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter the Fee', labelText: 'Fee'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a digit';
                    } else {
                      if (value.isValidDigit()) {
                        return null;
                      } else {
                        return 'invalid';
                      }
                    }
                  },
                )),
            Form(
                key: globlekey2,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter the Address', labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the adress';
                    } else if (value.isValidAlpha()) {
                      return null;
                    } else {
                      return 'invalid';
                    }
                  },
                )),
            Form(
                key: globlekey3,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter the Password', labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter the password';
                    }else {}
                  },
                )),
            ElevatedButton(
                onPressed: () {
                  globlekey.currentState!.validate();
                  globlekey1.currentState!.validate();
                  globlekey2.currentState!.validate();
                  globlekey3.currentState!.validate();
                },
                child: Text('click'))
          ],
        ),
      ),
    );
  }
}

extension validateDigit on String {
  bool isValidDigit() {
    var length = this.length ?? 0;
    if (length != 0) {
      for (var i = 0; i < length; i++) {
        var code = this.codeUnits[i] ?? 0;
        //this is ASCII code for digit 0-9
        if (!(code >= 48 && code <= 57)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool isValidAlpha() {
    var length = this.length ?? 0;
    if (length != 0) {
      for (var i = 0; i < length; i++) {
        var code = this.codeUnits[i] ?? 0;
        //this is ASCII code for Alpha(capital & small letter)
        if (!(code >= 65 && code <= 90 || code >= 97 && code <= 122)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
}
