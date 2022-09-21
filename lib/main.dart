import 'package:arm_product/app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/bloc/products/products_cubit.dart';
import 'app/views/SearchPageView.dart';

void main() {
  runApp(MyApp(apiService: ApiServices()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiService});
  final ApiServices apiService;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arm Product',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
   
      home: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (_) => Arman(),
          // ),
          BlocProvider(
            create: (context) => ProductsCubit(apiServices: apiService)..fetchPostApi(),
          ),
        ],
        child: const SearchPageView(title: 'Arm-Products'),
      ),
    );
  }
}
