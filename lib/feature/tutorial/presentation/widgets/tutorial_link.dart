import 'package:flutter/cupertino.dart';
import 'package:krap/common/styles/text_styles.dart';

class TutorialLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 68, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // ✅ 가로 정렬 기준 왼쪽으로
        children: [
          Text('저장하고 싶은', style: TextStyles.bold28Black),
          Row(
            children: [
              Text('링크', style: TextStyles.bold28Primary),
              Image.asset('assets/images/icon_link.png'),
              Text('를', style: TextStyles.bold28Black),
            ],
          ),
          Text('모두 불러오세요', style: TextStyles.bold28Black),
          const SizedBox(height: 35),
          Image.asset('assets/images/tutorial_link.png'),
        ],
      ),
    );
  }
}
