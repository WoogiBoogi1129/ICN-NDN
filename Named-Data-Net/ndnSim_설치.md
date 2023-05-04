ndnSIM 설치 및 예제 실습
-----------------------
Lastest Update : 2023.05.04.
----------------------------
1. Overview
- 소개
    + NS-3 네트워크 시뮬레이터 기반으로 등장함.
    + NDN 관련 시뮬레이션 기반 실험을 수행하기 위한 오픈 소스 공용 프레임워크임.
    + NDN 연구 현황과 함께 발전중임.
2. ndnSIM 시작하기(참고 링크 : https://ndnsim.net/current/getting-started.html)
    1. ndnSIM 설치를 위해 Virtual Box에 Ubuntu 20.04를 설치한다.   
    ![image](https://user-images.githubusercontent.com/110087545/236179857-23b58c66-0fac-4b55-9e1d-cc1bb3671fe2.png)   
    (다운로드 완료된 리눅스 20.04)
    * 추가 : 간혹 리눅스 설치 직후 Terminal이 열리지 않는 경우가 있다. 이런 경우, 리눅스 내 'Setting'에 가서 Region & Language를 English(United State)가 아닌 다른 국가로 변경 후, Log Out & Log In을 진행하면 해당 문제를 해결할 수 있다.
    2. ndnSIM을 설치하기 전 기본 요구사항 스펙에 대한 조건을 만족시킨다.
    - GCC 7.4 버젼 이상
    ```
    gcc --version // gcc가 깔려있지 않을 시, 아래 명령어 진행

    $ sudo apt update
    $ sudo apt install build-essential
    ```
    - Python 3.6 버젼 이상
    ```
    $ python3 --version // 위 명령어 입력 후 Python 설치가 되어있지 않다면 아래 명령어 실행   
    $ sudo apt-get install python3
    ```
    - pkg-config
    ```
    $ pkg-config --version // pkg-config가 설치되어 있지 않을 시, 아래 명령어 진행   
    $ sudo apt-get install pkg-config
    ```
    - Boost 1.65.1 이상
    ```
    $ dpkg -s libboost-dev | grep 'Version' // version이 존재하지 않는다면 아래 명령어 진행   
    $ sudo apt-get update
    $ wget -c 'https://sourceforge.net/projects/boost/files/boost/1.73.0/boost_1_73_0.tar.bz2'
    $ tar xvf boost_1_73_0.tar.bz2
    $ cd boost_1_73_0.tar.bz2
    $ ./bootstrap.sh
    $ ./b2 install
    ```
    - OpenSSL 1.0.2 이상
    - SQLite 3.x 이상
3. 시나리오 예제