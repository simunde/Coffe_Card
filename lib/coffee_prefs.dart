import 'dart:ffi';

import 'package:flutter/material.dart';

class CoffeePrefs extends StatefulWidget {
  const CoffeePrefs({super.key});

  @override
  State<CoffeePrefs> createState() => _CoffeePrefsState();
}

class _CoffeePrefsState extends State<CoffeePrefs> {
  int strength = 1;
  int sugars = 1;
  var t = 1;
  void onSugarPressed() {
    setState(() {
      sugars = sugars < 5 ? sugars + 1 : 0;
    });
  }

  void onStrengthPressed() {
    setState(() {
      strength = strength < 5 ? strength + 1 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Strength: '),
            for (int i = 0; i < strength; i++)
              Image.asset('android/assets/img/coffee_bean.png',
                  color: Colors.brown[100],
                  colorBlendMode: BlendMode.multiply,
                  width: 25),
            const Expanded(child: SizedBox(width: 50)),
            FilledButton(
                onPressed: onStrengthPressed,
                style: FilledButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.brown),
                child: const Text("+"))
          ],
        ),
        Row(
          children: [
            const Text('Sugars: '),
            if (sugars == 0) const Text('No Sugars...'),
            for (int i = 0; i < sugars; i++)
              Image.asset('android/assets/img/sugar_cube.png',
                  width: 25,
                  color: Colors.brown[100],
                  colorBlendMode: BlendMode.multiply),
            const Expanded(child: SizedBox(width: 50)),
            FilledButton(
                onPressed: onSugarPressed,
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white),
                child: const Text("+")),
          ],
        )
      ],
    );
  }
}
