import 'package:arm_product/app/bloc/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsInitial) {
                  context
                      .read<ProductDetailsCubit>()
                      .fetchProductDetails(slug: productSlug);

                  return Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Center(child: CircularProgressIndicator()),
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.productName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'ব্রান্ডঃ ',
                                        style: TextStyle(
                                            color: APP_GRAY_2,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        item.brand.name,
                                        style: const TextStyle(
                                            color: NATURAL_BLACK_COLOR,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: APP_PINK_COLOR,
                                        borderRadius: BorderRadius.circular(50)),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'ডিস্ট্রিবিউটরঃ ',
                                        style: TextStyle(
                                            color: APP_GRAY_2,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        item.seller,
                                        style: const TextStyle(
                                            color: NATURAL_BLACK_COLOR,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'ক্রয়মূল্যঃ',
                                      style: TextStyle(
                                          color: APP_PINK_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      item.charge.currentCharge.toString(),
                                      style: const TextStyle(
                                          color: NATURAL_BLACK_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'বিক্রয়মূল্যঃ',
                                      style: TextStyle(
                                          color: NATURAL_BLACK_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      item.charge.sellingPrice.toString(),
                                      style: const TextStyle(
                                          color: NATURAL_BLACK_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                    height: 20,
                                    width: double.infinity,
                                    child: CustomPaint(
                                        painter: DashedLinePainter())),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'লাভঃ',
                                      style: TextStyle(
                                          color: NATURAL_BLACK_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      item.charge.profit.toString(),
                                      style: const TextStyle(
                                          color: NATURAL_BLACK_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'বিস্তারিত',
                                  style: TextStyle(
                                      color: NATURAL_BLACK_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                HtmlWidget(
                                  '''${item.description} ''',

                                  isSelectable: true,

                                  onErrorBuilder: (context, element, error) =>
                                      Text('$element error: $error'),
                                  onLoadingBuilder:
                                      (context, element, loadingProgress) =>
                                          const CircularProgressIndicator(),

                                  renderMode: RenderMode.column,

                                  // set the default styling for text
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/img/polygon.png',
              height: 80,
            ),
            const Positioned(
                child: Text(
              'এটি\nকিনুন',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
          ],
        ),
      ),
    ));
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = APP_GRAY
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
