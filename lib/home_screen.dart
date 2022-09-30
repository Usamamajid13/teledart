import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var telePairController = TextEditingController();
  var teleStopLossController = TextEditingController();
  var teleTakeProfitController = TextEditingController();
  var teleConversionRateController = TextEditingController();
  @override
  void initState() {
    getList();
    super.initState();
  }

  getList() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (message != null) {
        LineSplitter ls = const LineSplitter();
        List<String> masForUsing = ls.convert(message);
        if (kDebugMode) {
          print(masForUsing[0].replaceAll("Pair: ", ""));
        }
        telePairController.text = masForUsing[0].replaceAll("Pair: ", "");
        teleStopLossController.text = masForUsing[1].replaceAll("SL: ", "");
        teleTakeProfitController.text = masForUsing[2].replaceAll("TP: ", "");
        teleConversionRateController.text =
            masForUsing[3].replaceAll("Conversion Rate: ", "");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.90,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                controller: telePairController,
                decoration: const InputDecoration(
                  labelText: "Pair",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ), //normal border
                  //focused border
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                controller: teleStopLossController,
                decoration: const InputDecoration(
                  labelText: "Stop Loss",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ), //normal border
                  //focused border
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                controller: teleTakeProfitController,
                decoration: const InputDecoration(
                  labelText: "Take Profit",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ), //normal border
                  //focused border
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                controller: teleConversionRateController,
                decoration: const InputDecoration(
                  labelText: "Conversion Rate",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ), //normal border
                  //focused border
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Center(
              child: Text(
                "Sent To Binance",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
