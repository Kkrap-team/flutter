import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class MyFolder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("나의 폴더", style: TextStyles.semiBold18Black),
          const SizedBox(height: 12),
          _EmptyMyFolder(),
          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: 0,
          //   itemBuilder: (context, index){
          //     return Container(
          //       child: Text("data"),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

class FolderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 168,
                height: 168,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.greyE8E9EC, width: 1.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon_empty_link.png'),
                    Text("저장된 링크가 없어요", style: TextStyles.regular16grey),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("저장된 모든 링크", style: TextStyles.bold12Black),
                    Text("저장된 모든 링크", style: TextStyles.medium10Grey),
                  ],
                ),
                Image.asset('assets/images/icon_more.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyMyFolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 168,
                height: 168,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.greyE8E9EC, width: 1.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon_empty_link.png'),
                    const SizedBox(height: 16),
                    Text("저장된 링크가 없어요", style: TextStyles.regular16grey),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
            child: Text("저장된 모든 링크", style: TextStyles.bold12Black),
          ),
        ],
      ),
    );
  }
}
