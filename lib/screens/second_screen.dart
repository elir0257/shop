import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:repository/repository.dart';
import 'package:shop/app.dart';
import 'package:shop/item/cubit/item_cubit.dart';
import 'package:shop/item/item.dart';



class SecondPage extends StatelessWidget {
  const SecondPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit(context.read<ItemRepository>()),
      child: const ItemView(),
    );
  }
}

class ItemView extends StatefulWidget{
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('каталог'),
      ),
      body: Center(
        child: BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          switch (state.status) {
            case ItemStatus.success:
              return ItemCard(url: state.itemList.items?[0].image?.file.url);
            case ItemStatus.initial:
              return const Text('инициал');
            case ItemStatus.loading:
              return const Text('загрузка');
            case ItemStatus.failure:
              return const Text('не получилось');
          }
        }
      ),
      ),
    );
  }
}


class ItemCard extends StatelessWidget{
  const ItemCard({
    required this.url,
});

  final String? url;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url!)
        )
      ),
    );
  }
}