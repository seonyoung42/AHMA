# 👼🏻 AHMH
> 제 4회 데이터 걸스데이 참여를 위해 개발한 아이디어이며 대상(행정안전부장관상)을 수상하였습니다.
> 
> 서버를 제외한 UI 및 기능 개발이 완료되었습니다.
> 
<p float="left">
  
<img src = "https://user-images.githubusercontent.com/77603632/147093736-d62f56b8-6c22-4b43-95c7-9b62aa3f74af.jpeg" width="300" height="450">
                       
</p>

+ AHMH란?
> 아하마하는 위치를 기반으로 한 육아 정보를 통합하여 보여주는 육아 통합 플랫폼입니다.
+ 개발 기간
> 2021.11

## 🔎 주요 기능
#### 1. Google 및 Apple 로그인
> + Firebase를 사용하여 계정을 따로 생성하지 않고 구글 및 애플 계정을 사용한 간편한 로그인
#### 2. 위치 기반 정보 시스템
> + CLLocationManager를 사용하여 사용자의 위치 정보 받아옴
#### 3. 공공데이터를 활용한 정보 제공
> + [공공데이터 포털](https://www.data.go.kr/index.do) 의 공공데이터를 사용자에게 제공
#### 4. 온보딩 화면
> + 앱 진입 시 온보딩 화면을 제공하여 사용자에게 해당 앱에서 제공하는 기능을 간략하게 알려줌
> 
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
