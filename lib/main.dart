import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  double? _scale;
  bool remove = false;
  bool show = false;

  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 200),
    vsync: this,
    lowerBound: 0,
    upperBound: 1,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() { 
      setState(() {
        
      });
    });
  }

  void _animateDown() {
    setState(() => remove = true);
    Future.delayed(Duration(milliseconds: 300)).then((res) {
      setState(() => show = true);
    });
  }

// shrink Icon to 0
// then grown back to 33 and bounce in
  
  @override
  Widget build(BuildContext context) {
    _scale = _controller.value;
    print(_controller.value);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _animateDown();
              }, 
              child: Text('Animate Bounce')
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              height: remove ? 0 : 100,
              width: remove ? 0 : 100,
              child: Container(
                child: Image.asset('images/checkmark.png')
              )
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.bounceOut,
              height: show ? 100 : 0,
              width: show ? 100 : 0,
              child: Image.asset('images/xmark.png')
            )
            
          ],
        ),
      )
    );
  }
}

