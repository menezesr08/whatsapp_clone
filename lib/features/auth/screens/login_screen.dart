import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Enter your phone number',
        ),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text('WhatsApp will need to verify your phone number'),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: pickCountry,
            child: const Text('Pick Country'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              if (country != null) Text('+${country!.phoneCode}'),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'phone number',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.6),
          SizedBox(
            width: 90,
            child: CustomButton(
              onPressed: () {},
              text: 'NEXT',
            ),
          )
        ]),
      ),
    );
  }
}
