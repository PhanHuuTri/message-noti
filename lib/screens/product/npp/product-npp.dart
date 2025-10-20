import 'package:flutter/material.dart';

class ProductNppScreen extends StatelessWidget {
  const ProductNppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue Product NPP')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: List.generate(
            10,
            (index) => Card(
              color: Theme.of(context).cardColor,
              
              margin: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 16,
                height: MediaQuery.of(context).size.width / 2 - 16,
                // padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          'Product NPP ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Bếp gas NA-123'),
                            Text('Mặt kính chịu lực'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
