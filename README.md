# 조표 과제용 깃헙
## 한줄 일기장
###Step 1. 첫 페이지 디자인
1. 흰 색 화면에 텍스트 필드를 하나 두고 글을 입력할 수 있게 하시오.
2. 글자수 제한을 20자로 두시오.
3. 텍스트 필드밑에 텍스트 라벨하나를 두시오.
4. 텍스트 라벨은 (0/20) 으로 초기화 하고 글자를 칠때마다 업데이트 하시오.
5. 텍스트 필드위에 라벨을 하나 두시오. 
6. 라벨 에는 오늘의 날짜가 2016년 5월 9일 (월) 형태로 표시되게 하시오.
7. 아래를 참고해서각자 해당하는 폴더에 git push 로 과제를 제출하시오.
```
터미널에서 프로젝트 폴더를 하나 생성후,
git clone https://github.com/poongd/swiftHomeworkForJo.git
프로젝트 파일을 본인 폴더에 붙여넣기
SourceTree 다운로드
SourceTree 에 git 폴더 등록
commit -> push
```
###Step 2. Data 저장.(기한 5월 22일)
1. 새로 프로젝트를 만들고, 만들때 Core Data 를 사용하게 체크하시오. **중요**
2. Step1 의 과제를 정리해서 새 프로젝트에 추가하시오.
3. 2번의 행동을 할때 [[ray wenderlich의 코딩룰]](https://github.com/raywenderlich/swift-style-guide)을 읽고 지키려고 노력해 보시오
4. 오늘의 날짜를 입력한 포맷대로 출력하는 함수를 만드시오. ("yyyyMMddHHmmSSS" 를 넣으면 "201605162307021" 형태로 출력
5. 텍스트를 입력했을때의 날짜/시간(yyyyMMddHHmmsss) + 텍스트를 DB 에 저장하시오.(Core data 이용)
6. 잘 입력했는지 값을 읽어오고 로그를 찍어보시오.

### Step 3. Table view / DB delete (기한 6월6일)
1. NoteListViewController 를 만들고 UITableView 를 삽입하시오.
2. 값이 저장되면 자동으로 NoteListViewController 가 뜨게 하시오. (어떠한 방법이든 무관)
3. UITableViewCell 을 상속받은 NoteListCell 을 만들고 날짜(요일) : 텍스트 내용이 출력되는 cell 을 만드시오.
4. 3번의 cell 에 [삭제] 버튼을 추가하시오.
5. 3번의 Cell 을 활용해서 DB 에 저장된 내용을 TableView 에 띄우시오
6. [삭제] 버튼을 눌렀을때 해당 cell 이 지워지고 (애니메이션 필요없음), DB 에서도 해당내용을 삭제하시오.
### Step 4. DB replace, update
### Step 5. 날씨 API 사용해보기
### Step 6. Autolayout
### Step 7. 난몰라 


```
**채점기준**
1. 올바른 동작(30점)
2. 올바른 구조 (30점)
3. 예상되는 버그에대한 예외처리(30점)
4. 올바른 변수명 지정(10점)
```
