import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms_front/ui_kit/app_colors.dart';
import 'package:lms_front/ui_kit/card/decorated_container.dart';

//Верстка для демо

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: InkWell(
              //     // onTap: (){},
              //     child: Icon(
              //       Icons.person_outline,
              //       size: 20,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'КУРСЫ',
                    style: textTheme.titleLarge?.copyWith(fontSize: 28),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          // filled: true,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: AppColors.black),
                          ),
                          // Префиксная иконка с текстом
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Поиск',
                          hintStyle: textTheme.titleSmall,
                          // contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                        style: textTheme.titleSmall, // Цвет текста внутри поля
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SideNavigationBar(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CourseTicket(
                            title: 'Курс по Flutter',
                            description:
                                'Вы научитесь создавать современные кроссплатформенные приложения с помощью Flutter',
                            date: 'Дедлайн: 05.04.2025',
                            picture: 'assets/database.svg',
                          ),
                          const SizedBox(height: 20),
                          _CourseTicket(
                            title: 'Курс по Машинному обучению',
                            description: null,
                            picture: 'assets/project.svg',
                            date: 'Дедлайн: 05.04.2025',
                          ),
                          const SizedBox(height: 20),
                          _CourseTicket(
                            title: 'Курс по Математической статистике',
                            description: null,
                            picture: 'assets/snapshot.svg',
                            date: 'Дедлайн: 05.04.2025',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class _SideNavigationBar extends StatelessWidget {
  const _SideNavigationBar();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedContainer(
          height: 120,
          width: 200,
          color: const Color(0xff98DCBA),
          child: Text(
            'Все',
            textAlign: TextAlign.start,
            style: textStyle,
          ),
        ),
        const SizedBox(height: 18),
        DecoratedContainer(
          height: 120,
          width: 200,
          color: const Color(0xff86C1F7),
          child: Text(
            'Активные',
            textAlign: TextAlign.start,
            style: textStyle,
          ),
        ),
        const SizedBox(height: 18),
        DecoratedContainer(
          height: 120,
          width: 200,
          color: Colors.black,
          child: Text(
            'Завершенные',
            textAlign: TextAlign.start,
            style: textStyle?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _CourseTicket extends StatelessWidget {
  const _CourseTicket({
    required this.title,
    required this.description,
    required this.date,
    required this.picture,
    super.key,
  });

  final String title;
  final String? description;
  final String date;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      // height: 150,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                picture,
                // 'lms_front/assets/database.svg',
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
                    ),
                    if (description != null)
                      Text(
                        description!,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
