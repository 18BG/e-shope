import 'package:e_shope/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  int currentIndex = 0;
  PageController _pageController = PageController();
  late UserProvider provider;

  @override
  void initState() {
    provider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
    startAutoScroll();
  }

  void startAutoScroll() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          if (currentIndex < provider.newsList.length - 1) {
            currentIndex++;
          } else {
            currentIndex = 0;
          }
          _pageController.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          startAutoScroll();
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(width * 0.03),
      width: width * 0.93,
      height: height / 2.8,
      child: Card(
        elevation: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: provider.newsList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(width * 0.03),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centrer horizontalement
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Centrer verticalement
                      children: [
                        Expanded(
                          flex: 2, // 20% of the available space
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nouveauté",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: height / 3.5,
                                child: Text(
                                  provider.newsList[index].description,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3, // Limit the number of lines
                                  overflow: TextOverflow
                                      .ellipsis, // Show ellipsis if overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8, // 80% of the available space
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                provider.newsList[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
