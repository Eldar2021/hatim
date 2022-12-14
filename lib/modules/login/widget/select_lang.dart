import 'package:flutter/material.dart';

import 'package:hatim/components/components.dart';
import 'package:hatim/l10n/l10.dart';

class SelectLang extends StatelessWidget {
  const SelectLang({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          context.l10n.loginPleaseSelectLang,
          key: const Key('login-select-lang-text'),
          style: TextStyle(fontSize: 24, color: colorScheme.onBackground),
        ),
        const SizedBox(height: 30),
        const Expanded(child: SelectLangFromListViewBuilder()),
      ],
    );
  }
}
