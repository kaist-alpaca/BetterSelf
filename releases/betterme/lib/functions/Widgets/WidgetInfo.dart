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

//홈 화면의 주간코칭 UI components의
//크기 및 색상, 텍스트 정보 등을 정해주는 클래스
class HomeInfo {
  double valWidth;
  double valPixel;

  late double widthRatio; //피그마의 수치를 실제 픽셀값으로 바꿔주는 비율

  late double indent_coaching;
  late double box_coaching;
  late TextStyle text_coaching;

  late double box_selectedDate;
  late TextStyle text_selectedDate;

  late double blank_coachingInfo;
  late double indent_coachingDivider;
  late Divider coachingDivider;

  HomeInfo(this.valWidth, {this.valPixel = 364}) {
    this.widthRatio = valWidth / valPixel;

    indent_coaching = 40 * widthRatio; //"oo데이터 코칭+날짜" 컨테이너의 들여쓰기 크기
    box_coaching = 100 * widthRatio; //"oo데이터 코칭" 텍스트 컨테이너 사이즈
    text_coaching = ComponentInfo.smallTitle; //"oo데이터 코칭" 텍스트 정보

    box_selectedDate = 68 * widthRatio; //현재 선택한 날짜의 텍스트 컨테이너 사이즈
    text_selectedDate = ComponentInfo.content; //현재 선택한 날짜의 텍스트 정보

    blank_coachingInfo = 10.0; //코칭 디바이더와의 높이 간격

    //코칭 디바이더 정보
    coachingDivider = Divider(
      indent: 24 * widthRatio,
      endIndent: 24 * widthRatio,
      color: Color(0xff858E93),
      thickness: 1,
    );
  }
}
