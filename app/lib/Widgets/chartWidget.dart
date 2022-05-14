import 'package:flutter/material.dart';

class chartprep extends StatelessWidget {
  final String day;
  final double spnedingamount;
  final double percentage;
  chartprep(this.day, this.spnedingamount, this.percentage);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(children: [
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(spnedingamount.toStringAsFixed(0)),
              )),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  //color: Theme.of(context).primaryColor,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(height: constraints.maxHeight * 0.15, child: Text(day)),
        ]);
      },
    );
  }
}
