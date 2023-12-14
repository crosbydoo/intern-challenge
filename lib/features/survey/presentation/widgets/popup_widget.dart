import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';

class ShowPopup extends StatefulWidget {
  const ShowPopup({
    required this.data,
    required this.onItemSelected,
    super.key,
  });

  final List<Question> data;
  final void Function(Question) onItemSelected;

  @override
  State<ShowPopup> createState() => _ShowPopupState();
}

class _ShowPopupState extends State<ShowPopup> {
  late int selectedQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: SizedBox(
            height: 350,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final question = data[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedQuestionIndex = index;
                    });
                    widget.onItemSelected(question);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: index == selectedQuestionIndex
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        question.number,
                        style: StyleTypograph.label3.bold.copyWith(
                          color: index == selectedQuestionIndex
                              ? Colors.white
                              : Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
