# theos-helloworld
theos helloworld출력해보기


## theos 설치하기

```
brew install dpkg ldid
git clone --recursive https://github.com/theos/theos.git ~/theos

```

## 환경설정

- macbook에서 실행

```
echo "export THEOS=~/theos" >> ~/.zshrc
source ~/.zshrc

```

## 디렉토리 구조

- macbook에서 구조

```
HelloWorld/
├── Makefile
├── Tweak.xm
├── main.m
└── Filter.plist

```

## 컴파일 및 실행 순서

- make

```
hacker@blackfalconui-MacBookAir helloworld2 % make

==> Notice: Build may be slow as Theos isn’t using all available CPU cores on this computer. Consider upgrading GNU Make: https://theos.dev/docs/parallel-building
> Making all for tweak HelloWorld…
==> Preprocessing Tweak.xm…
==> Compiling Tweak.xm (arm64)…
==> Linking tweak HelloWorld (arm64)…
==> Generating debug symbols for HelloWorld…
==> Preprocessing Tweak.xm…
==> Compiling Tweak.xm (arm64e)…
==> Linking tweak HelloWorld (arm64e)…
==> Generating debug symbols for HelloWorld…
==> Merging tweak HelloWorld…
==> Signing HelloWorld…
hacker@blackfalconui-MacBookAir helloworld2 % 

```

- make mac

```
hacker@blackfalconui-MacBookAir helloworld2 % make mac
clang -framework Foundation -o HelloWorld main.m
./HelloWorld
2024-06-07 09:27:21.078 HelloWorld[23905:493472] Hello World from MacOS
```

-  make package

```
hacker@blackfalconui-MacBookAir helloworld2 % make package
==> Notice: Build may be slow as Theos isn’t using all available CPU cores on this computer. Consider upgrading GNU Make: https://theos.dev/docs/parallel-building
> Making all for tweak HelloWorld…
==> Preprocessing Tweak.xm…
==> Compiling Tweak.xm (arm64)…
==> Linking tweak HelloWorld (arm64)…
==> Generating debug symbols for HelloWorld…
==> Preprocessing Tweak.xm…
==> Compiling Tweak.xm (arm64e)…
==> Linking tweak HelloWorld (arm64e)…
==> Generating debug symbols for HelloWorld…
==> Merging tweak HelloWorld…
==> Signing HelloWorld…
> Making stage for tweak HelloWorld…
dm.pl: building package `co.kr.blackfalcon.helloworld:iphoneos-arm' in `./packages/co.kr.blackfalcon.helloworld_0.0.1-1-8+debug_iphoneos-arm.deb'
hacker@blackfalconui-MacBookAir helloworld2 % 

```
```
hacker@blackfalconui-MacBookAir helloworld2 % ls packages 
co.kr.blackfalcon.helloworld_0.0.1-1-7+debug_iphoneos-arm.deb	test
co.kr.blackfalcon.helloworld_0.0.1-1-8+debug_iphoneos-arm.deb
hacker@blackfalconui-MacBookAir helloworld2 % 

```

- upload

```
scp -P 1115 co.kr.blackfalcon.helloworld_0.0.1-1-4+debug_iphoneos-arm.deb  root@localhost:/tmp    
```


- ios에서 실행

```
ssh -p 1115 root@localhost
```


- dpkg
```
dpkg -i co.kr.blackfalcon.helloworld_0.0.1-1-4+debug_iphoneos-arm.deb  
```


```
 touch  /var/mobile/HelloWorld.log
```


```
killall -9 SpringBoard
```


- cat /var/mobile/HelloWorld.log

```
Black-Falconui-iPhone:~ root# cat  /var/mobile/HelloWorld.log
Hello World from iOS - Application did finish launching
Hello World from iOS - Application did finish launching
```
