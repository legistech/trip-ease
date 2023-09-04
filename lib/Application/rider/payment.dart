import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String selectedPayment = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF67DCE5),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Payment Methods',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
                color: Color(0xFFCACACA),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.money,
              color: Color(0xFF67DCE5),
            ),
            title: const Text(
              'Cash',
              style: TextStyle(
                color: Color(0xFFCACACA),
              ),
            ),
            onTap: () {
              setState(() {
                selectedPayment = 'Cash';
              });
            },
            trailing: selectedPayment == 'Cash'
                ? const Icon(
                    Icons.check,
                    color: Color(0xFF67DCE5),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
