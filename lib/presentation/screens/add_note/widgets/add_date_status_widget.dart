import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/presentation/screens/add_note/cubit/checkbox_cubit.dart';

class AddDateAndStatusWidget extends StatelessWidget {
  const AddDateAndStatusWidget({
    super.key,
    required this.checkboxCubit,
  });

  final CheckBoxCubit checkboxCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.access_time_outlined,
              size: 18,
            ),
            kWidth(5),
            const Text(
              'Date Created : ',
              style: TextStyle(fontSize: 13),
            ),
            const Spacer(),
            Text(
              '${DateTime.now()}',
              style: const TextStyle(fontSize: 13),
            )
          ],
        ),
        kHeight(20),
        Row(
          children: [
            const Icon(
              Icons.auto_mode_outlined,
              size: 18,
            ),
            kWidth(5),
            const Text(
              'Completed : ',
              style: TextStyle(fontSize: 13),
            ),
            const Spacer(),
            BlocBuilder<CheckBoxCubit, bool>(
              builder: (context, state) {
                return Transform.scale(
                  scale: 0.8,
                  child: Checkbox(
                    value: state,
                    onChanged: (bool? value) {
                      checkboxCubit.isChecked();
                    },
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
