import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/model/source_response.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final Source source;
  const TabItem({required this.isSelected, required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primaryLightColor, width: 2),
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: isSelected
              ? AppColors.whiteColor
              : AppColors.primaryLightColor,
        ),
      ),
    );
  }
}
