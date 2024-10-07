import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/provider_example_one.dart';

class ProviderExampleOneScreen extends StatefulWidget {
  const ProviderExampleOneScreen({super.key});

  @override
  State<ProviderExampleOneScreen> createState() =>
      _ProviderExampleOneScreenState();
}

class _ProviderExampleOneScreenState extends State<ProviderExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    // final provider = Provider.of<ProviderExampleOne>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Provider Example")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ProviderExampleOne>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValues(val);
                });
          }),
          Consumer<ProviderExampleOne>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: Center(child: Text("Box 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(value.value)),
                    child: Center(child: Text("Box 2")),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
