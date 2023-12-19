# Logging | Memo App
- 간단한 CRUD가 가능한 텍스트 메모 앱
- 2023.01 ~ 2023.04

<img src="https://github.com/yunjikimm/Logging/assets/68881093/d2565094-2c55-4bc3-8c90-9a6165b1234c" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/635f2545-251a-4c4e-add5-9b1b9c9b253e" width="200px">

## 📝 프로젝트 소개
짧은 메모를 로그처럼 남겨볼 수 있습니다.

내가 남긴 메모는 여러 번의 클릭 없이 한 번에 볼 수 있습니다.

메모는 스와이프하여 수정 및 삭제를 쉽게 할 수 있습니다.

## 🛠️ 기술 스택
- Swift, UIKit
- 아키텍처: MVC
- 라이브러리: RealmSwift, JJFloatingActionButton
- 라이트모드, 다크모드 지원
- 가로모드 미지원

## 📱 주요 화면 및 기능
#### 1. 홈
- 앱을 실행하면 바로 내가 남긴 메모를 확인할 수 있습니다.

<img src="https://github.com/yunjikimm/Logging/assets/68881093/915e9f5b-b10a-4862-8faa-182703cbe50d" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/b72412a7-72ce-4dbc-82a4-d1357e2eabd5" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/8649a9dd-0f7b-4c64-a52a-198d89d5a45d" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/ce86846d-4387-40a9-bcd6-8368d191ef2a" width="200px">

#### 2. 메모 등록
- 홈 화면에서 우측 하단의 버튼을 눌러 메모를 등록할 수 있습니다.
- 제목 입력 후 키보드의 `return` 버튼 클릭 시 커서가 내용 텍스트 필드로 이동됩니다.
- 내용 입력 시 커서가 키보드에 가려지는 것을 방지하고자 스크롤이 생성됩니다.

<img src="https://github.com/yunjikimm/Logging/assets/68881093/70dcf6ee-5723-4326-8f00-6fb9b151d17e" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/c489b163-febc-4ad7-826f-4043b040fd2a" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/f3a7aee3-ba22-45f9-ac60-a1b1344f73b2" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/737f2290-902f-4cdc-8eb0-8722ecdb05e0" width="200px">

#### 3. 메모 수정 및 삭제
- 홈 화면에서 로그를 스와이프하면 수정 및 삭제를 할 수 있습니다.

<img src="https://github.com/yunjikimm/Logging/assets/68881093/2144f727-ef9b-4804-a75f-6b23c1c2e5bb" width="200px">
<img src="https://github.com/yunjikimm/Logging/assets/68881093/6fdaaef6-419f-4ff7-880c-56ee7bdfc555" width="200px">
