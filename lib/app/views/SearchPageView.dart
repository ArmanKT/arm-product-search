import 'package:arm_product/app/bloc/products/products_cubit.dart';
import 'package:arm_product/app/models/SearchProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/appConfig.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key, required this.title});
  final String title;

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

var searchValueController = TextEditingController();

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: APP_BG_COLOR,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: searchValueController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.search,
                        color: APP_SEARCH_ICON_COLOR,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: APP_SEARCH_ICON_COLOR),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: APP_SEARCH_ICON_COLOR),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    onEditingComplete: () {
                      // context.debugDoingBuild

                      context.read<ProductsCubit>().fetchPostApi(searchData: searchValueController.text);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductFetchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductFetchError) {
                      return const Text("Error From ProductFetchError");
                    } else if (state is ProductFetchLoaded) {
                      final productList = state.postList;
                      return productList.isEmpty
                          ? Column(
                            children: [
                              Container(
                                  color: APP_RED_COLOR,
                                  width: double.infinity,
                                 
                                  padding: const EdgeInsets.all(20),
                                  child: const Text(
                                    'No product Found - Please Search Something',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          )
                          : GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 0.7,
                                maxCrossAxisExtent: 200,
                              ),
                              padding: const EdgeInsets.all(10),
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                final SearchProductModel singleItem =
                                    productList[index];
                                return _buildCard(
                                    name: singleItem.productName,
                                    imgPath: singleItem.image,
                                    price: singleItem.charge!.sellingPrice
                                        .toString(),
                                    context: context);
                              },
                            );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      {String? name,
      String? price,
      String? imgPath,
      bool? added = false,
      bool? isFavorite = false,
      BuildContext? context}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 10.0, left: 5.0, right: 5.0),
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => CookieDetail(
              //         assetPath: imgPath,
              //         cookieprice: price,
              // cookiename: name)));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Hero(
                        tag: imgPath!,
                        child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imgPath),
                                    fit: BoxFit.contain)))),
                  ),
                  const SizedBox(height: 7.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: NATURAL_BLACK_COLOR,
                            // fontFamily: 'Varela',

                            fontWeight: FontWeight.bold,
                            fontSize: 14.0)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("ক্রয়",
                                style: TextStyle(
                                    color: APP_GRAY_2,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0)),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(price!,
                                style: const TextStyle(
                                    color: APP_PINK_COLOR,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                          ],
                        ),
                        Text(price,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: APP_PINK_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("বিক্রয়",
                                style: TextStyle(
                                    color: APP_GRAY_2,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(price,
                                style: const TextStyle(
                                    color: APP_GRAY_2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("লাভ",
                                style: TextStyle(
                                    color: APP_GRAY_2,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(price,
                                style: const TextStyle(
                                    color: APP_GRAY_2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (added!) ...[
                    const Icon(Icons.remove_circle_outline,
                        color: Color(0xFFD17E50), size: 12.0),
                    const Text('3',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: Color(0xFFD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0)),
                    const Icon(Icons.add_circle_outline,
                        color: Color(0xFFD17E50), size: 12.0),
                  ]
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: APP_ORANGE_COLOR.withOpacity(0.6),
            ),
            child: const Text(
              'স্টকে নেই',
              style: TextStyle(color: APP_RED_COLOR),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      APP_PRIMARY_COLOR_2,
                      APP_PRIMARY_COLOR,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))),
      ],
    );
  }
}