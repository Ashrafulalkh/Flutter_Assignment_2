import 'package:flutter/material.dart';
import 'package:mybag_assignment/appalertdialog.dart';
import 'package:mybag_assignment/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Product> products = [
    Product(
      name: "Pullover",
      size: "L",
      color: "Black",
      imageUrl: "images/product1.jpg",
      price: 51,
      quantity: 1,
    ),
    Product(
      name: "T-Shirt",
      size: "L",
      color: "Gray",
      imageUrl: "images/product2.jpg",
      price: 30,
      quantity: 1,
    ),
    Product(
      name: "Sport Dress",
      size: "M",
      color: "Black",
      imageUrl: "images/product3.jpg",
      price: 43,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, size: 32,),),
          ],
        ),

        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Text(
                    'My Bag',
                    style: TextStyle(
                      fontSize: orientation == Orientation.portrait ? 45 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12,),

                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.00),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.05),
                                blurStyle: BlurStyle.normal,
                                blurRadius: 15,
                                spreadRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Card(
                            elevation: 0, // Ensure no elevation
                            color: Colors.white, // Set card color to white
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              // Adjust the border radius
                            ), // Width of the border
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.asset(
                                    product.imageUrl,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.28,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Text('Color: ',),
                                          Text('${product.color}', style:
                                          const TextStyle(
                                              fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 15,),

                                          const Text('Size: '),
                                          Text('${product.size}', style:
                                          const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.05),
                                                  blurStyle: BlurStyle.normal,
                                                  blurRadius: 15,
                                                  spreadRadius: 5,
                                                  offset: const Offset(0, 10),
                                                )
                                              ],
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  if (product.quantity > 1) {
                                                    product.quantity--;
                                                  } else {
                                                    product.quantity = 0;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('${product.quantity}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.05),
                                                  blurStyle: BlurStyle.normal,
                                                  blurRadius: 15,
                                                  spreadRadius: 5,
                                                  offset: const Offset(0, 10),
                                                )
                                              ],
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  if (product.quantity < 5) {
                                                    product.quantity++;
                                                  } else {
                                                    showAlertDialog(index,
                                                        orientation);
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.more_vert),
                                        onPressed: () {
                                          // Add your action here
                                        },
                                      ),
                                      const SizedBox(height: 30,),
                                      Text(
                                        '\$${(product.price * product.quantity)
                                            .toStringAsFixed(0)}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total amount: ',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        '\$${calculateTotal().toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 143, vertical: 12),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                showSnackBar());
                          },
                          child: const Text('Checkout', style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Text(
                    'My Bag',
                    style: TextStyle(
                      fontSize: orientation == Orientation.portrait ? 45 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12,),

                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.00),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.05),
                                blurStyle: BlurStyle.normal,
                                blurRadius: 15,
                                spreadRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Card(
                            elevation: 0, // Ensure no elevation
                            color: Colors.white, // Set card color to white
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              // Adjust the border radius
                            ), // Width of the border
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.asset(
                                    product.imageUrl,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.28,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Text('Color: ',),
                                          Text('${product.color}', style:
                                          const TextStyle(
                                              fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 15,),

                                          const Text('Size: '),
                                          Text('${product.size}', style:
                                          const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.05),
                                                  blurStyle: BlurStyle.normal,
                                                  blurRadius: 15,
                                                  spreadRadius: 5,
                                                  offset: const Offset(0, 10),
                                                )
                                              ],
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  if (product.quantity > 1) {
                                                    product.quantity--;
                                                  } else {
                                                    product.quantity = 0;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('${product.quantity}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.05),
                                                  blurStyle: BlurStyle.normal,
                                                  blurRadius: 15,
                                                  spreadRadius: 5,
                                                  offset: const Offset(0, 10),
                                                )
                                              ],
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  if (product.quantity < 5) {
                                                    product.quantity++;
                                                  } else {
                                                    showAlertDialog(index,
                                                        orientation);
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.more_vert),
                                        onPressed: () {
                                          // Add your action here
                                        },
                                      ),
                                      const SizedBox(height: 30,),
                                      Text(
                                        '\$${(product.price * product.quantity)
                                            .toStringAsFixed(0)}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total amount: ',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        '\$${calculateTotal().toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 143, vertical: 12),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                showSnackBar());
                          },
                          child: const Text('Checkout', style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }
        )

    );
  }

int calculateTotal() {
  int total = 0;
  for (var product in products) {
    total += product.price * product.quantity;
  }
  return total;
}


void showAlertDialog(int index, Orientation orientation) {
  showDialog(
    context: context,
    builder: (context) {
      return AppAlertDialog(
          title: "Congratulations!",
          content:
          "You have added 5 ${products[index].name.toString()} in your bag!",
          orientation: orientation);
    },
  );
}

SnackBar showSnackBar() {
  return SnackBar(
    content: const Text(
      "Congratulations! Your purchase was successful!!",
      style: TextStyle(
        fontSize: 15,
        fontFamily: "WorkSans",
      ),
    ),
    padding: const EdgeInsets.all(20.00),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.green[500],
    elevation: 5,
  );
}

}

