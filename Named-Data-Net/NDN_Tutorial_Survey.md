NDN_Tutorial 정리   
link : https://www.youtube.com/watch?v=8-uzOf77Wag
==================================================
1. NDN의 기본적인 개념
- NDN은 기본적으로 널리 알려진 네트워크 5계층에 있어 가운데 Internet Protocol 대신 Named-Data-Protocol로 바꾸는 것에 있다.   
![image](https://user-images.githubusercontent.com/110087545/235481669-406c8a07-d354-4095-b87b-19ac5f89e34c.png)
2. 기존 TCP/IP와 NDN의 차이   
![image](https://user-images.githubusercontent.com/110087545/235824932-f71d45f8-2061-4f5f-a223-46464445546e.png)   
- TCP/IP
    + 기존 TCP/IP는 Port Number를 이용한 Demultiplexing을 수행했다.
    + 기존 IP에는 Congestion Control할 방법이 없으므로 TCP가 해당 기능을 제공한다.
    + 안정적인 데이터 전송이 가능하다.
    + <b>모든 데이터는 Point-to-Point IP 연결로 이루어진다.</b>
- NDN
    + Demultiplexing을 Name을 이용하여 Demultiplexing을 수행한다.
    + Network 계층에서 Congestion Control을 수행한다.
    + TCP/IP의 안정적인 데이터 전송의 기능을 그대로 유지한다.
   
- 안정적인 데이터 전송   
    안정적인 데이터은 쉬운 작업이 아니다. 그렇다면 NDN에서는 어떻게 안정적인 데이터 전송 기능을 유지할 수 있을까?   
    + 1번 상황 : 하나의 전송 서비스가 신뢰할 수 있는 전송 요구사항이 다른 앱을 지원할 수 있는가?
        + TCP/IP의 문제 : TCP/IP의 단일 크기가 모든 어플리케이션에 적합하지는 않다.   
    ![image](https://user-images.githubusercontent.com/110087545/235827152-8f797540-e619-4ac7-9ea7-0d9135eb1619.png)
    + 2번 상황 : 하나의 전송서비스가 여러개의 앱이 원하는 로컬 제약에 따라 데이터를 재단하여 보낼 수 있는가?
        + 1번 상황에서의 TCP/IP의 한계점과 같이 제한적인 상황이 발생할 수 있다.
    ![image](https://user-images.githubusercontent.com/110087545/235827396-4469cd65-6532-4534-9e87-5dd01089542e.png)

    + 1, 2번 상황들은 모두 하나의 메커니즘으로 해결할 수 있다.
        + 상위계층 : 데이터를 가져올 수 있는지에 대한 여부와 그 중에서 어떤 데이터를 먼저 가져올 지 정한다.
        + 하위계층 : 데이터를 가져올 수 있는 최적의 시기와 방법을 결정한다.   
![image](https://user-images.githubusercontent.com/110087545/235827830-55011fd4-258b-4113-904e-6e9ec554f065.png)   
3. NDN transport: Synchronizing dataset names
- State Vector Sync (SVS)
    + 자세한 내용은 "SoK: The evolution of distributed dataset synchronization solutions in NDN"에서 확인할 수 있다.   
    link : https://named-data.net/publications/techreports/ndn-0073-r1-svs/
    + SVS 라이브러리는 아래 링크에서 다운 받아 실습할 수 있다. (차후 실습 후 정리 예정)   
    link : https://github.com/named-data/ndn-svs
- 기존 아이디어
    + Alice, Bob, Cathy가 분산 앱을 실행한다.
        * 모두 동기화 그룹에 가입한다.
    + 데이터를 생성하는 사용자 : 동기화 관심사를 보내 다른 사용자에게 알린다.
        * 데이터를 원하는 사용자는 데이터의 이름으로 가져온다.   
        ![image](https://user-images.githubusercontent.com/110087545/235828877-8226fb10-459b-4089-8d56-73397c79342e.png)
    + 채팅앱을 통한 svs 예시
        * 모든 사용자가 채팅룸에 입장하여 Sync Group에 합류한다.
        * Alice가 사진을 채팅룸에 전송한다. (이 때, App은 이미지를 SVS에 전송한다.)
        * SVS는 새로운 데이터가 있다는 정보를 State-Vector 그룹에 전송한다.
            - 관심사 이름 예시 : /chat/friends/state-vector
            - 관심사는 멀티캐스트 기반의 그룹이다. (단, 데이터 응답을 하지는 않는다.)
        * Cathy는 사진을 가져오기 위해 관심사를 전송한다.