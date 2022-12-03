import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPercent;

  const ChartBar(this.label, this.spending, this.spendingPercent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spending.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercent > 0.0 ? spendingPercent : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            )),
        const SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}
