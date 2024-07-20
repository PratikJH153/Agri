import 'package:agri/theme/theme.dart';
import 'package:flutter/material.dart';

class CarouselItem {
  final String title;
  final String description;
  final IconData? icon;

  CarouselItem({
    required this.title,
    required this.description,
    this.icon,
  });
}

final List<CarouselItem> carouselData = [
  CarouselItem(
    title: "Get Crop Advice",
    description: "AI-powered recommendations for healthy crops",
    icon: Icons.agriculture, // Plant icon
  ),
  CarouselItem(
    title: "ID Pests & Diseases",
    description: "Snap a pic, get diagnosis and treatment tips",
    icon: Icons.bug_report_outlined, // Bug icon
  ),
  CarouselItem(
    title: "Smart Irrigation",
    description: "Water right, save resources, grow healthy plants",
    icon: Icons.water_drop_outlined, // Water droplet icon
  ),
  CarouselItem(
    title: "Track Market Prices",
    description: "Sell smarter, not cheaper - informed decisions",
    icon: Icons.bar_chart_outlined, // Bar chart icon
  ),
];

class CarouselItemWidget extends StatelessWidget {
  final CarouselItem item;

  const CarouselItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 16,
      ),
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: const BoxDecoration(
        color: MyColors.backgroundColorLight,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            item.icon,
            color: Colors.black,
          ),
          const SizedBox(height: 16.0),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
              width: 200,
              child: Text(
                item.description,
                style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              )),
        ],
      ),
    );
  }
}
