# 👼🏻 AHMH
> 제 4회 데이터 걸스데이 참여를 위해 개발한 아이디어이며 대상(행정안전부장관상)을 수상하였습니다.
> 
> 서버를 제외한 UI 및 기능 개발이 완료되었습니다.
> 
<p float="left">
 <img src = "https://user-images.githubusercontent.com/77603632/147430352-f5aea310-383e-4fed-9782-e04f2126f655.jpeg" width="300" height="450">
</p>

## 🗣 앱 소개
+ AHMH란?
> 아하마하는 위치를 기반으로 한 육아 정보를 통합하여 보여주는 육아 통합 플랫폼입니다.
+ 개발 기간
> 2021.11
> 
### - 온보딩 화면
<img src = "https://user-images.githubusercontent.com/77603632/147429525-d0a3894e-b1bf-4a5c-95f9-1946cb752a54.gif" width="300" height="450">

> + 앱 실행 시 온보딩 화면을 넣어 사용자가 해당 앱에서 제공되는 기능을 한 눈에 알 수 있습니다.
> + 구글과 애플 계정 연동을 통해 추가적인 계정 생성없이 간편하게 로그인할 수 있습니다.

### - 홈화면
<img src = "https://user-images.githubusercontent.com/77603632/147432121-3dcf3951-a85d-4529-86a0-d7f495dd7fdc.gif" width="300" height="450">

> + 연령대 별 커뮤니티, 정부 지원책, 추천 도서 소개, 육아 컬럼 정보를 제공합니다.


### - 육아정보 화면
<img src = "https://user-images.githubusercontent.com/77603632/147430144-8b6ffd20-6d83-4639-ad46-80fc49f23957.gif" width="300" height="450">

> + [공공데이터 포털](https://www.data.go.kr/index.do) 에서 제공하는 공동육아나눔터 및 공동육아방 정보를 사용자에게 제공합니다.
> + 해당 놀이방의 상세정보(지도, 홈페이지, 운영 시간 등)을 제공합니다.

### - 돌보미 화면
<img src = "https://user-images.githubusercontent.com/77603632/147430067-45d094a4-15b9-4662-a42d-2a9487e74e55.gif" width="300" height="450">

> + 사용자 근처의 돌보미 목록을 보여줍니다.
> + 돌보미 상세 정보를 볼 수 있고, 해당 돌보미와 채팅을 할 수 있습니다.

### - 마이페이지
<img src = "https://user-images.githubusercontent.com/77603632/147429954-9ad3fdaa-1f64-4c2c-8c21-9b553ba99c6f.gif" width="300" height="450">

> + 연동된 계정에서 사용자의 이름, 프로필 사진, 이메일 정보를 받아옵니다.
> + 사용자의 위치 정보를 등록할 수 있습니다.
> + 돌보미로 등록하고자 하는 사용자는 돌보미 등록 절차를 진행할 수 있습니다.


## 🔎 주요 기능
#### 1. Google 및 Apple 로그인
> + Firebase를 사용하여 계정을 따로 생성하지 않고 구글 및 애플 계정을 사용한 간편한 로그인
> 
#### 2. 위치 기반 정보 시스템
> + CLLocationManager를 사용하여 사용자의 위치 정보 받아옴

#### 3. 공공데이터를 활용한 정보 제공
> + [공공데이터 포털](https://www.data.go.kr/index.do) 의 공공데이터를 csv파일로 처리하여 사용자에게 제공

#### 4. 온보딩 화면
> + 앱 진입 시 온보딩 화면을 제공하여 사용자에게 해당 앱에서 제공하는 기능을 간략하게 알려줌

#### 5. 웹페이지 연결
> + SFSafariViewController를 사용하여 웹페이지로 진입




## 💻 개발 환경
                                                                                                                                           
1. Xcode 버전
> + 12.5.1

2. Swift 버전
> + Swift 5
                                                                                                                                   
3. 사용한 라이브러리
> + Firebase - 'Firebase/Core', 'Firebase/Database', 'Firebase/Firestore', 'Firebase/Storage'
> + GoogleSignIn
> + MessageKit
> + JGProgressHUD

### 📝 추후 개선 예정
+ Storyboard로 작성된 UI 코드로 작성
+ MVVM 패턴 적용
