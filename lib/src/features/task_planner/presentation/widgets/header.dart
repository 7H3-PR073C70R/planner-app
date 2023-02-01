import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner_app/src/core/constants/app_spacing.dart';
import 'package:planner_app/src/core/extensions/extensions.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.date,
    required this.completeTask,
    required this.incompleteTask,
  });

  final ValueNotifier<DateTime> date;
  final int completeTask;
  final int incompleteTask;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: date,
      child: Text(
        '$incompleteTask incomplete, $completeTask completed',
        style: context.textTheme.displayLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      builder: (_, value, child) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.utc(1900),
                        initialDate: date.value,
                        lastDate: DateTime.utc(2050),
                      ).then((value) {
                        if (value == null) {
                          return;
                        } else {
                          date.value = value;
                        }
                      });
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('MMMM dd, yyyy').format(
                            value,
                          ),
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 23,
                          ),
                        ),
                        AppSpacing.setHorizontalSpace(14),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 34,
                          color: context.theme.primaryColor,
                        )
                      ],
                    ),
                  ),
                  child!
                ],
              ),
            ),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey,
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
