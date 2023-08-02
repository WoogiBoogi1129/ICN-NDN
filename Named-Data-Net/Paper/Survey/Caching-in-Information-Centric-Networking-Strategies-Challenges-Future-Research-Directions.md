# Caching in Information-Centric Networking: Strategies, Challenges, and Future Research Directions
## I. U. Din, S. Hassan, M. K. Khan, M. Guizani, O. Ghazali and A. Habbal, "Caching in Information-Centric Networking: Strategies, Challenges, and Future Research Directions," in IEEE Communications Surveys & Tutorials, vol. 20, no. 2, pp. 1443-1474, Secondquarter 2018, doi: 10.1109/COMST.2017.2787609.
### Introduction
- 오늘날의 인터넷
    - 기존 인터넷의 목적은 장거리 통신 링크, 주변기기, 메인프레임 컴퓨터와 같이 비싸고 희귀한 리소스를 공유하기 위해 네트워크가 필요했던 시대의 통신 수요를 해결하기 위함이었다. 하지만 인터넷의 성장으로 인해 콘텐츠 배포 및 저장 리소스와 같은 새로운 요구사항이 설계에서 요구되었다.
    - 인터넷의 사용량이 점차 증가하면서 호스트 간 인터넷이 정보의 인기도에 따라 과부화 상태가 되었다.
    - 인터넷의 문제를 해결하기 위해 원래 설계의 일부가 아니었던 P2P 오버레이, CDN, NAT와 같은 다양한 애드온 패치들로 초기 인터넷 아키텍처의 한계점을 해소하는 중이다.
    

### Design Concept of ICN
- 현재 인터넷 아키텍처는 호스트 간 종단 간 통신에 의존한다. (호스트 중심 네트워킹)
    - 호스트 중심 네트워킹은 문서, 비디오, 웹 페이지 또는 기타 유형의 정보와 같은 콘텐츠를 전달하는데에 있어 비효율적이다.
    - 위와 같은 문제점을 해결하기 위해 제시된 새로운 인터넷 아키텍쳐가 ICN 아키텍쳐이다. (정보 중심 네트워킹)
- ICN의 목표
    - 원할한 콘텐츠 배포
    - 통신 서비스의 병목 현상 및 기타 장애 방지
- ICN 필요 구성 요소
    - ICN을 통한 미래 인터넷 문제점 해결을 위해 ICN 성능 평가를 제안한다.
        - 확장 가능한 라우팅 체계
        - 이름 확인
        - 캐시 관리
- 아래 논문에서는 특히 캐시 관리에 대한 기술을 설명할 예정이다.


### Related Work
- ICN 캐싱 전략 성능 평가 요소
    - cache hit(적중률)
    - stretch ratio(확장 비율)
    - eviction ratio(제거 비율)
- 위에서 서술한 세 개의 지표는 콘텐츠 검색 지연, 사용자 경험 및 네트워크 처리량과 같은 요인을 고려할 수 있다.


### The General Idea of ICN
- ICN에서의 커뮤니케이션
    - ICN은 데이터 전송 전, 소스-대상 간 연결이 설정되는 소스 기반 접근 방식을 따르지 않는다.
    - ICN은 데이터 제공 호스트가 누구인지 모른 채 콘텐츠를 요청하고 수신자가 고객에게 경로를 설정한다.
        - 위와 같은 방식을 수신기 기반 접근 방식이라고 칭하며 데이터의 흐름은 반대 경로를 따른다.
    - ICN은 콘텐츠에게 이름을 지정하여 네트워크 계층에서의 이름 지정 접근 방식을 통해 콘텐츠 검색 지연을 최소화할 수 있다.
    - ICN에서 가장 많이 사용되는 요소는 캐싱이다.


- A CCN-Based ICN Architecture
    - CCN(Content Centric Network)는 ICN의 핵심 기술 중 하나이다.
    - 아래 사진은 CCN의 아키텍쳐이다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/d4209c26-38c5-430a-8d6f-e08a82941a09)
    - CCN은 Interest, Data 두 가지 패킷을 통신에 사용한다.
    - Consumer는 Interest 패킷을 전송하고 Producer 또는 Interest가 요구하는 콘텐츠와 일치된 데이터를 가지고 있는 중계 노드의 CS로부터 Data 패킷을 반환한다.
    - 이후 CR(Content Router)은 FIB(Forwarding Information Base), PIT(Pending Interest Tabel), CS(Content Store) 세 가지 데이터 구조를 유지하여 모든 패킷을 홉 단위로 전송한다.
    - Consumer가 특정 이름에 대한 Interest 패킷을 전송하면 노드는 해당 패킷을 PIT에서 하여 해당 콘텐츠의 이름이 있을 경우, 해당 데이터를 Hop by Hop 방식으로 Consumer에게 재전송한다.
    - Data 패킷이 수신되면 라우터는 먼저 CS에 일치하는 콘텐츠 항목을 캐시한 다음 PIT에서 Longest Prefix Match를 수행하여 Data 패킷에 해당하는 항목을 추적한다.


### Caching Terminology
- 캐싱이란 데이터를 특정 위치에 저장했다가 필요할 때 사용하는 것을 의미한다.
- 웹 캐싱의 경우, 콘텐츠 사본이 구독자 근처에 저장되어 필요할 때 즉시 엑세스가 가능하다.
- 캐싱의 장점
    - 중복 콘텐츠의 전송을 제한하여 대역폭의 가용성을 향상시킬 수 있다.
    - 콘텐츠 검색 시간 단축
    - 대역폭 비용 절감 가능
- 웹 캐싱을 위해 HTTP를 사용하여 캐시 가능한 웹 콘텐츠를 결정한다.
- 웹 캐싱을 위해 프록시 캐싱은 서버 장애를 감지하고 리소스를 늘린다.
    - 하지만 프록시 캐싱은 아래와 같은 한계가 존재한다.
        - 네트워크 혼잡 시 인터넷 처리량 개선 제한
        - 콘텐츠 제공자가 고대역폭 연결에 투자해야함


### ICN Cache Management
- 기존 캐시 시스템 변경 내용에 관계없이 컨텐츠의 이름을 저장한다. 하지만 이러한 방법은 서로 다른 위치에 정보가 일관되지 않게 저장될 수 있다.
- ICN 캐시 관리를 위한 접근 방식
    - Cooperative
        - 네트워크 노드가 컨텐츠를 저장하면 해당 콘텐츠에 대한 정보를 공유함
    - Non-Cooperative
        - 네트워크 노드가 컨텐츠를 저장해도 해당 콘텐츠에 대한 정보를 공유하지 않음
        - 모든 네트워크 노드가 개별적으로 개싱을 결정함.
    - Homogeneous
        - Consumer-Producer 경로에 있는 모든 네트워크 노드가 콘텐츠 통과 시, 캐싱을 진행함
    - Heterogeneous
        - Consumer-Producer 경로에 있는 모든 네트워크 노드가 콘텐츠 통과 시, 동일한 컨텐츠를 캐싱하지 않음
    - Off-Path
        - CDN서버 배치 or 기존 프록시 캐싱과 유사함
        - 새로운 콘텐츠가 도착할 때 NRS(Name Resolution System)에 정보를 제공함
    - On-Path
        - 패킷이 도착할 시, 라우터가 NRS에 연결하지 않고, 로컬에 캐시된 사본으로 응답함.
    - 아래 사진은 ICN 캐싱 관리 방법을 이해하기 쉽게 정리한 ICN 네트워크이다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/07c410b6-89a0-4c22-98fb-5e42910b02ee)
    - Server 1에서 콘텐츠인 C5를 요청하는 것을 가정했을 때
        - 다운로드 동안 라우터 R1과 R2는 모두 Consumer-Producer 경로에 있기 때문에 C5를 캐싱함 --> Cooperative, Homogeneous함
        - R2와 R4는 Heterogeneous하며 Server 2에서 콘텐츠를 요청하면 R4는 캐싱을 진행하지만 R2와 R3는 캐싱을 진행하지 않는다.


### Existing Cache Management Strategies
- ICN에서의 콘텐츠 캐싱의 개발은 아직 초기 단계이며 다양한 기법들이 제안되고 있다.
- 아래 표는 ICN에서의 캐싱 전략을 범주로 구분한 표이다.


![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/0b06c9bd-88db-4b82-ad1a-dda849c13d0a)
- 아래 표는 특정 아키텍쳐에서 어떤 캐싱 범주를 쉽게 달성할 수 있는지에 대해 정리한 표이다.


![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/0f10ba0c-a918-4139-bf66-9d048581d025)
- Location-Based Caching
- ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/e6f63a93-b73c-49ad-af87-e4bc269a1ef1)
    - 콘텐츠가 특정 기능에 따라 지정된 노드에 캐싱된다.
    - 특정 기능은 다양한 방법으로 설계되고 있다.
    - Hash-Routing
        - Off-Path 캐싱을 위해 제안된 체계
        - 콘텐츠 요청이 엣지 라우터에 도착하면 콘텐츠 식별자를 특정 캐싱 라우터에 매핑하는 해시 함수를 계산하여 해당 특정 라우터로 요청을 전달한다.
        - 요청을 받은 라우터는 요청된 콘텐츠가 캐시에 유지되는 경우 사용자에게 반환하고 아니면 원본 소스를 전달한다.
        - 라우터가 요청된 콘텐츠를 사용자에게 전달할 때 콘텐츠 식별자와 연결된 해당 라우터만 콘텐츠를 캐시할 수 있다.
        - Hash Routing의 주요 목적은 해시 함수가 콘텐츠가 발견된 곳에 캐싱하도록 지시하기 때문에 캐싱 중복을 제거하는 역할을 한다.
        - 해당 방식은 도메인 내 링크 부하를 발생시킬 가능성이 높다.
    - Cooperative In-Network Caching(CIC)
        - ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/f9542a24-8c9d-4e32-8de9-079604ac3dcc)
        - Off-Path 캐싱 전략이다.
        - CIC는 콘텐츠가 여러 청크로 나뉘어 라우터와 같은 둘 이상의 노드에 캐싱된다.
            - 예를 들어 12개의 청크로 구성된 하나의 콘텐츠가 있고 라우터의 캐시용량이 6일 때, 청크는 분리되어 두 개의 라우터에 캐싱된다.
    - Probabilistic Caching(ProbCache)
        - TSI(Time Since Inception)이라는 필드와 TSB(Time Since Birth) 필드를 이용하여 네트워크 내의 캐시 데이터의 중복을 방지하는 기법
        - 경로 내의 캐싱된 컨텐츠를 통해 중복을 없애려하므로 On-Path 기법인 것 같다.
    - Breadcrumbs
        - 콘텐츠를 다운로드할 때 라우팅 기록을 캐싱하기 위해 각 라우터에 Trail 이라는 요소를 생성하여 유지시킴
    - Chunk Caching Location and Searching Scheme(CLS)
        - Level 1에서 히트가 발생하였을 때, 요청된 청크를 Level-1 레벨 노드로 내려 캐싱하는 방법
        - BreadCrubms 기법과 같이 라우팅 경로에 대한 기록을 저장함.
- Multi-Level Caching
    - 하나의 컨텐츠를 둘 이상의 위치에 캐싱시킴
    - Leave Copy Everywhere(LCE)
        - 요청 받아 전달되는 콘텐츠를 전달받은 모든 라우터에 해당 데이터를 캐싱함
        - On-Path 캐싱에 속함
        - Placement 캐싱에 속하고 LRU 또는 LFU의 Replacement 캐싱 기법을 통해 교체할 수 있음
    - Prob
        - 무작위 형태의 LCE 전략이다
- Single Node-Based Caching
    - 콘텐츠가 네트워크의 한 위치에만 캐시된다.
    - Leave Copy Down(LCD)
        - 히트가 발생한 노드의 바로 아래 쪽에 위치한 노드에만 캐싱이 된다.
    - Move Copy Down(MCD)
        - LCD와 유사하지만, 히트 발생 시, 기본 캐시가 아래 노드로 이동한다.
    - Cache Aware Target Identification(CATT)
        - Off-Path 캐싱 기법을 사용한다.
        - 라우터가 콘텐츠 요청을 전달하는 데 도움이 되는 콘텐츠의 예상 품질을 추가한다.
        - AS의 Edge에 CATN이라는 캐시 노드를 배포한다.
    - Betweenness-Centrality
        - 콘텐츠 경로를 따라 한번만 저장된다 (On-Path)
        - 라우터를 통과하는 최단 경로의 수가 가장 많은 라우터에 저장된다.
    - One-Touch Caching
        - 모든 요청 컨텐츠를 캐싱하고 캐시 공간이 가득차면 무작위로 교체한다.
- Popularity-Based Caching
    - 콘텐츠의 엑세스 시간 등, 콘텐츠의 사전 정의된 임계갑을 도달하면 캐싱하는 방식
    - Optimal Cache Placement Based on Content Popularity(OCPCP)
        - 저장된 콘텐츠를 기반으로 들어오는 콘텐츠의 인기도를 계산하고, 인기도 값에 따라 새로운 콘텐츠를 저장
    - Time Aware Least Recently Used(TLRU)
        - 캐시 대체 정책인 LRU, LFU의 문제점을 극복하기 위해 제안됨
        - 평균 요청 시간이 저장된 콘텐츠의 다임스탬프보다 작으면 도착하는 콘텐츠를 캐싱함
    - Network Coding Based Cache Management(NCCM)
        - 선형 네트워크 코딩(LNC)를 통해 라우팅과 캐싱 전략을 함께 고려함.
    - WAVE
        - 컨텐츠의 접속 횟수에 따라 청크가 구성된다.
    - Most Popular Content(MPC)
        - 인기도테이블(PT)를 이용하여 가장 큰 인기도를 가진 콘텐츠를 캐싱한다.
    - Fine-Grained Popularity-Based Caching(FGPC)
        - 캐시 공간이 가득차있지 않으면 모든 컨텐츠를 캐싱하고, 이후 캐시 공간이 가득찬 이후부터는 인기있는 콘텐츠만 저장한다.
- IoT-Based Caching
    - 기존 인터넷은 콘텐츠에 대한 요청을 해야 콘텐츠를 반환 받을 수 있었지만, IoT의 경우 콘텐츠를 원하는 상황이 발생했을 때, 기계가 동작을 시작하여 콘텐츠를 얻을 수 있다.
    - Client-Cache
        - 네트워크 노드에 캐싱된 콘텐츠의 유효성을 검사하는 전략
        - 
    - Tag-Based Caching Strategy(TCS)
        - 태그 필터(TP)를 기반으로 포워딩 정보 및 콘텐츠 매칭을 조회한다.
        - 콘텐츠 개체를 수신하면 해당 콘텐츠 개체를 캐시에 캐시할 지 여부를 결정한다.
    - Fixed and Mobile converged network(FMC)
        - 통합 엑세스 게이트웨이(UAG)로 작동하는 기능 노드를 통해 캐싱을 진행한다.
    - Sleep-Based Caching
        - 가장 최근 접속한 콘텐츠를 향후 사용을 위해 캐싱한다.
        - 에너지 자원을 효율적으로 사용하기 위해 슬립 메커니즘을 사용하고 컨텐츠 선택, 교체 역할을 모두 해낸다.

### Summary of Caching Strategies
- ICN 캐싱에는 Cooperative, Non-Cooperative, Homogeneous, Non-Homogeneous 등 다양한 유형이 포함된다.
- Cooperative Caching에서는 캐시된 콘텐츠에 대한 정보가 인접 노드와 공유된다.
- Non-Cooperative Caching에서는 각 노드가 정보를 공유하지 않고 캐싱 결정을 한다.
- Homogeneous Caching에서는 퍼블리셔-구독자 경로의 모든 네트워크 노드가 동일한 콘텐츠를 캐싱한다.
- Non-Homogeneous Caching에서는 퍼블리셔-구독자 경로의 모든 노드가 동일한 콘텐츠를 캐싱하지 않는다.
- On-Path Caching에서는 퍼블리셔와-구독자 간 경로 상의 라우터에서만 캐싱을 결정한다.
- Off-Path Caching에서는 퍼블리셔와-구독자 간 경로 외에도 인접 노드를 사용하여 캐싱을 수행한다.