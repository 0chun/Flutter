import 'package:flutter/material.dart';
import 'package:app_1/src/compoments/view_count.dart';
import 'package:app_1/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);
  CountProvider? _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Provider"),
      ),
      body: ViewCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              if (_countProvider != null) {
                _countProvider!.add();
              }
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              if (_countProvider != null) {
                _countProvider!.remove();
              }
            },
            icon: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
