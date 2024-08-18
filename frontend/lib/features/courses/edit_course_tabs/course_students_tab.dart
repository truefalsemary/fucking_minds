import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/features/shared/presentation/page_view_horizontal_padding.dart';

class CourseStudentsTab extends StatefulWidget {
  const CourseStudentsTab({super.key});

  @override
  State<CourseStudentsTab> createState() => _CourseStudentsTabState();
}

class _CourseStudentsTabState extends State<CourseStudentsTab> {
  final _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageViewHorizontalPadding(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomSlidingSegmentedControl<int>(
                      initialValue: 1,
                      children: const {
                        1: Text('Студент'),
                        2: Text('Преподаватель'),
                        3: Text('Администратор'),
                      },
                      decoration: BoxDecoration(
                        color: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      thumbDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCirc,
                      onValueChanged: (v) {},
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        prefix: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.search),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 6,
                        ),
                        controller: _queryController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DataTable(
                        columnSpacing: 16,
                        columns: const [
                          DataColumn(label: Text('Фамилия')),
                          DataColumn(label: Text('Имя')),
                          DataColumn(label: Text('Отчество')),
                          DataColumn(label: Text('Контакты')),
                          DataColumn(label: Text('Прогресс')),
                          DataColumn(label: Text('Средний балл')),
                          DataColumn(label: Text('Пройдена регистрация')),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text('Иванов')),
                              DataCell(Text('Иван')),
                              DataCell(Text('Иванович')),
                              DataCell(Text('ivan.ivanov@example.com')),
                              DataCell(Text('80%')),
                              DataCell(Text('85')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Петров')),
                              DataCell(Text('Петр')),
                              DataCell(Text('Петрович')),
                              DataCell(Text('petr.petrov@example.com')),
                              DataCell(Text('75%')),
                              DataCell(Text('78')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Сидоров')),
                              DataCell(Text('Сидор')),
                              DataCell(Text('Сидорович')),
                              DataCell(Text('sidor.sidorov@example.com')),
                              DataCell(Text('90%')),
                              DataCell(Text('92')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Кузнецов')),
                              DataCell(Text('Алексей')),
                              DataCell(Text('Алексеевич')),
                              DataCell(Text('aleksey.kuznetsov@example.com')),
                              DataCell(Text('70%')),
                              DataCell(Text('72')),
                              DataCell(
                                Align(
                                  child: Icon(
                                    Icons.not_interested_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Смирнов')),
                              DataCell(Text('Артем')),
                              DataCell(Text('Игоревич')),
                              DataCell(Text('artem.smirnov@example.com')),
                              DataCell(Text('85%')),
                              DataCell(Text('88')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Фёдоров')),
                              DataCell(Text('Владимир')),
                              DataCell(Text('Александрович')),
                              DataCell(Text('vladimir.fedorov@example.com')),
                              DataCell(Text('77%')),
                              DataCell(Text('80')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Попов')),
                              DataCell(Text('Максим')),
                              DataCell(Text('Валерьевич')),
                              DataCell(Text('maxim.popov@example.com')),
                              DataCell(Text('82%')),
                              DataCell(Text('86')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Орлов')),
                              DataCell(Text('Сергей')),
                              DataCell(Text('Юрьевич')),
                              DataCell(Text('sergey.orlov@example.com')),
                              DataCell(Text('88%')),
                              DataCell(Text('90')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Григорьев')),
                              DataCell(Text('Павел')),
                              DataCell(Text('Григорьевич')),
                              DataCell(Text('pavel.grigoryev@example.com')),
                              DataCell(Text('95%')),
                              DataCell(Text('97')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Егоров')),
                              DataCell(Text('Андрей')),
                              DataCell(Text('Николаевич')),
                              DataCell(Text('andrey.egorov@example.com')),
                              DataCell(Text('78%')),
                              DataCell(Text('80')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Калинин')),
                              DataCell(Text('Олег')),
                              DataCell(Text('Михайлович')),
                              DataCell(Text('oleg.kalinin@example.com')),
                              DataCell(Text('71%')),
                              DataCell(Text('74')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Лебедев')),
                              DataCell(Text('Вячеслав')),
                              DataCell(Text('Станиславович')),
                              DataCell(Text('vyacheslav.lebedev@example.com')),
                              DataCell(Text('85%')),
                              DataCell(Text('89')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Борисов')),
                              DataCell(Text('Игорь')),
                              DataCell(Text('Владимирович')),
                              DataCell(Text('igor.borisov@example.com')),
                              DataCell(Text('79%')),
                              DataCell(Text('82')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Ковальчук')),
                              DataCell(Text('Юрий')),
                              DataCell(Text('Геннадьевич')),
                              DataCell(Text('yuriy.kovalchuk@example.com')),
                              DataCell(Text('83%')),
                              DataCell(Text('86')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Данилов')),
                              DataCell(Text('Георгий')),
                              DataCell(Text('Федорович')),
                              DataCell(Text('georgiy.danilov@example.com')),
                              DataCell(Text('72%')),
                              DataCell(Text('75')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Миронов')),
                              DataCell(Text('Роман')),
                              DataCell(Text('Игоревич')),
                              DataCell(Text('roman.mironov@example.com')),
                              DataCell(Text('88%')),
                              DataCell(Text('91')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Тимофеев')),
                              DataCell(Text('Максим')),
                              DataCell(Text('Вячеславович')),
                              DataCell(Text('maxim.timofeev@example.com')),
                              DataCell(Text('81%')),
                              DataCell(Text('85')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Шевченко')),
                              DataCell(Text('Петр')),
                              DataCell(Text('Семенович')),
                              DataCell(Text('petr.shevchenko@example.com')),
                              DataCell(Text('89%')),
                              DataCell(Text('93')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Головин')),
                              DataCell(Text('Станислав')),
                              DataCell(Text('Анатольевич')),
                              DataCell(Text('stanislav.golovin@example.com')),
                              DataCell(Text('80%')),
                              DataCell(Text('84')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Киселев')),
                              DataCell(Text('Юрий')),
                              DataCell(Text('Станиславович')),
                              DataCell(Text('yuriy.kiselev@example.com')),
                              DataCell(Text('77%')),
                              DataCell(Text('79')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Лазарев')),
                              DataCell(Text('Алексей')),
                              DataCell(Text('Владимирович')),
                              DataCell(Text('aleksey.lazarev@example.com')),
                              DataCell(Text('74%')),
                              DataCell(Text('76')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.not_interested_outlined,
                                  color: Colors.red,
                                ),
                              )),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Степанов')),
                              DataCell(Text('Андрей')),
                              DataCell(Text('Александрович')),
                              DataCell(Text('andrey.stepanov@example.com')),
                              DataCell(Text('84%')),
                              DataCell(Text('87')),
                              DataCell(Align(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
