import 'package:flutter/material.dart';
import 'package:flutter_fingerprint/helpers/biometric_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBiometrics = false;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    // ignore: todo
    // TODO: implement initState
    isBiometricAvailable();
  }

  isBiometricAvailable() async {
    showBiometrics = await BiometricHelper().hasEnabledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBiometrics)
              ElevatedButton(
                onPressed: () async {
                  isAuthenticated = await BiometricHelper().authenticate();
                  setState(() {
                    
                  });
                },
                child: const Text(
                  'Biometric Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            const SizedBox(
              height: 50,
            ),
            if (isAuthenticated)
              const Center(
                child: Text(
                  'Well Done! Authenticated Successfully',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
