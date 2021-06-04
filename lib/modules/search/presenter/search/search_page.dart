import 'package:clean_arch/modules/search/presenter/search/search_bloc.dart';
import 'package:clean_arch/modules/search/presenter/search/states/states.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I<SearchBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: bloc?.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<SearchState>(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc?.state;
                  if (state is SearchStart) {
                    return Center(
                      child: Text('Digite um texto'),
                    );
                  }
                  if (state is SearchError) {
                    return Center(
                      child: Text('Houve um erro'),
                    );
                  }
                  if (state is SearchLoading) {
                    return CircularProgressIndicator();
                  }
                  final list = (state as SearchSuccess).list;
                  print(list);
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, id) {
                      final item = list[id];
                      return Container(
                        height: 56,
                        child: ListTile(
                          title: Text(item.title ?? 'unknown'),
                          leading: item.img == null
                              ? Container()
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(item.img!),
                                ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }
}
