import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class ShowPopup extends StatefulWidget {
  const ShowPopup({super.key});

  @override
  State<ShowPopup> createState() => _ShowPopupState();
}

class _ShowPopupState extends State<ShowPopup> {
  int totalItems = 40;
  int pageSize = 20;
  int currentPage = 0;

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    debugPrint('controller disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Text(
                    'Survei Quetion',
                    style: StyleTypograph.heading3.black.copyWith(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: SizedBox(
                    height: 350,
                    child: PageView.builder(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      itemCount: (totalItems / pageSize).ceil(),
                      itemBuilder: (context, index) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: List.generate(
                            pageSize,
                            (innerIndex) => Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${innerIndex + (currentPage * pageSize)}',
                                  style: StyleTypograph.label3.black.copyWith(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      onPageChanged: (page) {
                        setState(() => currentPage = page);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      (totalItems / pageSize).ceil(),
                      (pageIndex) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == currentPage
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
