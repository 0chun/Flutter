import 'package:flutter/material.dart';
import 'package:app_1/src/provider/bottom_navigation_provider.dart';
import 'package:app_1/src/ui/count_home_widget.dart';
import 'package:app_1/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  // CountProvider? _countProvider;
  BottomNavigationProvider? _bottomNavigationProvider;

  @override
  Widget build(BuildContext context) {
    // _countProvider = Provider.of<CountProvider>(context, listen: false);
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    Widget _navigationBody() {
      switch (_bottomNavigationProvider?.currentPage) {
        // switch (1) {
        case 0:
          return CountHomeWidget();
          break;
        case 1:
          return MovieListWidget();
          break;
      }
      return Container();
    }

    Widget _bottomNavigationBarWidget() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
        ],
        currentIndex: _bottomNavigationProvider!.currentPage,
        selectedItemColor: Colors.red,
        onTap: (index) {
          if (_bottomNavigationProvider != null) {
            _bottomNavigationProvider!.updateCurrnetPage(index);
          }
        },
      );
    }

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}




// floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           IconButton(
//             onPressed: () {
//               if (_countProvider != null) {
//                 _countProvider!.add();
//               }
//             },
//             icon: Icon(Icons.add),
//           ),
//           IconButton(
//             onPressed: () {
//               if (_countProvider != null) {
//                 _countProvider!.remove();
//               }
//             },
//             icon: Icon(Icons.remove),
//           )
//         ],
//       ),