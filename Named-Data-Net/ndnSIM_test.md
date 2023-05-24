# ndnSIM을 이용한 네트워크 구현 및 성능 평가
- 해당 자료는 박상현, 임헌국."ndnSIM 기반 NDN 네트워크 구현 및 성능 평가"한국정보통신학회논문지26,5(2022):725-730. 내용을 참고하여 ndnSIM을 사용해본 결과를 나타낸다.

1. ndnSIM log 파일 생성하기
    1. ndnSIM은 시나리오 결과를 다양한 형태로 기록할 수 있는 기능을 가지고 있다. 아래는 ndnSIM에서 대표적으로 지원하는 Trace-Report 파일 생성을 설정하는 코드이다.
    ```
    ndn::L3RateTracer::InstallAll("rate-trace.txt", Seconds(1.0));
    ndn::CsTracer::InstallAll("cs-trace.txt", Seconds(1));
    ndn::AppDelayTracer::InstallAll("app-delays-trace.txt");
    ```
    - 각 Tracer 함수들이 어떤 데이터를 기록해주는지는 아래의 링크별로 정리해두었다.
        - [L3RateTracer]()
        - [CsTracer]()
        - [AppDelayTracer]()
    
    - Tracer 파일 생성 설정은 실행하고자 하는 시나리오 cpp파일에 추가하여 사용한다.


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/d7b1f8b4-150e-496b-96e8-8b3b74a7ba1e)

    - 명령어를 추가한 후 시나리오를 실행하여 Tracer Report 파일이 정상적으로 생성되었는지 확인해볼 수 있다.
    ```
    $ ./waf
    $ ./waf --run=6node-interest-100
    ```
    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/c978b48a-09a7-4194-8c47-10f7bc6093ec)


2. 6-node bottle neck NDN network
    1. 실험을 위한 기초 설정
    - Bandwidth : 1Mbps (router1과 router2 사이)
    - Delay : 10 ms
    - Data Packet Size : 1024
    - Node's Queue Size : 10 chunk
    - NDN Router's CS Cache Size : 10000 chunk
    - CS Policy : LRU
        1. ndn Stack 설정법
        - [topo-6-node.txt](Named-Data-Net/src/topologies/topo-6-node.md) 파일에서는 아래와 같은 ndn Stack을 수정할 수 있다.
            - Bandwidth
            - Delay
            - Node's Queue Size


            ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/03c379c9-b767-4fcb-a8bb-a2a9f6cf5909)


        - [6node-interest-100.cpp](Named-Data-Net/src/ndnSim-exam/6node-interest-100.cpp) 파일에서는 아래와 같은 ndn Stack을 수정할 수 있다.
            - Data Pcaket Size
            - NDN Router's CS Cache Size
            - CS Policy


            ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/7be1530a-17a1-4d00-b849-fe05e089b62c)


            ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/3cec37cc-d1c6-420d-84c7-8a36bb7e540f)


        - 논문을 기반으로 한 실험에서는 초당 생성하는 interest의 개수를 100~900개 까지 100개 단위로 값을 변경하여 진행되었다.


        ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/0efc254b-cdbf-4f8b-a022-3e39bc43926a)

        
3. 9-node grid NDN network
    1. 실험을 위한 기초 설정
    - Bandwidth : 1 Mbps
    - Delay : 10 ms
    - Node's Queue Size : 10 chunk
    - Node's Routing Policy : Best-route
        1. ndn Stack 설정법
        - [topo-grid-3x3.txt](Named-Data-Net/src/topologies/topo-grid-3x3.md) 파일에서는 아래와 같은 ndn Stack을 수정할 수 있다.
            - Bandwidth
            - Delay
            - Node's Queue Size


            ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/0c67d641-32d9-47b7-9830-462a6b78846c)


        - [9node-interest-100](Named-Data-Net/src/ndnSim-exam/9node-interest-100.cpp) 파일에서는 아래와 같은 ndn Stack을 수정할 수 있다.
            - Node's Routing Policy


            ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/13085061-9a50-4654-8e17-987433f5ec94)


4. 실험 결과
    - 여러개의 시나리오 파일을 한번에 실행시키기 위하여 bash 스크립트를 작성하여 시나리오 파일을 동작 시켰다. - [bash script](Named-Data-Net/src/Auto-Excution.sh)
    - bash script는 아래와 같이 동작시킨다.
    ```
    // 위치는 ns-3 폴더에서 실행
    $ chmod +x Auto-Excution.sh
    $ ./Auto-Excution.sh
    ```
    - Report.txt