import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/authentication/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollContoller = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollContoller.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  void initState() {
    _scrollContoller.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 150),
          child: const Text("Choose your interests"),
        ),
      ),
      body: Scrollbar(
        controller: _scrollContoller,
        child: SingleChildScrollView(
          controller: _scrollContoller,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: 40,
                    height: 1.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 130,
        child: Padding(
            padding: const EdgeInsets.only(
                bottom: Sizes.size32,
                top: Sizes.size12,
                left: Sizes.size24,
                right: Sizes.size24),
            child: CupertinoButton(
              onPressed: _onNextTap,
              color: Theme.of(context).primaryColor,
              child: const Text('Next'),
            )),
      ),
    );
  }
}
