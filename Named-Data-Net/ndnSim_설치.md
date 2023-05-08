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
    $ sudo apt upgrade libboost-all-dev
    ```
    - OpenSSL 1.0.2 이상
    ```
    $ openssl version // 설치 안되어 있으면 아래 명령어 실행   
    $ wget https://www.openssl.org/source/openssl-1.1.1o.tar.gz --no-check-certificate
    $ tar xvfz openssl-1.1.1p.tar.gz
    $ cd openssl-1.1.1o
    $ ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
    $ mv /usr/bin/openssl /usr/bin/openssl_bak
    $ make && make install
    $ ln -s /usr/local/ssl/lib/libssl.so.1.1 /usr/lib64/libssl.so.1.1
    $ ln -s /usr/local/ssl/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
    $ ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl
    ```
    - SQLite 3.x 이상
    ```
    $ sudo apt install sqlite3 // 명령어 실행
    ```   
    지금까지 기본 요구사항을 충족시켰다. 이제는 실제로 ndnSIM을 설치해야한다.   
    3. ndnSIM 설치
    ```
    $ sudo apt install build-essential libsqlite3-dev libboost-all-dev libssl-dev git python3-setuptools castxml // 명령어 실행
    ```
    - 이후 NS-3의 Python 바인딩을 사용하려는 경우 여러가지 종속성을 추가로 설치해야한다. 그 중 Visualizer를 설치하기 위해서는 아래 명령어를 실행해야한다.
    ```
    $ sudo apt install gir1.2-goocanvas-2.0 gir1.2-gtk-3.0 libgirepository1.0-dev python3-dev python3-gi python3-gi-cairo python3-pip python3-pygraphviz python3-pygccxml
    $ sudo pip3 install kiwi
    ```
    - 본격적인 ndnSIM Source 다운로드
    ```
    $ mkdir ndnSIM
    $ cd ndnSIM
    $ git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3
    $ git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen
    $ git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM   
    
    git에서 ndnSIM 그리고 ns-3와 관련된 리포지토리를 clone해온 후 ndnSIM Compile 진행
    $ cd ns-3
    $ ./waf configure --disable-python --enable-examples
    $ ./waf
    ```   
    * 해당 작업에서 상당히 많은 시간을 소요한다. (약 1시간)
    ![image](https://user-images.githubusercontent.com/110087545/236212350-b340cffa-e346-4377-95e8-56be4f6deb30.png)   
    사진처럼 나오면 성공이다.
    4. 설치 완료 확인
    - 기본적인 Complie
    ```
    ./waf --run=ndn-simple
    or
    ./waf --run=ndn-grid

    ./waf --run=[실행할 파일]

    visualizer를 이용하여 코드를 실행시킬 수도 있다.
    ./waf --run=[실행할 파일] --vis
    ./waf --run=ndn-simple --vis
    ```
    - 성공적으로 실행했을 경우  
    ![image](https://user-images.githubusercontent.com/110087545/236213885-7fb367d4-0da2-443a-b5ff-21c23740df43.png)
