import 'package:flutter/material.dart';

class CustomNavPage extends StatefulWidget {
  const CustomNavPage({super.key});

  @override
  State<CustomNavPage> createState() => _CustomNavPageState();
}

class _CustomNavPageState extends State<CustomNavPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Center(
          heightFactor: 1,
          widthFactor: 1,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2922), // Dark background
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _navItem(0, Icons.home_outlined, "Home"),
                _navItem(1, Icons.message_outlined, "Message"),
                _navItem(2, Icons.shop_2_outlined, "Shop"),
                _navItem(3, Icons.person_outline, "Profile"),
              ],
            ),
          ),
        ),
      ),
      body: Container(), // your body content
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() {
        _selectedIndex = index;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 6 : 2,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Prevents the Row from stretching
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: isSelected
                  ? const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
              child: Icon(icon, color: isSelected ? Colors.black : Colors.grey),
            ),

            // Use AnimatedSize instead. It handles intrinsic width natively.
            ClipRect(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                alignment: Alignment.centerLeft,
                child: isSelected
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          label,
                          maxLines: 1,
                          softWrap: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : const SizedBox(width: 0), // Collapses cleanly
              ),
            ),
          ],
        ),
      ),
    );
  }
}
