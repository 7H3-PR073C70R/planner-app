import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:planner_app/src/core/constants/app_colors.dart';
import 'package:planner_app/src/core/constants/app_spacing.dart';
import 'package:planner_app/src/core/extensions/extensions.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';

class AddTaskPage extends HookWidget {
  AddTaskPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final categoryController = useTextEditingController();
    final dateController = useTextEditingController();
    final selectedDate = useState(DateTime.now());
    final categoryEntered = useState(false);
    final addedCategory = useState(false);
    categoryController.addListener(
      () {
        if (categoryController.text.isNotEmpty) {
          categoryEntered.value = true;
        } else {
          categoryEntered.value = false;
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Row(
              children: [
                Icon(
                  Icons.adaptive.arrow_back,
                  color: context.theme.primaryColor,
                ),
                Text(
                  'To go back',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<TaskPlannerBloc, TaskPlannerState>(
          listener: (context, state) {
            if (state.viewState.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.errorMessage ?? '',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else if (state.viewState.isSuccess) {
              if (categoryEntered.value && !addedCategory.value) {
                context.read<TaskPlannerBloc>().add(
                      SaveTaskEvent(
                        TaskEntity(
                          categoryId: state.categories
                              .firstWhere(
                                (element) =>
                                    element.name == categoryController.text,
                                orElse: () => const CategoryEntity(
                                  color: '#sample color',
                                  name: '#sample',
                                  id: 'sample',
                                ),
                              )
                              .id,
                          date: selectedDate.value.millisecondsSinceEpoch
                              .toString(),
                          name: titleController.text,
                        ),
                      ),
                    );
                addedCategory.value = true;
              }
              if (addedCategory.value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Task Added Successfully',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
                Navigator.of(context).pop();
              }
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Task',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 32,
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                const Divider(
                  thickness: 2,
                ),
                AppSpacing.setVerticalSpace(15),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: titleController,
                        hintText: 'Title',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title cannot be empty';
                          }
                          return null;
                        },
                      ),
                      AppSpacing.verticalSpaceMedium,
                      CustomTextField(
                        controller: categoryController,
                        hintText: 'Category',
                      ),
                      AppSpacing.verticalSpaceMedium,
                      CustomTextField(
                        controller: dateController,
                        hintText: 'When?',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Date cannot be empty';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_month,
                            color: context.theme.primaryColor,
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.utc(1900),
                              initialDate: selectedDate.value,
                              lastDate: DateTime.utc(2050),
                            ).then((value) {
                              if (value == null) {
                                return;
                              } else {
                                selectedDate.value = value;
                                dateController.text =
                                    DateFormat('dd/MM/yyyy').format(value);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.verticalSpaceMedium,
                Center(
                  child: SizedBox(
                    width: 95,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (categoryEntered.value) {
                          context.read<TaskPlannerBloc>().add(
                                SaveCategoryEvent(
                                  CategoryEntity(
                                    color: '#color',
                                    name: categoryController.text,
                                  ),
                                ),
                              );
                        } else {
                          addedCategory.value = true;
                          context.read<TaskPlannerBloc>().add(
                                SaveTaskEvent(
                                  TaskEntity(
                                    categoryId: '#sampleColor',
                                    date: selectedDate
                                        .value.millisecondsSinceEpoch
                                        .toString(),
                                    name: titleController.text,
                                  ),
                                ),
                              );
                        }
                      },
                      child: state.viewState.isProcessing
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                          : Text(
                              'Add',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF8F8F8),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          fillColor: Colors.transparent,
          filled: true,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
