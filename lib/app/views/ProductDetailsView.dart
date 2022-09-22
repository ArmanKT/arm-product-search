import 'package:arm_product/app/bloc/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/appConfig.dart';
import '../models/ProductDetailsModel.dart';

class ProductDetailsView extends StatelessWidget {
  final String productSlug;
  const ProductDetailsView({super.key, required this.productSlug});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: APP_BG_COLOR,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: NATURAL_BLACK_COLOR, //change your color here
          ),
          title: const Text(
            'প্রোডাক্ট ডিটেইল',
            style: TextStyle(
                color: NATURAL_BLACK_COLOR, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: APP_BG_COLOR,
        ),
        body: Column(
          children: [
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsInitial) {
                  context
                      .read<ProductDetailsCubit>()
                      .fetchProductDetails(slug: productSlug);

                  return Column(
                    children: [
                      Container(
                          color: APP_ORANGE_COLOR,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'Please Search Something Like - Rice, pulses',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  );
                } else if (state is ProductDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailsError) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailsLoaded) {
                  var item = state.productDetails.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 40, right: 40, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network('${item.image}'),
                            ),
                            // child: ,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: 30,
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              width: 30,
                              height: 200,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Container(child: Text(item.productName)),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
