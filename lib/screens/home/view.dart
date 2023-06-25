import 'package:apiapp/screens/home/cubit.dart';
import 'package:apiapp/screens/home/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => HomeCubit()..getHomedata(),
        child: Builder(builder: (context) {
          HomeCubit cubit = HomeCubit.get(context);
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return cubit.isHomeLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : Column(
                      children: [
                      GestureDetector(
                                child: Text('press here'),
                                onTap: () {
                                  cubit.postScan();
                                },
                              ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cubit.eventsModel!.result!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Text(cubit.eventsModel!.result!.data![index]
                                          .title ??
                                      ''),
                                  Text(cubit.eventsModel!.result!.data![index]
                                          .address ??
                                      ''),
                                  Image.network(cubit.eventsModel!.result!
                                          .data![index].image ??
                                      ''),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
            },
          );
        }),
      ),
    );
  }
}
