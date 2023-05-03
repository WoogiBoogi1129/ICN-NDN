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
   
3. 안정적인 데이터 전송   
안정적인 데이터은 쉬운 작업이 아니다. 그렇다면 NDN에서는 어떻게 안정적인 데이터 전송 기능을 유지할 수 있을까?   
- 1번 상황 : 하나의 전송 서비스가 신뢰할 수 있는 전송 요구사항이 다른 앱을 지원할 수 있는가?
    + TCP/IP의 문제 : TCP/IP의 단일 크기가 모든 어플리케이션에 적합하지는 않다.   
    ![image](https://user-images.githubusercontent.com/110087545/235827152-8f797540-e619-4ac7-9ea7-0d9135eb1619.png)
- 2번 상황 : 하나의 전송서비스가 여러개의 앱이 원하는 로컬 제약에 따라 데이터를 재단하여 보낼 수 있는가?
    + 