import 'package:flutter/material.dart';
import 'package:goldsilver/network/dio_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getGoldPrice();
    getSilverPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
          "Today Price",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GOLD',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 16,
                          shadows: const [
                            BoxShadow(
                              color: Colors.orange,
                              offset: Offset(
                                2,
                                2,
                              ),
                              blurRadius: 3,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(
                        "assets/gold.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$goldI💲',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'SILVER',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 16,
                          shadows: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                2,
                                2,
                              ),
                              blurRadius: 3,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(
                        'assets/silver.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' $silverI💲',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 20,
                          shadows: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                2,
                                2,
                              ),
                              blurRadius: 3,
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double? goldD;
  int? goldI;

  double? silverD;
  int? silverI;

  getGoldPrice() {
    DioHelper.getData("XAU/USD/").then((value) {
      setState(() {
        goldD = value.data['price_gram_24k'];
        goldI = goldD!.round();
      });
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  getSilverPrice() {
    DioHelper.getData("XAG/USD/").then((value) {
      setState(() {
        silverD = value.data['price'];
        silverI = silverD!.round();
      });
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
