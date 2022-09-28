import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  NetworkPage(this.errorDescription, this.retryFetchdata, {Key? key})
      : super(key: key);
  final String errorDescription;
  VoidCallback retryFetchdata;

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child:
                    Image.asset('assets/images/noun-network-error-207492.png'),
              ),
              Text(
                widget.errorDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    widget.retryFetchdata();
                  },
                  child: const Text(
                    'Retry',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
