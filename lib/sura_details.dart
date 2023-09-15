import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'suradetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

List<String> verses = [];

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadfile(args.index);
    }

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
              title: Text(
                args.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                      child: Text(
                    verses[index],
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ));
                },
                itemCount: verses.length,
              ),
            ),
          ),
        ));
  }

  loadfile(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = file.split('\n');
    print('lines');
    verses = lines;
    setState(() {});
  }
}
