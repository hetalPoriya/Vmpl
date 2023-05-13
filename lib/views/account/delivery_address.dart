import 'package:flutter/material.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(child: Text('Address')),
    ));
  }
}
