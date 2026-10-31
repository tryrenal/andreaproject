import 'package:andreaproject/features/home/presentation/feed/widgets/feed_menu_section.dart';
import 'package:andreaproject/features/home/presentation/feed/widgets/feed_profile_section.dart';
import 'package:andreaproject/features/home/presentation/feed/widgets/feed_recommended_section.dart';
import 'package:andreaproject/features/home/presentation/feed/widgets/feed_search_section.dart';
import 'package:andreaproject/features/home/presentation/feed/widgets/feed_special_offers_section.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FeedProfileSection(
                  image: 'assets/images/renal.jpeg',
                  name: 'Renaldy Sabdo',
                ),
                SizedBox(height: 16),
                FeedSearchSection(),
                SizedBox(height: 16),
                FeedSpecialOffersSection(),
                SizedBox(height: 16),
                FeedMenuSection(),
                SizedBox(height: 16),
                FeedRecommendedSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
