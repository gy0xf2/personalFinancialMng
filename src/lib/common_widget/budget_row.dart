import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class BudgetRow extends StatelessWidget {
  final Map budObject;
  final VoidCallback onPressed;

  const BudgetRow(
      {super.key, required this.budObject, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var proVal = (double.tryParse(budObject["left_amount"]) ?? 0) /
        (double.tryParse(budObject["total_budget"]) ?? 0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: TColor.gray50,
                  //       borderRadius: BorderRadius.circular(10)),
                  //   alignment: Alignment.center,
                  //   width: 40,
                  //   height: 40,
                  //   child: FaIcon(
                  //     FontAwesomeIcons.burger,
                  //     color: TColor.white,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      budObject['icon'],
                      width: 35,
                      height: 35,
                      color: TColor.gray40,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budObject['name'],
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '\$${budObject["left_amount"]} left to spend.',
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${budObject["spend_amount"]}',
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'of \$${budObject["left_amount"]}',
                        style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(
                backgroundColor: TColor.gray60,
                valueColor: AlwaysStoppedAnimation(budObject['color']),
                minHeight: 3,
                value: proVal,
              )
            ],
          ),
        ),
      ),
    );
  }
}
