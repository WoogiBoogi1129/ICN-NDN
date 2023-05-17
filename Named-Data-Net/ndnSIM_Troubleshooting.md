# ndnSIM 에러 발생 및 해결방법정리
- visualization 문제
    + 문제상황
        - 아래 명령어를 사용하여 ndnSIM 테스트를 하는 과정에서 다음과 같은 오류가 발생
        ```
        $ ./waf --run=ndn-simple --vis
        ```
        ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/24009c29-7a63-4f10-81bb-0419bdbb49a6)
        <br/>
    + 문제원인
        - ./waf 명령어를 통해 ndnSIM을 컴파일할 때 visualizer를 설치하지 않았기 때문이다. 아래 명령어를 통해 visualizer 실행 환경을 구성하면 해당 문제를 해결할 수 있다.
        ```
        /ndnSIM/ns-3 $ ./waf shell
        ```