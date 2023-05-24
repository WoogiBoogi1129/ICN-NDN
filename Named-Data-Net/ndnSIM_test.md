# ndnSIM을 이용한 네트워크 구현 및 성능 평가
- 해당 자료는 박상현, 임헌국."ndnSIM 기반 NDN 네트워크 구현 및 성능 평가"한국정보통신학회논문지26,5(2022):725-730. 내용을 참고하여 ndnSIM을 사용해본 결과를 나타낸다.

1. ndnSIM log 파일 생성하기
    - 다양한 ndnSIM 시나리오를 실험하여 ndn 노드에서 전달하는 Interest/Data 패킷의 속도 및 패킷의 수 등의 데이터를 얻기 위해 데이터를 추출할 ndnSIM 시나리오 파일에 아래 코드를 추가한다.
    ```
    ndn::L3RateTracer::InstallAll("rate-trace.txt", Seconds(1.0));
    //ndn::CsTracer::InstallAll("cs-trace.txt", Seconds(1));
    ndn::AppDelayTracer::InstallAll("app-delays-trace.txt");
    ```
    <br/>
    + 아래 사진은 ndn 시나리오 파일에 위 명령어를 추가한 모습이다.
    <br/>
    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/6dbb93ca-1f2c-4898-ba13-d6836fef066f)
    <br/>
    - 명령어를 추가한 후 아래 명령어를 순서대로 입력하여 변경사항을 build 한 후 실행한다.
    - 해당 실습에서는 'ndn-grid-topo-plugin-test1.cpp' 파일을 실습에 사용하였다.
    ```
    $ ./waf
    $ ./waf --run=ndn-grid-topo-plugin.cpp
    ```
    - 명령어가 성공적으로 실행되었다면 /ndnSIM/ns-3 에 'rate-trace.txt', 'app-delays-trace.txt' 파일이 생성된 것을 확인할 수 있다.

2. 6-node bottle neck NDN network
    - 6-node bottle neck NDN network는 
    1. 논문과 동일한 ndn Stack 으로 실험을 진행한다.
    - Bandwidth : 1Mbps (router1과 router2 사이)
    - Delay : 10 ms
    - Data Packet Size : 1024
    - Node's Queue Size : 10 chunk
    - NDN Router's CS Cache Size : 10000 chunk
    - CS Policy : LRU
        1. ndn Stack 설정법
        - [topo-6-node](Named-Data-Net/src/topologies/topo-6-node.md) 에서 Bandwidth, Delay, Node's Queue Size 설정 가능
        - [6node-interest-100](Named-Data-Net\src\ndnSim-exam\6node-interest-100.cpp) 에서 Data Pcaket Size, NDN Router's CS Cache Size, CS Policy 설정 가능
        ```
        ndnHelper.setPolicy("nfd::cs::lru"); // CS Policy 설정
        ndnHelper.setCsSize(10000); // NDN Router's CS Cache Size
        producerHelper.SetAttribute("PayloadSize", StringValue("1024")); // Data Pcaket Size
        ```
        - interest 크기를 100~900까지 100 단위로 실험을 진행하였다.

3. 9-node grid NDN network
    - 9-node grid NDN network는 ndnSIM의 ndn-grid-topo-plugin.cpp 파일을 기반으로 실습을 진행할 예정이다.
    1. 논문과 동일한 ndn Stack 으로 실험을 진행한다.
    - Bandwidth : 1 Mbps
    - Delay : 10 ms
    - Node's Routing Policy : Best-route
    - Node's Queue Size : 10 chunk
        1. ndn Stack 설정법
        - Bandwidth, Delay, Node's Queue Size는 시나리오파일의 Topology를 설정해주는 [topo-grid-3x3](Named-Data-Net\src\topologies\topo-grid-3x3.md) 파일을 통해 설정할 수 있다.

        - Node's Routing Policy 는 ndn 시나리오 파일에서 아래 내용을 통해 바꿀 수 있다.
        ```
        ndn::StrategyChoiceHelper::InstallAll("/", "/localhost/nfd/strategy/best-route");
        ```
        [9node-interest](Named-Data-Net\src\ndnSim-exam\9node-interest-100.cpp) 참고

        - interest 생성 크기를 100~1100 까지 100 단위로 실험을 진행하였다.

4. 실험 결과
    - 여러개의 시나리오 파일을 한번에 실행시키기 위하여 bash 스크립트를 작성하여 시나리오 파일을 동작 시켰다. - [bash script](Named-Data-Net\src\Auto-Excution.sh)
    - bash script는 아래와 같이 동작시킨다.
    ```
    // 위치는 ns-3 폴더에서 실행
    $ chmod +x Auto-Excution.sh
    $ ./Auto-Excution.sh
    ```
    - Report.txt