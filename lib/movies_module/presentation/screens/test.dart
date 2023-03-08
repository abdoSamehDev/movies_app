import 'package:flutter/material.dart';
import 'package:movies_app/movies_module/presentation/screens/movies_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: MaterialButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesScreen()));
        },child: const Text("Navigate"),),
      ),
    );
  }
}
