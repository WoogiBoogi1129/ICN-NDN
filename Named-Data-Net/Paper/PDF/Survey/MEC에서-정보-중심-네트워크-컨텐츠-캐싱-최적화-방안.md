# MEC에서 정보 중심 네트워크 컨텐츠 캐싱 최적화 방안 내용 정리
## 정리한 논문 : [MEC에서 정보 중심 네트워크 컨텐츠 캐싱 최적화 방안](https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11022693)
### 서론
- MEC(Multi-access Edge Computing)
    - 5G 서비스를 효과적으로 제공하기 위해 활용되는 기술이다.
    - 5G 서비스의 예
        - eMBB(enhanced Mobile BroadBand)
        - mMTC(Massive Machine Type Communications)
        - URLLC(Ultra-Reliable and Low Latency Communications)
- ICN(Information Centric Networking)
    - 컨텐츠 이름을 기반으로 라우팅을 수행하는 네트워크 기술
        - 해당 기술을 통해 컨텐츠 다운로드 시, 네트워크의 부하를 효과적으로 줄일 수 있다.
- 최근, 5G MEC 환경에서 다수의 ICN 노드 및 MEC에 컨첸츠를 캐싱하여 백홀 링크에 대한 부담을 줄이고 서비스 지연 시간 및 컨첸츠 배포 비용을 줄이는 '네트워크 캐싱 연구'가 활발히 진행중임.
- [Minimizing Energy for Caching Resource Allocation in Information-Centric Networking with Mobile Edge Computing](https://ieeexplore.ieee.org/document/8890386) 연구에서는 아래와 같은 내용을 다룸
    - 5G MEC 환경에서 ICN을 사용할 때 최소 에너지로 컨텐츠 캐싱 자원들 할당하는 캐싱 자원 할당 문제 정의
    - 에너지 소비 및 서비스 시간을 최소화하는 컨텐츠 캐싱 기법 제안
        - 위 문제들은 BSCC(Base Station Caching Capacity) 문제와 Request Matching 문제로 분류하여 최적화 방안을 제시
- [Dynamic Hierarchical Caching Resource Allocation for 5G-ICN Slice](https://ieeexplore.ieee.org/document/9552913) 연구에서는 아래와 같은 내용을 다룸
    - 동적 배치된 MEC 및 ICN 노드를 보유한 5G MEC 환경 캐싱 비용 및 에너지 소비 최적화 문제 정의
    - 최적 컨텐츠 캐싱 위치 및 MEC 수 결정 캐싱 자원 할당 기법 제안
    - 최적화 문제 도출 위한 컨텐츠 배포 비용 및 대기 시간을 활용한 ILP(Integer Linear Programming) 접근 방식 사용
    - 최적 정지 이론 기반 동적 계층 개싱 자원 할당 기법 제안
    - IEGA(Imporved Elite Genetic Algorithm) 사용 최적화 방안 제시
- 연구 목표
    - 효과적인 캐싱 기법 제안
        - 5G MEC 환경에서 ICN 서비스 제공 시, 사용되는 네트워크의 자원은 제한적이기 때문
        - 5G MEC 환경에서 ICN 캐싱은 동적 ILP 문제인 NP-Hard 이기 때문
    - 제안 기법 아이디어
        - SDN(Software Defined Network) 또는 MEC에서 계산된 컨텐츠 예상 요청 빈도를 기반으로 컨텐츠 전달 시 소비 비용을 최소화 하는 캐싱 최적화
### 본론
- 연구에서 제안하는 네트워크 환경


![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/e13d9646-82b3-4ae4-b578-665e067e9a15)
### 결론
### 추가의견