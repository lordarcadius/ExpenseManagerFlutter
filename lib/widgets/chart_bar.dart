import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight * 0.08,
                child: FittedBox(
                  child: Text(
                    '₹${spendingAmount.toStringAsFixed(0)}',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
            Container(
              height: constraints.maxHeight * 0.76,
              width: 15,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.white, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
            Container(
                height: constraints.maxHeight * 0.08,
                child: FittedBox(
                    child: Text(label, style: TextStyle(color: Colors.white)))),
          ],
        );
      },
    );
  }
}
