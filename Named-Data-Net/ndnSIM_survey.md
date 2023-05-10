# ndnSIM 내용정리
[2-ICN22-ndnSIM.pdf](Named-Data-Net/Tutourial-강의자료/2-ICN22-ndnSIM.pdf) 내용을 바탕으로 정리함.
1. ndnSIM 2.x Structure Overview   
![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/abe21877-e405-40a3-a5c4-14b053aba109)
    1. Face
        - NDN노드가 다른 네트워크의 존재하는 노드와 패킷을 송수신하는 기본 개념이다.
        - Face는 NDN패킷이 송수신되는 네트워크 인터페이스 (ex 이더넷, WiFi, 셀룰러 등) 를 나타내는 통신의 끝점이라고 생각할 수 있다. 각 Face는 NDN 노드가 다양한 프로토콜을 이용하여 서로 통신을 할 수 있는 식별자를 가지고 있다.
        - Face를 통해서 NDN은 사용 중인 특정 네트워크 기술에 상관없이 서로 통신할 수 있다.   
    2. NFD (Named Data Networking Forwarding Daemon)
        - 네트워크 노드 간의 NDN 패킷을 전달하는 소프트웨어 구성 요소이다.
        - NFD는 하나 이상의 Face(입력 인터페이스)에서 NDN 패킷을 수신하고 패킷의 포함된 콘텐츠 이름을 기반으로 Face(출력 인터페이스)에 전달하는 역할을 한다.
        - 전달 기능을 수행하는 방법
            - 콘텐츠 이름과 해당 출력 Face 간의 매핑을 포함하는 FIB(Forwarding Infomation Base)에 저장된 전달 정보를 기반으로 전달을 수행한다.
        - 그 외에도 로컬 콘텐츠 저장소 관리, 원격 노드의 관심사 처리, 다른 노드 간의 보안 및 신뢰성 관리 등의 기능들도 지원한다.   
2. ndnSim - NFD Intergration   
![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/b96ccdd5-d16c-415e-830e-895f6d9b20e2)
    1. Tables
        1. FIB (Forwarding Information Base)
            - NDN 패킷을 전달하기 위해 적절한 Face에 매핑하는 데이터 구조다. NDN은 FIB를 통해 패킷을 전달할 위치를 결정한다.
        2. PIT (Pending Interest Table)
            - 해결되지 않은 (데이터가 전달되지 않은) 관심사를 추적한다.
            - 초기 관심사가 NDN 라우터 또는 노드에 수신되면 각 라우터 및 노드는 CS에서 해당 콘텐츠를 찾고 CS에 해당 콘텐츠가 존재하지 않을 시, PIT에 관심사가 들어온 인터페이스 정보와 관심사를 저장한다.
            - PIT에는 시간 초과값도 포함되어 있어 지정된 시간 초과값이 모두 소모되면 해당 관심사는 만료된다.
            - 관심사와 일치하는 데이터를 찾으면 NDN 라우터 및 노드는 PIT를 통해 데이터를 전달해야할 인터페이스를 찾아 전달한다.
            - Congestion Control 기능을 지원한다.
        3. CS (Content Store)
            - 최근 요청된 콘텐츠의 캐시이며, NFD가 관심 콘텐츠를 네트워크의 다른 노드로 전달하는 기능을 로컬에서 수행할 수 있도록 한다.
            - CS는 콘텐츠 전달을 최적화하고 네트워크 트래픽을 줄일 수 있다.
    2. Forwarding Strategies
        - 수신된 관심사가 콘텐츠 소스로 전달되는 여러가지 Forwarding 전략을 지원한다.
        - 제공되는 기본적인 Forwarding 전략으로는 접두사 기반 전달, 멀티캐스트 전달 및 편의적 전달 등이 있다.
    3. Management
        1. Face Management
            - NDN 패킷을 송수신하는 Face를 관리한다.
            - 각 Face의 상태 구성 및 모니터링, Congestion Control 관리가 포함된다.
        2. Security and Trust Management
            - 인증서 관리, 키 교환 및 엑세스 관리 기능이 포함되어 있다.
    4. RIB(Routing Information Base) Manager
        - 토폴로지의 최신 상태를 유지하고 NDN 노드를 검색하고 추적한다.
        - 네트워크 토폴로지 업데이트에 따라 FIB를 업데이트한다.
        - LSR(Link State Routing), DVMRP(Distance Vector Multicast Routing Protocol) 등의 라우팅 프로토콜을 지원한다.
        - 접두사 등록 : 콘텐츠의 가용성을 높이는 접두사 등록을 처리한다.
        - 네트워크 속도에 따라 트래픽을 제어하여 Congestion Control 기능도 지원한다.