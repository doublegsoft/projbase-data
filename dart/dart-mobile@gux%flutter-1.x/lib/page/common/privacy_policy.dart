import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicy extends StatefulWidget {

  PrivacyPolicy({Key? key}) : super(key: key);

  @override
  PrivacyPolicyState createState() => PrivacyPolicyState();
}

class PrivacyPolicyState extends State<PrivacyPolicy> {

  String _fileContent = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAssetContent();
    });
  }

  Future<void> _loadAssetContent() async {
    try {
      // 1. Load the asset using rootBundle.loadString().
      String content = await rootBundle.loadString('asset/text/privacy-policy.txt'); // Replace with your asset path

      // 2. Update the state to display the content.
      setState(() {
        _fileContent = content;
      });
    } catch (e) {
      setState(() {
        _fileContent = 'Error loading asset: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('隐私协议'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( 
            child: Text(_fileContent),
          ),
        ),
      ),
    );
  }
}