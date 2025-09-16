import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/screens/widgets/custom_text_form_field.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({super.key});

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  bool showTextFormField = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showTextFormField)
          CustomTextFormField(
            hintText: LocaleKeys.search.tr(),
            controller: controller,
            onFieldSubmitted: (value) {
              GoRouter.of(
                context,
              ).pushNamed(AppRoutes.searchResultScreen, extra: value);
            },
          ),
        IconButton(
          onPressed: () {
            setState(() {
              showTextFormField = !showTextFormField;
            });
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
