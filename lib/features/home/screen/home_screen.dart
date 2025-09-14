import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/data/home_services/home_services.dart';
import 'package:news_app/features/home/widgets/custom_carosil_slider.dart';
import 'package:news_app/features/home/widgets/custom_item_card_widget.dart';
import 'package:news_app/features/home/widgets/custom_top_headline_widget.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _changeLanguage() {
    if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        toolbarHeight: 86.h,
        leadingWidth: double.infinity,
        title:  Text(
                LocaleKeys.explore.tr(),
                style: AppTextStyles.titlesStyle,
              ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              height: 32.h,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  CustormTopHeadLine(
                    name: LocaleKeys.explore.tr(),
                    onTap: () {},
                  ),
                  CustormTopHeadLine(
                    name: LocaleKeys.travel.tr(),
                    onTap: () {},
                  ),
                  CustormTopHeadLine(
                    name: LocaleKeys.technology.tr(),
                    onTap: () {},
                  ),
                  CustormTopHeadLine(
                    name: LocaleKeys.business.tr(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomCarosilWidget(
              title: "Alqiran Unveils Revolutionary AI Features",
              authorName: "Abdallah Alqiran, 7 June 2025",
              date: "07-06-2005",
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: FutureBuilder(
                future: HomeServices.getTopHeadline(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.articles.length,
                      itemBuilder: (context, index) {
                        return CustomItemCardWidget(
                          imageUrl: snapshot.data!.articles[index].urlToImage,
                          title: snapshot.data!.articles[index].title ?? '',
                          author: snapshot.data!.articles[index].author ?? '',
                          date: snapshot.data!.articles[index].publishedAt ?? '',

                        );
                      },
                    );
                  }

                  return Center(child: Text(snapshot.error.toString())); 
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _changeLanguage),
    );
  }
}
