# BetterMe
App for 2021 TS222

///////

### 본 앱의 목적:
  체중에 영향을 주는 후천적 요소로 활동량과 운동량, 식단, 수면, 스트레스가 있다. National Institutes of Health(NIH)는 다이어트를 실패하는 원인으로 잘못된 활동과 식사 습관, 스트레스 조절 등을 어려움으로 꼽고 있다. 그러므로 건강하고 성공적인 다이어트를 위해선 이러한 다양한 요소들이 고려되어야 하며, 삶 전반의 변화를 필요로 한다. 

  하지만 기존에 이루어지고 있는 다이어트는 두가지 문제가 있다. 

  첫째, 다이어트를 위해 개인은 위에 이야기한 체중에 영향을 주는 요소 1-2가지만을 고려하여 다룬다. 전문가가 개입된다고 해도 이러한 경우가 많다.

  둘째, 다이어트 프로그램을 도와주는 전문가(의사, 영양사, PT 트레이너 등)가 환자나 회원에게 다이어트에 관련된 주요 요소들을 모두 다루고자 할 때 이를 실천하기 위한 종합적 데이터 수집, 관리 및 감독을 할 수 있는 도구가 존재하지 않는다. 다이어트 프로그램을 진행하는 데 있어 기록과 소통을 위해 사용할 수 있는 도구 중 현존하는 플랫폼은 단순 이미지나 영상만을 공유할 수 있기 때문에 제한적이다.

  한편, 현재에는 웨어러블 기기 등을 통해 개인에 대한 여러 데이터를 쉽게 모을 수 있는 상황이며, 이러한 데이터가 제대로 수집 및 이용되지 않고 그대로 휘발되고 있다. 따라서, 본 연구에서는 이와 같은 데이터를 기반으로, 다이어트와 관련한 문제를 해결하기 위해 다음과 같은 해결책을 제안한다.

  1. 다이어트를 하려는 사용자와 그를 돕는 전문가를 연결시켜 준다.
  2. 사용자의 수면, 식단, 활동 등의 생활 데이터를 수집하여 전문가와 실시간으로 공유하여 효과적인 상담을 도와주는 서비스를 제공한다.

  즉, 웨어러블 기기를 통해 사용자의 수면, 식사, 심박수 등의 데이터를 통합적으로 수집한다. 그리고 이를 전문가와 공유하여 데이터를 바탕으로 다이어트 프로그램을 진행한다. 이를 통해 전문가가 사용자의 기억에 의존하지 않는, 객관적인 정보들을 파악하여 더욱 효과적인 피드백을 제공할 수 있도록 하는 것이 목적이다.

///////

### 앱의 각 기능(link):
https://www.notion.so/44857f388b60475a8d078aab5d7d170

### 기능 요구사항 및 개발 일정(link):
https://www.notion.so/32b60f03d650463aab1e504b236c8cb0

///////

위와 같은 앱 구성을 위해, 아래와 같은 규칙으로 github에서 자료를 관리한다.

### 폴더 관리
- master
    - 최종 어플 파일이 올라가는 곳. 실제 배포를 할 때에는 여기에 있는 코드만 배포를 한다.
- test
    - 실제 개발이 이뤄지는 곳. checkpoint를 만들기에 충분하다고 판단될 경우, 이 폴더의 모든 내용을 master에 복사한다.
    - flutter project를 만들면 생기는 모든 하위 구조 + assets + ... 등등이 하위 경로로 존재할 예정.
- packages
    - 기능과 관련해서 독립적으로 패키지를 만들고 관리하는 장소.
    각 하위 폴더의 이름은 한글로 기능이 무엇인지 드러날 수 있도록 적는다.
        - 기능은 백엔드와 프론트엔드 모두를 포함한다.
    - 각 패키지를 완성했을 경우 해당 패키지를 test에 복사한다.
- docs
    - UI
        - UI와 관련된 문서들이 존재하는 곳. 와이어프레임, 컬러코드, 기능정의
    - SRS
    - ref
        - 개발하는 도중에 인용된 논문, 참고자료, 사이트 등을 올려놓는 장소.
        - site.md
            - 참고한 사이트 링크와 관련 설명
    - written
        - 개발을 위해 작성된 문서들이 존재하는 곳.
    - resources

- README.md
    - 앱 목적, 각 기능, 요구조건, 예시 시나리오 등에 대해 세부적으로 작성

### About Issue

- 슬랙과의 차이점
    - 공론화해야하는 문제가 발생했을 경우에 깃허브를 사용
        - 예시) 다운그레이드를 해야할 때 등
- Title 양식
    - 자유, 가능하면 직관적으로
    - 예시)
        - "40차 회의", "3번 페이지의 A3-1 위치를 바꾸었으면 좋겠습니다"
- label 규칙
    - Develop 관련 label
        - 에러 | 아예 코드 실행이 안 됨
        - 이상함 | 실행은 되나, 예상했던 결과와 다름
    - 테스트 관련 label
        - 오류보고 | 코드 로직은 맞으나 변수 설정 등을 잘못하여 예상치 못한 상황이 발생했을 때
        - 개선사항 | 문제 없이, 예상한 대로 잘 작동했으나 개선될 필요가 있어보일 때
    - 일반적 label
        - 회의 | 각 회의에서 결정된 사항 정리
        - 자료요청 | 관련 논문, 레퍼런스, 문서 등의 자료를 요청할 때
        - 질문 | 개발과 관련하여 질문이 생겼을 때
            - 간단한 질문은 slack에서, 코드를 함께 보며 묻고 답해야 하는 질문은 이 label에서 진행한다.

### About branch

(branch에 대한 보다 자세한 내용은 https://backlog.com/git-tutorial/kr/stepup/stepup1_1.html을 참고할 것)

- 대부분의 개발 작업은 develop 브랜치에서 이루어진다. 보다 자세한 설명은 다음과 같다 :
    - 새로운 애자일을 만들고자 할 때, develop 브랜치에서 갈라지는 새로운 하위 브랜치를 만든다.
    - 해당 애자일에서 요구되는 기능을 제작 및 수정할 때마다 하위 브랜치 상에 commit한다.
    - 해당 애자일이 완성되었을 경우, 만들었던 하위 브랜치를 develop 브랜치에 merge한다.
- 마일스톤을 달성할 때마다 develop 브랜치에서 갈라지는 release 브랜치를 만든다.
    - 이때, 브랜치의 이름은 release-[master 기준 앱 버전].[해당 버전에서의 릴리즈 버전]으로 통일한다.
    - develop에서 다음 마일스톤을 향해 달려가는 동안, release 브랜치에서 코드를 점검하고 수정한다.
    - 해당 release 버전이 완성되면 이를 각각 master 브랜치와 develop 브랜치에 merge한다.
- master 브랜치에는 배포 가능한 최종 형태의 코드가 올라간다.
- 이미 master 브랜치로 올라간 버전에서 급히 수정해야 할 것이 생긴 경우, master 브랜치에서 갈라지는 hotfix 브랜치를 만든다.
    - 이때, 브랜치의 이름은 hotfix-[master 기준 앱 버전].[해당 버전에서의 hotfix 버전]으로 통일한다.
    - 수정이 완료되었으면 이를 각각 master 브랜치와 develop 브랜치에 merge한다.

### About commit

- [XXXXX] OOOO
    - XXXXX | 헤더

        feat: 새로운 기능에 대한 커밋
        fix: 버그 수정에 대한 커밋
        build: 빌드 관련 파일 수정에 대한 커밋
        docs: 문서 수정에 대한 커밋
        style: 코드 스타일 혹은 포맷 등에 관한 커밋
        refactor:  코드 리팩토링에 대한 커밋
        restructure: 폴더 및 파일 재구성에 관한 커밋 
        resources: UI & 아이콘 관한 커밋 

    - OOOO | 세부설명
        - 제목과 본문을 빈 행으로 구분한다
        - 제목을 50글자 내로 제한
        - 제목 첫 글자는 대문자로 작성
        - 제목 끝에 마침표 넣지 않기
        - 제목은 명령문으로 사용하며 과거형을 사용하지 않는다
        - 본문의 각 행은 72글자 내로 제한
        - 어떻게 보다는 무엇과 왜를 설명한다
    - 예시)

        [feat] sqflite (X) → [feat] 내부 데이터베이스의 CRUD 기능을 만듦

### 주의사항

- reset를 하지 말 것
    - 불가피하게 다운그레이드가 필요한 경우에는, 모든 인원이 합의한 후 개발팀장의 지도 하에 soft reset을 진행한다.

### Coding Style 

written by 백호, from Notion.

Effective Dart Coding Style

- 해당 파트 정리에 있어서, PREFER(하면 좋다)는 임의로 적어두었음.
- 해당 파트 정리에 있어서, 현재 우리가 코딩하는 단계에서 불필요한 내용, 또는 오히려 헷갈릴 듯한 내용은 적지 않았음. (대체로 '이런이런거 쓰지 마라' 라고는 하는 부분인데, 클린 코드로는 비효율적이지만, 코딩 초보로서는 있어도 괜찮거나 있는게 좋을 법한 부분)

- Before reading
    - 기본 원칙
        1. Be consistent
        2. Be brief
        
    - 약어
        - A library member is a top-level field, getter, setter, or function. Basically, anything at the top level that isn’t a type.
        - A class member is a constructor, field, getter, setter, function, or operator declared inside a class. Class members can be instance or static, abstract or concrete.
        - A member is either a library member or a class member.
        - A variable, when used generally, refers to top-level variables, parameters, and local variables. It doesn’t include static or instance fields.
        - A type is any named type declaration: a class, typedef, or enum.
        - A property is a top-level variable, getter (inside a class or at the top level, instance or static), setter (same), or field (instance or static). Roughly any “field-like” named construct.

- Styles: [https://dart.dev/guides/language/effective-dart/style](https://dart.dev/guides/language/effective-dart/style)
    - Identifiers
        - UpperCamelCase: 첫글자 포함, 띄어쓰기 때마다 대문자
        - lowerCamelCase: 첫글자 제외, 띄어쓰기 때마다 대문자
        - lowercase_with_underscores: 띄어쓰기 대신 _ 사용

    - Class / Type & Extensions - UpperCamelCase.
        - class, enum types, typedef, type parameter, Extension 등.
        - metadata annotations에 포함되는 class들도 포함.

    - library, packages, directories, source files, prefixes - lowercase_with_underscores
        - import 'package:alpaca_is_the_best' as alpaca_best ;   (O)
        - import 'package:alpaca_is_the_best' as alpacaBest;   (X)

    - Other identifiers - lowerCamelCase
        - class members, top-level definitions, **variables**, **parameters**, named parameters, constant...

    - 단어 나열 약어는 전부 대문자, 한 단어 약어는 맨 앞만 대문자.
        - Input / Output = IO  (O)       Io  (X)  -> class IOPort {}
        - Idenfification = Id (O)       ID  (X)  → class IdCard {}
        - Http  (O)       HTTP  (X) → class HttpConnection {}

- 금지사항
    - Leading underscore 금지.
    - prefix letters 금지:  defaultTimeout (O)    kDefaultTimeout (X)
    - 한 줄에  80자가 넘는 코드. (URl or file path or Multi-line strings 예외)

- Import 순서
    - import: dart → package → related imports
    - all imports → export section
    - 알파벳순 정렬.
        - Good Example

            import 'dart:async';

            import 'dart:html';

            import 'package:bar/bar.dart';

            import 'package:foo/foo.dart';

            import 'foo.dart';

            import 'foo/foo.dart';

            import 'src/error.dart';

            import 'src/foo_bar.dart';

            export 'package:bar/bar.dart';

            export 'src/foo_bar.dart';

- Documentation(주석)

     [https://dart.dev/guides/language/effective-dart/documentation](https://dart.dev/guides/language/effective-dart/documentation) 

    - 최대한 한 문장으로, 간결하고 완성된 문장으로 작성
    - 문단인 경우, 첫 문장은 분리 및 요약.
        - Good Example

            /// A는 이렇게 해줘.

            ///

            /// 무슨 말이냐면 A에서 D를 넣고, C에서는 굳이 d가 필요 없
            /// 을 것 같아. 그러니까 A에서만 가져오자.

    - 블록 x. 줄 주석. (// 이용.     /**/ 이용 금지)

    - Document member를 위한 코멘트나 types에 대한 건 /// 사용

    - Variable, getter, setter, 함수, 함수의 역할 등 주체가 되는 명확한 대상으로 주석이 시작하면 이해하기 쉽다. 특히, library나 type이 무엇인지가 있으면 좋음.
        - Good Example

            /// Returns 'true' if every element satisfies the [predicate].

            bool all(bool predicate(T element)) ⇒ ...

            /// **The number** of checked buttons on the page

            int get checkedCount ⇒ ...

    - [ ] 활용 할 것. [ ] 안에는 예상되는 값이나 전달자의 종류가 포함된다.  →     /// Throws a [StateError] if ...

    - metadata annotations 전에 주석을 넣어라.

        ///여기에 주석 넣을것

        @Component(selector: 'toggle')

        ///여기에 주석 넣지 말고

        class ToggleComponent {}

    - 코드 주석은 backtick으로 분리.

        ///이건 그냥 주석

        /// 

        /// ``` 

        /// var example = CodeBlockExample();

        /// print(example); // ALPACA

        /// ```

- Usage [https://dart.dev/guides/language/effective-dart/usage](https://dart.dev/guides/language/effective-dart/usage)
    - Null
        - Dart는 변수가 nullable일때, 기본적으로 null로 시작. 따라서 null임을 굳이 명시해 줄 필요 없다.
        - null 값을 ??를 이용해 boolean으로 사용 가능하다

            null을 false로 쓰길 원한다면: if (someThing?.isEnabled ?? false) { function}

    - Strings
        - 인접한 string은 그냥 작성. + 불필요. → function('string 1' 'string 2')
        - value가 섞인다면 + 대신 $ 사용, 함수가 아닌 simple identifier라면 {}불필요 → 'Hi, $name Today is ${A-B}'

        - Collections
            - Iterable.forEach() 대신,  그냥 for(var A in b ) 사용.
            - 결과의 type을 바꿀 게 아니라면, List.from(collection) 대신 collection.toList() 사용.
            - type으로 필터링할 때에는 whereType() 사용.
            - cast() 사용 피해라.

    - Collections
        - Iterable.forEach() 대신,  그냥 for(var A in b ) 사용.
        - 결과의 type을 바꿀 게 아니라면, List.from(collection) 대신 collection.toList() 사용.
        - type으로 필터링할 때에는 whereType() 사용.
        - cast() 사용 피해라.

    - Function
        - 함수 정의 (void)를 사용해라. var 말고.
        - 매개변수의 초기값은 : 대신 =로 설정해라.

    - Variables
        - var & final은 일관된 규칙에 따라 사용해라.
            - var로 정의되지 않은 local variables에서만 final을 쓴다거나,
            - 모든 local variables에서 var만 사용하고 final은 쓰지 않는다거나.

        - 너도 할 수 있는 계산을 컴퓨터 시키지 마라.

    - Constructors
        - 변수 지정 간략화
            - Example

                class Point{

                double x,y;

                Point(double x, double y): x=x, y=y;     → bad

                Point(this.x, this.y); → good

                }

        - 빈 body에는 {} 대신 ; 사용 → Point(this x, this y){}   (X)

        - 불필요한 new, late 사용 X.

        - 반복적인 const 사용 X.

            const primaryColors = const[const Color('red', const[255,0,0]),];     (X)

            const primaryColors = [Color('red', [255,0,0]),];   (O)

- Design [https://dart.dev/guides/language/effective-dart/design](https://dart.dev/guides/language/effective-dart/design)
    - Names
        - 일정하고, 명확하고, 모두가 아는 용어 사용. 약어는 피해라.

            pageCount   updatePageCount    Point  → good.

            renumberPages   convertToSomething     Cartesian   → bad.

        - boolean or variable은 positive하게.

            isConnected     hasData   → good.

            isDisconnected    isEmpty   → bad.

        - get으로 시작하는 method 이름은 피해라.

         

        - 어떤 object의 state를 새 object로 옮긴다면 to__()  : list.toSet()    stacTrace.toString()     dateTime.toLocal()

        - 원래의 object에서 다른 것을 얻어온다면 as__() :

            var map = table.asMap();

            var list = bytes.asFloat32List();

            var future = subscription.asFuture();

        - 매개변수 이름은 사용하지 마라

            list.addElement(element)   →    list.add(element)

            map.removeKey(key)   →    map.remove(key)

    - Type : 모든 변수의 type을 알 수 있게 적되, 반복해서 적진 말아라.
        - mixin type 정의를 위해서는 mixin을 사용해라.
        - 변수 정의시 initializer 대신 type을 사용해라. : var parameters → List<AstNode> parameters
            - 그러나 반복정의를 할 필요는 없다. (앞선 const 남발금지와 같은 맥락. 위에서 type 정했으면 그냥 var로 정의해라)

        - 함수와 그 매개변수 정의시, return값의 type을 명시해라.
            - 매개변수 이름이 type과 같다면, 반복해서 언급하지 말아라.
            - 함수 내에서, 이미 위에서 언급된 type을 또 언급하지 말아라.

                class Point {

                double x, y;

                Point(double this.x, double this.y);    →    Point(this.x, this.y);

                }

        - 빈 변수에 들어갈 값이 언급되지 않았다면 명시해두라.

            var playerScores = {};   →   var playerScores = <String, int> {};

            - 언급되었다면 반복언급 x.

                final Completer<String> response = Completer<String> ();

                →   final Completer<String> response = Completer();

        - Setter는 항상 void를 return하므로, type을 명시하지 말아라.

            void set foo(Foo value)    →    set foo(Foo value)

