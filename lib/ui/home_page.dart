import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/cubit/api_cubit.dart';
import 'package:flutter_bloc_demo/repository/api_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create: (_) => ApiCubit(
                repository: RepositoryProvider.of<ApiRepository>(context),
              )..getData(),
              child: BlocConsumer<ApiCubit, ApiState>(
                listener: (context, state) {
                  if (state.status == ApiStatus.success) {}
                  if (state.status == ApiStatus.loading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == ApiStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${state.exception}'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case ApiStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ApiStatus.initial:
                      return const Center();
                    case ApiStatus.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: state.apiList!.length,
                        itemBuilder: (c, i) {
                          return ListTile(
                            title: Text(state.apiList![i].vendorName),
                          );
                        },
                      );
                    case ApiStatus.failure:
                      return const Center(
                        child: Text('Error'),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
