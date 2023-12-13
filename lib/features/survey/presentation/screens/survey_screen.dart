import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/cubit/survey_cubit.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/survey_list_widget.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final prefs = sl<SharedPrefs>();
  final surveyCubit = sl<SurveyCubit>();

  final _scrollController = ScrollController();
  final _isScrolled = ValueNotifier<bool>(false);

  @override
  void initState() {
    surveyCubit.getSurvey();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_isScrolled.value) {
        _isScrolled.value = true;
      } else if (_scrollController.offset == 0 && _isScrolled.value) {
        _isScrolled.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => surveyCubit,
      child: ValueListenableBuilder(
        valueListenable: _isScrolled,
        builder: (context, value, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await surveyCubit.getSurvey();
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Halaman Survey',
                  ),
                ),
                centerTitle: false,
                backgroundColor: _isScrolled.value ? Colors.cyan : Colors.white,
                foregroundColor:
                    _isScrolled.value ? Colors.white : Colors.black,
                actions: [
                  IconButton(
                    onPressed: () {
                      prefs.clearAll();
                      Get
                        ..offAllNamed<void>('/login')
                        ..snackbar('Logout Success', 'See you next time');
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ],
              ),
              body: BlocBuilder<SurveyCubit, SurveyState>(
                builder: (context, state) {
                  return CustomScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: BlocBuilder<SurveyCubit, SurveyState>(
                                  builder: (context, state) {
                                    return SurveyListWidget(
                                      state: state,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
