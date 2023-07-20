import 'package:flutter/material.dart';
import 'package:random_bg_color_flutter/provider/color_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ColorProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<ColorProvider>(context, listen: false).changeNavStat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Consumer<ColorProvider>(builder: (context, colorProvider, widget) {
        return Scaffold(
          backgroundColor: colorProvider.backgroundColor,
          body: InkWell(
            onTap: () {
              colorProvider.changeBackgroundColor();
            },
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Hello there',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: colorProvider
                              .getColorBrightness(colorProvider.backgroundColor)
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
