import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/characters/enum.dart';
import 'package:shappitest/core/characters/provider.dart';
import 'package:shappitest/core/characters/view_model.dart';
import 'package:shappitest/ui/contants.dart';

class GenderDropDownBar extends ConsumerWidget {
  const GenderDropDownBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CharactersViewModel viewModel =
        ref.read<CharactersViewModel>(charactersViewModel.notifier);
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Layout.large, horizontal: Layout.medium),
      color: Colorss.mainYellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Filter by:',
            style: Typographies.b0,
          ),
          Spacing.spacingH8,
          DropdownButton<CharactersGender?>(
            value: ref.read(genderProvider.notifier).state,
            hint: const Text('Gender'),
            icon: ref.read(genderProvider.notifier).state != null
                ? IconButton(
                    onPressed: () => viewModel.switchGenderFilter(),
                    icon: const Icon(
                      Icons.delete_forever,
                    ),
                  )
                : null,
            onChanged: (CharactersGender? gender) =>
                viewModel.switchGenderFilter(newGender: gender),
            items: CharactersGender.values
                .map(
                  (CharactersGender e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.value),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
