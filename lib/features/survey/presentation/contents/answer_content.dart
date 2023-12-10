import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class AnswerContent extends StatefulWidget {
  const AnswerContent({super.key});

  @override
  State<AnswerContent> createState() => _AnswerContentState();
}

enum SingingCharacter {
  biasa,
  tertarik,
  sangatTertarik,
  biasaSaja,
}

class _AnswerContentState extends State<AnswerContent> {
  final ValueNotifier<SingingCharacter?> _characterNotifier =
      ValueNotifier<SingingCharacter?>(SingingCharacter.tertarik);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            'Answer',
            style: StyleTypograph.label1.black,
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        _buildListTile(SingingCharacter.tertarik, 'Tertarik'),
        _buildListTile(SingingCharacter.biasa, 'Biasa'),
        _buildListTile(SingingCharacter.sangatTertarik, 'Sangat Tertarik'),
        _buildListTile(SingingCharacter.biasaSaja, 'Biasa Saja'),
      ],
    );
  }

  Widget _buildListTile(SingingCharacter character, String title) {
    return ListTile(
      title: Text(title),
      leading: ValueListenableBuilder(
        valueListenable: _characterNotifier,
        builder: (context, SingingCharacter? value, child) {
          return Radio<SingingCharacter>(
            activeColor: Colors.cyan,
            value: character,
            groupValue: value,
            onChanged: (SingingCharacter? newValue) {
              _characterNotifier.value = newValue;
            },
          );
        },
      ),
    );
  }
}
