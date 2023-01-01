
<p align="middle">
<img src="./assets/images/logo.png" width="250px" height="250px"/>
</p>

<h1 align="middle"> 노나먹자 </h1>


## 노나먹자?

최근 가파르게 상승한 배달비가 사회적 문제로 관심을 받고 있습니다.

그럼에 따라 배달비와 최소 주문 금액으로 인해 1인 가구 소비자의 부담이 증가하고 커뮤니티에선 배달비 절감을 위해 배달 음식을 ‘공동 구매’하자는 글을 찾아볼 수 있습니다.

**‘노나먹자’는 이러한 소비자들에게 ‘공동 구매’모임을 만들고 참여함에 있어 애플리케이션을 통해 편리함을 제공하고자 하는 목적을 가지고 있습니다.**

## :blue_book: [프론트 개발후기](https://noisy-sulfur-8e8.notion.site/32151032935644bc80e1c10ba675a608)

<center>

![](./assets/images/Simulator%20Screen%20Shot%20-%20iPhone%20SE%20(3rd%20generation)%20-%202022-06-23%20at%2010.41.13-side.png)

</center>

# 구조

```markdown
├── lib
│   ├── blocs
│   │   ├── auth
│   │   ├── party
│   │   └── user
│   ├── model
│   │   ├── auth
│   │   ├── party
│   │   └── user
│   ├── pages
│   │   ├── EtcPage
│   │   │   └── AdditionPage
│   │   ├── MainPage
│   │   │   ├── AppBarPage
│   │   │   └── PartyPage
│   │   └── PartyHistoryPage
│   ├── resources
│   │   ├── providers
│   │   │   ├── auth
│   │   │   ├── location
│   │   │   ├── party
│   │   │   └── uesr
│   │   ├── repositories
│   │   │   ├── auth
│   │   │   ├── location
│   │   │   ├── party
│   │   │   └── user
│   │   └── service
│   └── widget
│       ├── auth
│       ├── etc
│       ├── location
│       ├── map
│       └── party
└── test
```
- BloCs
    - 각 `UI` 객체가 구독하고 있는 `BloC`객체를 담은 곳 입니다.
    - `BLoC` 객체는 `UI` 객체로 부터 이벤트를 전달받으면, `BLoC` 객체는 필요한 `Provider` 나 `Repository` 로 부터 데이터를 전달받아, `Bussiness Logic`을 처리합니다.
- Model
    - `Bussiness Logic` 의 데이터 객체를 담은 곳 입니다.
- Pages
    - 화면에 표시되는 `page` 를 담은 곳 입니다.
- Resources
    - providers
        - 실제로 서버에 데이터를 제공하거나 서버로 부터 응답을 받아오는 로직을 처리합니다.
        - 서버와의 통신을 담당합니다.
    - repositories
        - provider 가 사용해야 할 데이터를 제공하거나 제공된 데이터를 가공하여 가져옵니다.
    - service
        - `local storage` 기능, 카테고리 매핑, 정규식 등 기타 기능들을 담았습니다.
## 사용 기술
### Frontend
- `dart`
- `flutter`
- `BloC Pattern`
### Etc
- `Figma`
- `Rest Api`
- `kakao map api`
### Backend
- `spring`
- `mariaDB`
