# notification
notification의 경우, 원하는 이벤트를 출력해야하므로 정형화된 패키지는 없습니다.
pub.dev의 https://pub.dev/packages/flutter_local_notifications 문서를 참고해주십시오.

또한, 이하의 패키지들은 모두 서버 내지 데이터베이스와 실시간으로 통신합니다.
따라서 async, wait 구문을 빠트리면 작동하지 않습니다.

# message
message 패키지입니다.
이 패키지는 크게 5가지 dart파일과 1개의 fire store외부 데이터베이스로 구성되어있습니다.
message와 같이, firestore stream 방식으로 feedback이 제공되기 때문에 feedback 제공이 필요할 경우
이 프로젝트에 제공된 형식으로 피드백 코드를 작성하시면 됩니다.

여지껏 코드에서 다뤄보시지 못한 문법이 많을 수 있어 읽기에 어려운 부분이 있을 수 있습니다.
그 부분에 대해선 이 readme 파일에서 다루고 있습니다.

#signin.dart
프로젝트를 실행할 시에 처음으로 나타나는 화면입니다.
구글 로그인 기능을 실행하게 되면, auth의 signInWithGoogle(BuildContext context)메서드를 실행합니다.
이 메서드의 경우, 구글 로그인을 실행하고 이를 firestore 데이터 베이스에 넣습니다.
이 부분이 52줄 이후의 DatabaseMethos().addUserInfoRoDB(userDetails.uid, userInfoMap) 형태로 시행됩니다.

따라서 signin의 백엔드와 관련해 바꿀부분은 없습니다.

DB관련 건의사항이 있다면 담당자 서경덕에게 연락해주십시오.

#home.dart
home화면에서는 간략한 유저 검색기능을 제공합니다.
등록된 유저 이름 중, 주어진 문자열이 포함된 유저 리스트를 등록 순서로 제공하며,
abc 오름차순 정렬을 원할경우 orderby method를 추가하거나, 결과 리스트를 정렬하여 출력하시면 됩니다.

또한, 데이터 베이스에 데이터를 저장하거나, 호출하는 경우 데이터는 모두 Map의 형태입니다. 
이 Map을 이용하는 방법은 chatroom.dart의 streambuilder 파트를 참고해 주십시오. from line 59~

추가적인 기능에는 chatroom id generator 함수가 있습니다.
예를들어, 이 함수는 AA과 AB라는 유저에 대해, 두 유저의 이름을 알파벳순으로 정렬해
AA_AB형태의 챗룸아이디를 만들어 데이터베이스에 저장합니다.
또 이 아이디를 chatroom.dart에 제공하여 각 채팅들이 이 챗룸 아래에 배정될 수 있도록합니다.

#chatroom.dart
chatroom입니다. chatroom의 경우 stream이라는 새로운 데이터 타입을 다룹니다.
stream은 주어진 데이터가 변동이 있을 시, 이를 호출하여 앱에 실시간으로 반영해주는 datatype입니다.
따라서 async와 wait이 준필수적으로 사용되며, 수정해야할 경우 flutter의 streambuilder공식문서를 참고해 주십시오.

이 dart파일의 경우 데이터베이스에서 채팅기록을 호출하고, 이를 시간순으로 나열합니다.
또한 사용자가 보낸 채팅인 경우 오른쪽에, 그 외에는 왼쪽에 배정하여 제공합니다.

채팅은 12개의 영어+숫자 코드로 기록되어 저장되기 때문에 서로다른 두개의 채팅 id가 충돌할 확률은 0에 가깝습니다.
하지만, 이 때문에 데이터베이스에서 채팅 로그를 읽기 어려울 수 있습니다.

따라서 데이터베이스에서 채팅로그를 확인하실때는, zoom회의에서 말씀드린 시간순 정렬기능을 사용해 주십시오.,
