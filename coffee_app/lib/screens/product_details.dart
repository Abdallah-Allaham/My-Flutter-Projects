import 'package:coffee_app/constant.dart';
import 'package:coffee_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductModel product;
  String? selectedSize;
  bool? hasTakeAway = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    product = args['product'];
  }

  void onSizeChange(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void onTakeAwayChange(bool value) {
    setState(() {
      hasTakeAway = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff242424),
            size: 18,
          ),
        ),
        title: Text(
          "Detail",
          style: TextStyle(
            color: Color(0xff242424),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/heart.svg'),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  product.image,
                  height: 285,
                  width: .infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff242424),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          product.category.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset("assets/images/star.svg", width: 20),
                      Text.rich(
                        TextSpan(
                          text: "${product.rating}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2a2a2a),
                          ),
                          children: [
                            TextSpan(
                              text: " (${product.rateCount})",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffa2a2a2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  DetailsIcon(iconPath: "assets/images/delivery_icon.png"),
                  DetailsIcon(iconPath: "assets/images/caffe_icon.png"),
                  DetailsIcon(iconPath: "assets/images/milk_icon.png"),
                ],
              ),
              ProductDivider(),
              ProductTitle(title: "Description"),
              SizedBox(height: 8),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffa2a2a2),
                ),
              ),
              ProductDivider(),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  ProductTitle(title: "Sizes"),
                  Row(
                    spacing: 10,
                    children: List.generate(product.sizes.length, (index) {
                      final size = product.sizes[index];
                      return InkWell(
                        onTap: () {
                          onSizeChange(size);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: selectedSize == size
                                ? Color(0xfff9f2ed)
                                : Colors.white,
                            border: Border.all(
                              color: selectedSize == size
                                  ? kPrimaryColor
                                  : Color(0xffe3e3e3),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            product.sizes[index].substring(0,1),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: selectedSize == size
                                  ? FontWeight.w600
                                  : null,
                              color: selectedSize == size
                                  ? kPrimaryColor
                                  : Color(0xff242424),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              ProductDivider(),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  ProductTitle(title: "Drink In / Take away"),
                  Row(
                    spacing: 20,
                    children: [
                      ProductButton(
                        path: "assets/images/drink_in.svg",
                        onTap: () {
                          onTakeAwayChange(false);
                        },
                        isActive: hasTakeAway == false,
                      ),
                      SizedBox(width: 8),
                      ProductButton(
                        path: "assets/images/take_away.svg",
                        onTap: () {
                          onTakeAwayChange(true);
                        },
                        isActive: hasTakeAway == true,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 14, color: Color(0xff909090)),
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              child: Text(
                "Buy Now",
                style: TextStyle(
                  fontWeight: .w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsIcon extends StatelessWidget {
  final String iconPath;

  const DetailsIcon({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffededed).withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(iconPath, width: 24, height: 24),
    );
  }
}

class ProductDivider extends StatelessWidget {
  const ProductDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Divider(color: Color(0xffE3e3e3)),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String title;

  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xff242424),
      ),
    );
  }
}

class ProductButton extends StatelessWidget {
  final String path;
  final bool isActive;
  final GestureTapCallback onTap;

  const ProductButton({
    super.key,
    required this.path,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: isActive ? 1 : 0.5,
        child: SvgPicture.asset(path),
      ),
    );
  }
}
