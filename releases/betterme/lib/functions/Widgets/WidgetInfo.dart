import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//이름 규칙 |
//blank_A   : A와 A 밑/오른쪽 component 사이의 간격
//indent_A  : A의 들여쓰기 간격
//box_A     : A가 들어가게 되는 Container의 크기
//text_A    : A(text)의 텍스트 관련 정보

//전체적인 UI components의 공통적인
//크기 및 색상, 텍스트 정보 등을 정해주는 클래스
class ComponentInfo {
  //본문의 텍스트 스타일
  static const TextStyle content = TextStyle(
    fontFamily: 'NotoSans',
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Color(0xffFFFDFD),
  );
  //소제목의 텍스트 스타일
  static const TextStyle smallTitle = TextStyle(
    fontFamily: 'NotoSans',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: Color(0xffFFFDFD),
  );
}

//홈 화면의 그래프1, 2를 구성하는 UI component의
//크기 및 색상, 텍스트 정보 등을 정해주는 클래스
class HomeGraphInfo {
  double valWidth;
  double valPixel;
  late final double widthRatio; //피그마의 수치를 실제 픽셀값으로 바꿔주는 비율

  //스케일바 관련
  late final double indent_scalebar;

  //태그 관련
  late final double indent_tag; //태그 컨테이너의 들여쓰기 정도
  late final double tag_height; //태그 높이
  late final double tag_width; //태그 너비
  late final Radius tag_boundaryRad; //태그 모서리 곡률
  late final double tag_boundaryWid; //태그 모서리 두께
  late final List<Color> tag_boundaryColor; //태그 모서리 색깔
  late final Color tag_colorDefault; //태그 배경색
  late final Color tag_colorClicked; //클릭됐을 때의 태그 배경색
  late final TextStyle text_tag; // 태그 제목 정보
  late final TextStyle text_subtag; // 태그 부제목 정보
  late final double blank_tags; //각 태그 사이의 간격
  late final double blank_spaceTags; //위 태그와 아래 태그 사이의 간격

  late final double blank_tagcontainer; //태그와 그래프1 사이의 간격

  late final TextStyle text_graph1Date; //그래프1의 x축 텍스트 정보
  late final Paint xAxis; //그래프1의 x축 정보
  late final Paint ygrid; //그래프1의 y축 그리드 정보

  late final double blank_graph1; //그래프1과 그래프2 설명 사이의 간격

  late final double indent_graph2Exp; //그래프2 설명들의 들여쓰기 정도
  late final TextStyle text_graph2Exp; //그래프2 설명 텍스트 정보
  late final double blank_graph2Exp; //그래프2 설명 사이의 간격
  late final double blank_graph2ExpContainer; //그래프2 설명과 그래프2 사이의 간격
  late final Color graph2Color_sleep; //그래프2의 수면 색
  late final Color graph2Color_breakfast; //그래프2의 아침 색
  late final Color graph2Color_lunch; //그래프2의 점심 색
  late final Color graph2Color_dinner; //그래프2의 저녁 색
  late final Color graph2Color_snack; //그래프2의 간식 색

  HomeGraphInfo(this.valWidth, {this.valPixel = 364}) {
    this.widthRatio = valWidth / valPixel;

    indent_tag = 40 * widthRatio;
    tag_height = 22;
    tag_width = 65 * widthRatio;
    tag_boundaryRad = Radius.circular(5.0);
    tag_boundaryWid = 1;
    tag_boundaryColor = [
      Color(0xff858E93), //전체
      Color(0xffFFFDFD), //체중
      Color(0xffA0B1DF), //수면
      Color(0xffF2D8A7), //스트레스
      Color(0xffD2ABBA), //섭취
      Color(0xff8DBFBC), //소모
    ];
    tag_colorDefault = Colors.transparent;
    tag_colorClicked = Color(0xff3D434E);
    text_tag = TextStyle(
      fontFamily: "NotoSans",
      fontSize: 12,
      color: Color(0xffFFFDFD),
    );
    text_subtag = TextStyle(
      fontFamily: "NotoSans",
      fontSize: 9,
      color: Color(0xffFFFDFD),
    );
    blank_tags = 8 * widthRatio;
    blank_spaceTags = 10 * widthRatio;

    blank_tagcontainer = 24;

    text_graph1Date = TextStyle(
      fontFamily: "NotoSans",
      fontSize: 12,
      color: Color(0xffFFFDFD),
    );
    xAxis = Paint()
      ..color = Color(0xffFDFDFD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6;
    ygrid = Paint()
      ..color = Color(0xff546269)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    blank_graph1 = 26;

    indent_graph2Exp = 25 * widthRatio;
    text_graph2Exp = TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Color(0xffFFFDFD),
    );
    blank_graph2Exp = 9 * widthRatio;
    blank_graph2ExpContainer = 13 * widthRatio;

    graph2Color_sleep = Color(0xff48575F);
    graph2Color_breakfast = Color(0xff8DBFBC);
    graph2Color_lunch = Color(0xffF2D8A7);
    graph2Color_dinner = Color(0xffA0B1DF);
    graph2Color_snack = Color(0xffD2ABBA);
  }
}

//홈 화면의 코칭 UI components의
//크기 및 색상, 텍스트 정보 등을 정해주는 클래스
class HomeCoachingInfo {
  double valWidth;
  double valPixel;

  late final double widthRatio; //피그마의 수치를 실제 픽셀값으로 바꿔주는 비율

  late final double blank_graph1; //그래프1과 홈 디바이더 사이 간격
  late final TextStyle homeDivider; //홈 디바이더 정보
  late final double lefthomeDivider; //홈 디바이더의 왼쪽 크기
  late final double texthomeDivider; //홈 디바이더의 텍스트 부분 크기
  late final Color color_homeDivder; //홈 디바이더 색

  late final double indent_coaching; //"oo데이터 코칭+날짜" 컨테이너의 들여쓰기 크기
  late final double box_coaching; //"oo데이터 코칭" 텍스트 컨테이너 사이즈
  late final TextStyle text_coaching; //"oo데이터 코칭" 텍스트 정보

  late final double box_selectedDate; //현재 선택한 날짜의 텍스트 컨테이너 사이즈
  late final TextStyle text_selectedDate; //현재 선택한 날짜의 텍스트 정보

  late final double blank_coachingInfo; //코칭 디바이더와의 높이 간격
  late final Divider coachingDivider; //코칭 디바이더 정보

  late final Center coachingDetailDivider; //코칭 디테일 디바이더 정보

  //실제 context의 크기에 맞춰 값 생성
  HomeCoachingInfo(this.valWidth, {this.valPixel = 364}) {
    this.widthRatio = valWidth / valPixel;

    blank_graph1 = 35 * widthRatio;

    homeDivider = TextStyle(
      fontSize: 14,
      color: Color(0xffAA8F9D),
    );
    lefthomeDivider = 48 * widthRatio;
    texthomeDivider = 58 * widthRatio;
    color_homeDivder = Color(0xff6E6572);

    indent_coaching = 40 * widthRatio;
    box_coaching = 100 * widthRatio;
    text_coaching = ComponentInfo.smallTitle;

    box_selectedDate = 68 * widthRatio;
    text_selectedDate = ComponentInfo.content;
    blank_coachingInfo = 10.0;

    coachingDivider = Divider(
      indent: 24 * widthRatio,
      endIndent: 24 * widthRatio,
      color: Color(0xff858E93),
      thickness: 1,
    );

    coachingDetailDivider = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 121 * widthRatio,
            child: Divider(
              color: Color(0xff30414A),
              thickness: 1,
            ),
          ),
          SizedBox(
            width: 9 * widthRatio,
          ),
          Container(
              width: 25 * widthRatio,
              height: 25 * widthRatio,
              child: Image.asset('images/coaching_icon.png')),
          SizedBox(
            width: 9 * widthRatio,
          ),
          Container(
            width: 121 * widthRatio,
            child: Divider(
              color: Color(0xff30414A),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
