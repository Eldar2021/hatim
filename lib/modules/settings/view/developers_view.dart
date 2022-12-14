import 'package:flutter/material.dart';
import 'package:hatim/components/components.dart';
import 'package:hatim/constants/contants.dart';
import 'package:hatim/l10n/l10.dart';

class DevelopersView extends StatelessWidget {
  const DevelopersView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profileForDevelopers),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          children: [
            Text(
              context.l10n.profileForDevelopers,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Text(
              context.l10n.profileDevsDesc,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            CustomButtonWithIcon(
              onPressed: () {},
              text: 'GitHub',
              icon: Assets.icons.github.svg(
                color: colorScheme.onBackground,
                height: 35,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
