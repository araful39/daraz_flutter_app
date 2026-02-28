import 'package:daraz_app/constants/app_colors.dart';
import 'package:daraz_app/features/home/data/home_controller.dart';
import 'package:daraz_app/features/home/presentation/widget/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final HomeController controller = Get.put(HomeController());
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      if (_tabController == null ||
          _tabController!.length != controller.categories.length) {
        _tabController = TabController(
          length: controller.categories.length,
          vsync: this,
        );
      }

      return Scaffold(
        appBar: AppBar(title: Text("Home Page"),centerTitle: true,),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: controller.refresh,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                _buildSliverAppBar(),
                _buildSliverTabBar(),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.categories.map((category) {
                final filtered = controller.filterProducts(category);

                if (filtered.isEmpty) {
                  return const Center(child: Text("No products found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return CustomProductCard(
                      product: filtered[index],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  // ================= Sliver AppBar =================
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 180.h,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://picsum.photos/600/300",
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  // ================= Sliver TabBar =================
  Widget _buildSliverTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabBarDelegate(
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicator: BoxDecoration(
              color: AppColors.cBA1A1A,
              borderRadius: BorderRadius.circular(20.r),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: controller.categories
                .map((c) => Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 20.h),
                  child: Tab(text: c),
                ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

// ================= Sliver Delegate =================
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverTabBarDelegate(this.child);

  @override
  double get minExtent => 55;

  @override
  double get maxExtent => 55;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}