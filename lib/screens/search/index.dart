import 'package:candice/common/searchTextField.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/models/appState.dart';
import 'package:candice/screens/search/trendingArtists/trendingArtists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bubbleSearchSort.dart';
import 'events/events.dart';
import 'home/homeSearch.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<Null> _refreshSearch() async {}

  List<Widget> searchList;
  int index = 0;

  @override
  void initState() {
    final appState = Provider.of<AppState>(context, listen: false);
    searchList = [
      HomeSearch(),
      TrendingArtists(),
      Events(),
      Text('Competitions'),
      Text('Jobs'),
      Text('Castings'),
      Text('Requests'),
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshSearch, // TODO: call to fetch the search
          child: ListView(
            children: <Widget>[
              const SizedBox(height: kCommonSeparation),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kCommonSeparation),
                child: SearchTextField(),
              ),
              BubbleSearchSort(
                  index: index,
                  action: (int index) => setState(() => this.index = index)),
              const SizedBox(height: kCommonSeparation),
              searchList[index],
            ],
          ),
        ),
      ),
    );
  }
}
