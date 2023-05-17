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

3. 9-node grid NDN network
    - 9-node grid NDN network는 ndnSIM의 ndn-grid-topo-plugin.cpp 파일을 기반으로 실습을 진행할 예정이다.
    1. 논문과 동일한 ndn Stack 으로 실험을 진행한다.
    - Bandwidth : 1 Mbps
    - Delay : 10 ms
    - Node's Routing Policy : Best-route
    - Node's Queue Size : 10 chunk
        1. ndn Stack 설정법
        ```
        # topo-grid-3x3.txt
        #   /--------\	    /-\	        /-\
        #   |Consumer|<---->| |<------->| |
        #   \--------/	    \-/	        \-/
        #       ^   	     ^ 	         ^
        #       |            |           |   1Mbps/10ms delay
        #       v            v           v
        #      /-\          /-\         /-\
        #      | |<-------->| |<------->| |
        #      \-/          \-/         \-/
        #       ^   	     ^ 	         ^
        #       |            |           |
        #       v            v           v
        #      /-\	    /-\	     /--------\
        #      | |<-------->| |<---->|Producer|
        #      \-/          \-/      \--------/

        # any empty lines and lines starting with '#' symbol is ignored
        #
        # The file should contain exactly two sections: router and link, each starting with the corresponding keyword
        #
        # router section defines topology nodes and their relative positions (e.g., to use in visualizer)
        router

        # each line in this section represents one router and should have the following data
        # node  comment     yPos    xPos
        Node0   NA          3       1
        Node1   NA          3       2
        Node2   NA          3       3
        Node3   NA          2       1
        Node4   NA          2       2
        Node5   NA          2       3
        Node6   NA          1       1
        Node7   NA          1       2
        Node8   NA          1       3
        # Note that `node` can be any string. It is possible to access to the node by name using Names::Find, see examples.

        # link section defines point-to-point links between nodes and characteristics of these links
        link

        # Each line should be in the following format (only first two are required, the rest can be omitted)
        # srcNode   dstNode     bandwidth   metric  delay   queue
        # bandwidth: link bandwidth
        # metric: routing metric
        # delay:  link delay
        # queue:  MaxPackets for transmission queue on the link (both directions)
        Node0       Node1       1Mbps       1       10ms    10
        Node0       Node3       1Mbps       1       10ms    10
        Node1       Node2       1Mbps       1       10ms    10
        Node1       Node4       1Mbps       1       10ms    10
        Node2       Node5       1Mbps       1       10ms    10
        Node3       Node4       1Mbps       1       10ms    10
        Node3       Node6       1Mbps       1       10ms    10
        Node4       Node5       1Mbps       1       10ms    10
        Node4       Node7       1Mbps       1       10ms    10
        Node5       Node8       1Mbps       1       10ms    10
        Node6       Node7       1Mbps       1       10ms    10
        Node7       Node8       1Mbps       1       10ms    10
        ```
        - Bandwidth, Delay, Node's Queue Size는 시나리오파일의 Topology를 설정해주는 [topo-grid-3x3](Named-Data-Net\src\topologies\topo-grid-3x3.txt) 파일을 통해 설정할 수 있다.

        - Node's Routing Policy 는 ndn 시나리오 파일에서 아래 내용을 통해 바꿀 수 있다.
        ```
        ndn::StrategyChoiceHelper::InstallAll("/", "/localhost/nfd/strategy/best-route");
        ```
        [9node-interest](Named-Data-Net\src\ndnSim-exam\9node-interest-100.cpp) 참고

        - interest 생성 크기를 100~1100 까지 100 단위로 실험을 진행하였다.
        