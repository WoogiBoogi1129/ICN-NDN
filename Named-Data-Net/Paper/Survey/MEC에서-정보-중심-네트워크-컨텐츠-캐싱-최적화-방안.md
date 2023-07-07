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
    - 최적 정지 이론 기반 동적 계층 캐싱 자원 할당 기법 제안
    - IEGA(Improved Elite Genetic Algorithm) 사용 최적화 방안 제시
- 연구 목표
    - 효과적인 캐싱 기법 제안
        - 5G MEC 환경에서 ICN 서비스 제공 시, 사용되는 네트워크의 자원은 제한적이기 때문
        - 5G MEC 환경에서 ICN 캐싱은 동적 ILP 문제인 NP-Hard 이기 때문
    - 제안 기법 아이디어
        - SDN(Software Defined Network) 또는 MEC에서 계산된 컨텐츠 예상 요청 빈도를 기반으로 컨텐츠 전달 시 소비 비용을 최소화 하는 캐싱 최적화
### 본론
- 연구에서 제안하는 네트워크 환경


![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/e13d9646-82b3-4ae4-b578-665e067e9a15)
- 논문에서 가정하는 네트워크 환경에 대한 수식
    - ICN 노드 = r
    - MEC 노드 = m
    - 컨텐츠 요청 노드 = u
    - u로 구성된 엣지 네트워크 = e
    - 컨텐츠 요청 예상 빈도


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/cd880c25-3b1b-4cfe-a439-9700b0ec57e4)
    - 예상 요청 빈도가 임계값 보다 높은 컨텐츠


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/ba56336c-8366-478b-a016-a7828a796776)
    - MEC m에 속한 모든 요청 노드에 대해 컨텐츠 C를 전달하는 소비 비용


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/ab8ae54b-e3bd-4cc5-9c0d-aefc2cbb9bb2)
    - a(c,m), a(c,r) = MEC, ICN 노드에서 컨텐츠 c의 캐싱 여부를 나타내는 값
    
    
    - 소비 비용을 최소화 하기 위한 목적함수


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/e6b20cdf-8664-433d-9e0d-18b0411a803f)
    - 목적함수의 제약 조건
    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/f9176a0d-2958-4140-9c85-01f1c4fa25a0)


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/18d912f3-d8d1-4695-82fe-4fb98b56cd4b)
    - 컨텐츠가 MEC 또는 ICN 노드에 적어도 하나 이상 캐싱 되어야 함
    - MEC에 캐싱된 컨텐츠의 크기 합이 MEC의 저장 용량보다 작아야 함
    - 위의 식들을 고려할 경우, 각 MEC가 최적화 문제를 해결하여 MEC에 캐싱할 컨텐츠를 결정함
    - 엣지 네트워크에서 요청 가능성이 높은 컨텐츠를 캐싱하기 위해 SDN 컨트롤러는 주기적으로 컨텐츠 요청 빈도를 예상함
    
    
    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/122389c7-6b56-4fec-a444-c8d21ecc34f9)
    - 엣지 네트워크 내 컨텐츠 예상 요청 빈도가 임계값보다 높거나 서로 다른 MEC에 캐싱된 동일한 컨텐츠 개수가 임계값보다 큰 컨텐츠를 아래와 같이 표현


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/a4d4bb48-9fab-4cfc-b887-69bbe51343bd)
    - 모든 요청 노드에 컨텐츠 c를 전달 시 소비 비용


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/e7fc3b51-34b9-47e7-bbdf-efa700fa13be)
    - MEC, 엣지 네트워크에 연결된 ICN 노드, 일반 ICN 노드의 소비 비용을 모두 고려한 목적함수 및 제약사항


    ![image](https://github.com/WoogiBoogi1129/ICN-NDN-Study/assets/110087545/0a6b9d24-115c-4f8c-ae5f-4e6a4653416a)
    - 위 식의 내용은 앞서 소개한 소비 비용의 목적함수와 해당 목적함수의 제약 내용과 큰 차이가 없다.
### 결론
- 5G MEC 정보 중심 네트워크 환경에서 컨텐츠 예상 요청 빈도 기반 소비 비용 최소화 캐싱 방안을 제안함
- 추후 메타 휴리스틱 알고리즘을 통해 제안 기법의 성능을 상세히 검증할 계획
### 추가의견
- 본 논문에서는 5G MEC 네트워크 환경을 중심으로 효율적인 캐싱 방안에 대해 제안하고 있다. 해당 논문에서 제안하는 방법과 같이 캐싱이나 포워딩에 대한 기법을 제안하기 전에 특정 네트워크 환경을 파악하고 특정 네트워크 환경의 특성을 활용하여 효율적인 캐싱 또는 포워딩 기법을 제안하는 것이 논리적인 논문이 나올 수 있다고 생각했다.


- 본 논문에서 제안하는 캐싱 기법인 ‘컨텐츠 예상 요청 빈도’를 계산하여 소비 비용을 최소화 하는 기법에서 DTN의 PRoPHET 기법이 떠올랐다. 이전 DTN에서 제안하는 다양한 기법들의 특성을 생각해보고 NDN 관련 논문에서 제안할 수 있을 것 같다고 생각되었다.