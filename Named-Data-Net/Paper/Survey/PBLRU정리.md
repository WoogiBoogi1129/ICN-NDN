# On Popularity-Based Load Balancing in Content Networks 정리
## T. Janaszka, D. Bursztynowski and M. Dzida, "On popularity-based load balancing in content networks," 2012 24th International Teletraffic Congress (ITC 24), Krakow, Poland, 2012, pp. 1-8.
### 서론
- 네트워크를 효율적으로 사용하기 위해서는 데이터의 흐름을 분산 시킬 필요가 있음. 이를 다중 경로 라우팅이라고 칭함.
- 다중 경로 라우팅의 장점
    - 상대적으로 제한적인 네트워크 환경에서 데이터 로스, 지연, 실패, 혼잡의 경우를 완화 및 예방할 수 있음
- 다중 경로 라우팅이 단일 경로 라우팅보다 좋은 점
    - 단일 경로 라우팅보다 Origin 서버로 향하는 경로가 길더라도 경로 상에 데이터를 캐싱할 수 있다.
    - 엑세스 노드와 Origin 서버 간 사용할 수 있는 노드의 수를 늘려 요청된 데이터가 캐시에서 전송될 확률을 높일 수 있다.
- 단일 최단 경로를 참조 라우팅 패턴으로 사용하고 다중 경로 라우팅을 결정하기 위해 ECMP(동일 비용 다중 경로)를 사용한다.
- 캐싱 교환 정책은 LRU와 PBLRU를 비교하여 사용한다.
    - PBLRU는 LRU에서 인기도 추정치를 고려하여 LRU를 업그레이드 한 정책이다.
### 
### 결론