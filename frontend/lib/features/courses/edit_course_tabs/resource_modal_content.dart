import 'package:flutter/material.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class ResourceModalContent extends StatefulWidget {
  const ResourceModalContent({super.key});

  @override
  State<ResourceModalContent> createState() => _ResourceModalContentState();
}

class _ResourceModalContentState extends State<ResourceModalContent> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Загрузка материалов',
            style: context.appTextTheme.header1,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Ссылка на материал',
                ),
                onChanged: (value) => textController.text = value,
              ),
            )),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthButton(
                    inputText: 'Сохранить',
                    hasMinumumSize: false,
                    onPressed: () {
                      // TODO: implement logic for sending value to backend

                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Отменить'),
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPalette.red,
                      textStyle: context.appTextTheme.body3,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
