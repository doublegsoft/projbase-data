import 'package:flutter/material.dart';
import 'all.dart';

typedef DataCallback = Future<List> Function();

class FetchableListView extends StatefulWidget {

  ItemedWidgetBuilder itemBuilder;

  DataCallback? doRefreshData;

  DataCallback? doLoadData;

  List data;

  FetchableListView({
    super.key,
    required this.itemBuilder,
    this.doRefreshData,
    this.doLoadData,
    this.data = const [],
  });

  @override
  State<StatefulWidget> createState() => FetchableListViewState();

}

class FetchableListViewState extends State<FetchableListView> {

  final ScrollController _scrollController = new ScrollController();

  bool _isLoading = true;

  bool _isNoMore = false;

  List _data = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.data.length == 0) {
        if (widget.doRefreshData != null) {
          List data = await widget.doRefreshData!();
          _data.addAll(data);
          setState(() {
            _isLoading = false;
          });
        } else if (widget.doLoadData != null) {
          List data = await widget.doLoadData!();
          _data.addAll(data);
          setState(() {
            _isLoading = false;
          });
        }
      }
    });

  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PullToRefresh(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _data.length + 1,
        itemBuilder: (context, index) {
          if (index == _data.length) {
            if (_isLoading) {
              return Container(
                height: 72,
                child: Center(
                  child: Image.asset('asset/image/common/loading.gif',),
                ),
              );
            } else {
              return Container(
                height: 1,
              );
            }
          }
          return widget.itemBuilder(context, _data[index]);
        },
      ),
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1200,));
        if (widget.doRefreshData != null) {
          _data = await widget.doRefreshData!();
          setState(() {});
        }
      },
    );
  }

  Future<void> _scrollListener() async {
    if (_isLoading || _isNoMore) return;

    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        _scrollController.position.atEdge) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(milliseconds: 1200,));
      if (widget.doLoadData != null) {
        _data = await widget.doLoadData!();
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

}