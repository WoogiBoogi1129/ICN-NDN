# Forwarding Strategies in NDN-Based Wireless Networks: A Survey 정리
## Asadullah Tariq, Rana Asif Rehman , Member, IEEE, and Byung-Seo Kim , Senior Member, IEEE
### 초록
- NDN(Named Data Networking)은 CCN(Content Centric Networking) 접근 방식을 기반으로 제안된 미래 인터넷 아키텍처이다.
- 기존 인터넷 프로토콜(TCP/IP)의 경우 장치의 위치를 중심으로 통신을 구성하지만 사용자들은 장치의 위치보다는 콘텐츠에 가장 큰 관심을 둔다. NDN은 이러한 사용자들의 목적에 맞게 콘텐츠를 중심으로 통신을 구성한다.
- NDN기반 무선 네트워크의 포워딩 메커니즘은 기존 통신 메커니즘인 MANET, WSN, VANET, 그리고 WMN의 효율적인 통신을 지원하기에 중요한 요소로 작용할 수 있다.
- 본 논문에서는 강력하고 효율적인 컨텐츠 배포를 가능케하는 NDN 포워딩 전략을 기존 통신 메커니즘에 적용시킨 내용과 무선 환경에서의 포워딩과 관련된 향후 과제를 소개한다.


### Introduction
- NDN이란?
    - 미래의 유망한 인터넷 아키텍쳐 후보로 평가받는 콘텐츠 중심 네트워크 기술이다.
    - 분산된 무선 시스템에 유리한 기능들을 제공할 수 있다.
    - NDN은 통신 시, IP를 고려할 필요가 없다.
    - NDN의 목표는 오늘날의 IP 아키텍쳐를 콘텐츠의 이름으로 정형화 시키는 것이다.
    - NDN의 핵심은 두 개의 데이터 타입을 기반으로 네트워크 내에서 통신을 한다.
        - data types : interest, data
        - Interest Packet : 소비자가 네트워크로 요청한 콘텐츠의 데이터 조각의 이름이 포함되어 있다.
        - Data Packet : Interest Packet의 포함된 컨텐츠 이름과 같은 데이터를 포함하고 있다.
    - NDN의 기능
        - 네트워크 캐싱
        - 위치 독립적 데이터
        - 가벼운 포워딩
        - 보안
        - 혼잡 제어
        - 문제 링크 우회
    - NDN은 모래시계 형태를 하고 있는 TCP/IP 아키텍쳐와 크게 차이가 없다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/52c1d01e-a924-4f70-98e0-cd7bcd25ebd9)


- NDN의 요구사항
    - 빠른 가변 길이의 계층적 이름 기반 검색 기능
    - 대량 포워딩 테이블 기능
    - 패킷 당 DATA 상태 업데이트 기능
    - 지능적인 포워딩 전략 & 캐싱


- 본 논문에서 다루고자 하는 내용
    1. NDN 기반 무선 환경 및 메시 네트워크의 포워딩 문제
    2. NDN 아키텍쳐, 어플리케이션 및 시스템 서비스, NDN 설계 원칙, 오늘날의 IP 아키텍쳐와의 비교
    3. MANET, VANET, WSN, 그리고 WMN의 포워딩 전략
    4. NDN 포워딩 연구 및 미해결 과제, 향후 방향성


### NDN Architecture & Comparison with IP
- NDN은 기존 TCP/IP의 형태와 비슷한 아키텍쳐 구조를 가지고 있다.


- NDN Packet & Router Structure
    - NDN 통신은 Interest 패킷과 Data 패킷으로 구성되어 있다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/200aa5af-5d52-4071-93ee-07aca7dbc34e)
    - 라우터 아키텍쳐에서 NDN 라우터의 데이터 구조
        - FIB(Forwarding Information Base)
            - 라우터에서 데이터 생성자에게 Interest 패킷을 전달할 때 사용한다.
            - FIB 테이블의 각 항목에는 이름 접두사, Producer로 향하는 다음 홉을 표시하는 면 집합이 포함된다.