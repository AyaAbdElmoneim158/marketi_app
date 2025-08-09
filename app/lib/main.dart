import 'package:app/marketi_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => CustomErrorWidget(details: details);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then(
    (_) => runApp(const MarketiApp()),
  );
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.details});
  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.red, size: 80),
            SizedBox(height: 20),
            Text("Something went wrong!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(details.exception.toString(), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
