import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../model/all_product_list_response.dart';

class CustomProductCard extends StatelessWidget {
  final GetAllProductListResposne product;

  const CustomProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            /// Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                product.image ?? "",
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12.w),

            /// Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    product.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  /// Price
                  Text(
                    "\$${product.price?.toStringAsFixed(2) ?? 0}",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  /// Rating
                  if (product.rating != null)
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: product.rating!.rate ?? 0,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 16,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "(${product.rating!.count ?? 0})",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}