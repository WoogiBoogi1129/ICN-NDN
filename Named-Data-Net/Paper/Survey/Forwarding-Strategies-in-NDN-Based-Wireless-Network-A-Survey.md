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
        - PIT(Pending Interest Table)
            - PIT는 아래의 내용들이 포함되어 있다.
                - Interest 패킷의 이름
                - 입력 Face, 출력 Face
            - PIT는 Interest 패킷의 집계 및 Congestion Control과 같은 다양한 용도로 활용될 수 있다.
        - CS(Content Store)
            - Data 객체의 네트워크 내 캐싱에 사용된다.
            - CS는 캐시된 객체가 존재하는 경우, 생산자 대신 Interest 패킷을 충족하여 Data를 전송할 수 있다.
            - 포워딩 전략 모듈은 패킷 전달에 대한 정책 또는 규칙이다.
            - 네트워크 노드를 통해 Consumer는 Data 객체의 Interest를 보낸다.
            - Interest 패킷은 라우터를 통해 Producer를 향해 전달된다.
            - Producer는 Interest와 관련된 Data 객체를 전송하여 소비자에게 Data 패킷을 전달한다.


- NDN Architectural and Protocol Design Principles
    - NDN은 모래시계 형태로 구생되어 있다.
    - 현재 IP는 보안적으로 부족한 부분이 발견되고 있으며 해당 부분은 점점 더 취약해지고 있는 추세이다.
        - 반면, NDN에서 기본적으로 제공되는 보안은 NDN 계층에서 모든 데이터의 이름을 기반으로 인증을 하는 형식이다.
    - NDN은 네트워크 장애 상황 개선 기능과 강력한 애플리케이션 기능에 대한 개선이 가능하다.
    - 안정적인 네트워크 운영을 위해 필요한 요소
        - 자체적인 네트워크 트래픽 조절
        - Stateful한 포워딩 기능 제공
        - 패킷과 데이터의 flow control 기능
    - NDN 라우터는 위 요소들을 모두 제공한다.
    - NDN 아키텍쳐 발전의 핵심은 단대단 통신의 한계를 완화하는 것이다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/bddc47bb-bd20-4e72-a922-20290e754a21)


    - 아래 사진은 NDN의 포워딩 모델을 그림으로 나타낸 그림이다. 해당 그림을 통해 FIB, PIT, CS의 기능들을 확인해볼 수 있다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/50df4f80-1400-4087-a0ee-58f4216ccb0c)


    - NDN Protocol의 원칙은 어떻게 이루어져 있는가?
        - Universality
            - 모든 네트워크 환경과 애플리케이션을 위한 공통 네트워크 프로토콜은 NDN이어야 한다. 이러한 이유로 NDN 패킷 형식은 확장 가능하고, 유연해야 한다.
        - Data-Centricity and Data Immatability
            - Data 패킷은 정확하게 가져와야 하며, Interest 패킷을 사용하여 요청하는 NDN에 의해 고유한 이름을 가져야한다.
        - Securing Data Directly
            - 데이터 패킷은 안전해야 하며 이동성의 영향을 받지 않아야 한다.
        - Hierarchical Naming
            - 패킷은 구조화된 컨텍스트를 나타내고 다중화를 활성시키기 위해 계층적인 이름을 가져야 한다.
        - In-Network Name Discovery
            - Interest 패킷을 검색하고 불완전한 이름을 식별하는 능력을 가진다.
        - Hop-by-Hop Flow Balance
            - Hop 단위의 흐름 제어를 통해 각 노드의 링크 부하 문제를 해결할 수 있다.


- Limitations of IP vs NDN
    - 현 IP 아키텍쳐의 문제점은 무엇인가?
        - 이동성, 라우팅 및 포워딩, 콘텐츠 배포, 네트워크 보안, 콘텐츠 캐싱 기능 등의 문제가 많다. 현재는 해당 문제를 해결하기 위해 임시방편이 존재하지만, 모든 문제를 완전히 해결할 수는 없는 상황이다.
        - Stateful 하지 않다.
        - 데이터 플래인 성능을 지속적으로 관찰할 수 없다.
        - 병목 현상을 초래한다. IP 프로토콜의 경우 임의의 경로를 따라 목적지로 데이터를 전송하기 때문에 해당 과정에서 병목 현상을 발생시킨다.
    - IP와 NDN의 성능을 비교하는 지표는 무엇이 있는가?
        - 대표적으로 Delay, Throughput, Packet Drop이 존재한다.
    - IP와 NDN의 성능비교표


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/6c2b1daf-d9ec-41e6-b25c-8e01086effa3)


- Forwarding in Wireless Ad Hoc Networks
    - Ad Hoc Network란?
        - 분산형 무선 네트워크로 AP(Access Point)나 라우터와 같은 기존 인프라에 의지하지 않는다는 특징이 있다. 각 노드가 포워딩 및 라우팅 프로세스에 참여하기 때문에 라우팅 알고리즘과 네트워크 연결에 따라 동적인 프로세스가 가능하다.
    - Ad Hoc Network의 문제점
        - 경로 손실, 간섭 다중 결로 쉐도잉, 페이딩 효과와 같은 손상으로 신호 전파에 부정적인 영향을 받을 수 있다. 이러한 손상은 패킷 오류 및 패킷 손실을 일으키며 메시지 배포 제어에 영향을 미칠 수 있다.
        - 브로드캐스트 형태의 무선 채널은 패킷 중복 및 충돌 문제가 발생할 수 있다. 분산 채널 엑세스는 무선 네트워크에서 캐리어 감지를 기반으로 하며, 처리량 변경으로 인해 노출된 단말기와 숨겨진 단말기에서 문제를 발생시킬 수 있다.
        - 토폴로지 변경으로 인해 오리지 네트워크 세분화로 이어져 라우팅 성능에 영향을 미칠 수 있고, 제한된 리소스로 인해 주기적으로 연결 상태가 나빠질 수 있다.
    - 무선 네트워크의 종류
        - MANET
        - WSN
        - VANET
        - WMN


- Forwarding in NDN Based Mobile Ad Hoc Networks
    - MANET이란?
        - Mobile Ad Hoc Network의 약자로 모바일 디바이스들이 무선으로 연결되고 인프라 없이 지속적으로 자체 구축이 가능한 네트워크이다.
    - MANET의 단점
        - 독립적으로 디바이스를 어느 방향으로든 이동하고 다른 디바이스와의 링크를 자주 변경하기 때문에 빠르게 변화하는 토폴로지에서 패킷 손실이 크게 발생한다.