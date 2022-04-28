import 'package:flutter/material.dart';
import 'empty_content.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T? item);

/*
  El Patrón Builder
  - Permite escribir código reusable
  - Es usado consistentemente es Flutter
*/

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({
    Key? key,
    required this.snapshot,
    required this.itemBuilder,
  }) : super(key: key);
  final AsyncSnapshot<List<T?>> snapshot;
  final ItemWidgetBuilder<T>? itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData == true) {
      final List<T?>? items = snapshot.data;
      if (items?.isNotEmpty == true) {
        return _buildList(items);
      } else {
        return EmptyContent();
      }
    } else if (snapshot.hasError == true) {
      return EmptyContent(
        title: 'Something went wrong',
        message: 'Can\'t load items right now',
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildList(List<T?>? items) {
    // builder() nos permite tener un gran número de elementos dentro de una lista
    return ListView.separated(
      itemCount: items!.length + 2,
      separatorBuilder: ((context, index) => Divider(
            height: 0.5,
            color: Colors.red,
          )),
      itemBuilder: (context, index) {
        if (index == 0 || index == items.length + 1) {
          return Container();
        }
        return itemBuilder!(context, items[index - 1]);
      },
    );
  }
}
