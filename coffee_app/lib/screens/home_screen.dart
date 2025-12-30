import 'package:coffee_app/constant.dart';
import 'package:coffee_app/data/dummy.dart';
import 'package:coffee_app/models/category_model.dart';
import 'package:coffee_app/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> data = categories;

  @override
  void initState() {
    super.initState();
    data.insert(0, CategoryModel(id: 0, name: "All Coffee", isSelected: true));
  }

  void onCategoryChange(CategoryModel category) {
    for (var element in data) {
      element.isSelected = false;
    }
    category.isSelected = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: .all(16),
                      fillColor: Color(0xffe9e9e9),
                      hintText: 'Search Coffee',
                      border: OutlineInputBorder(
                        borderRadius: .circular(12),
                        borderSide: .none,
                      ),
                      enabledBorder: customOutlineInputBorder(),
                      focusedBorder: customOutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                        borderRadius: .circular(12),
                        borderSide: BorderSide(color: Colors.red.shade600),
                      ),
                      hintStyle: TextStyle(
                        color: Color(0xffa2a2a2),
                        fontSize: 14,
                        fontWeight: .w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          colorFilter: ColorFilter.mode(
                            Color(0xff594040),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/grid.svg'),
                  style: IconButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 31),
            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                spacing: 16,
                children: List.generate(data.length, (index) {
                  return InkWell(
                    onTap: () {
                      onCategoryChange(data[index]);
                    },
                    child: Container(
                      padding: .symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: data[index].isSelected ? kPrimaryColor : null,
                        borderRadius: .circular(12),
                      ),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                          fontSize: 14,
                          color: data[index].isSelected
                              ? Colors.white
                              : Color(0xff313131),
                          fontWeight: data[index].isSelected ? .w600 : null,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15, //between the items
                  mainAxisSpacing: 24, //between the rows
                  childAspectRatio: 156 / 238,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/product-details",
                        arguments: {'product': products[index]},
                      );
                    },
                    child: Container(
                      padding: .fromLTRB(8, 8, 8, 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffeeeeee)),
                        borderRadius: .circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: .circular(12),
                              child: Image.asset(
                                width: double.infinity,
                                products[index].image,
                                fit: .cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            products[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .w600,
                              color: Color(0xff242424),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            products[index].category.name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffa2a2a2),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                "\$${products[index].price}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: .w600,
                                  color: Color(0xff050505),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, color: Colors.white),
                                style: IconButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                  foregroundColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder customOutlineInputBorder() {
  return OutlineInputBorder(borderRadius: .circular(12), borderSide: .none);
}

/// another way to add icon
// Container(
// decoration: BoxDecoration(
// color: Color(0xffc67c4e),
// borderRadius: .circular(12),
// ),
// child: IconButton(
// onPressed: () {},
// icon: SvgPicture.asset('assets/images/grid.svg'),
// ),
// ),
