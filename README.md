# Julia, Python, Rstat on VS Code 

## 목표 

- Julia, Python, R을 모두 VS Code 위에서 쓴다. 
- 하나의 도커 컨테이너만 쓴다. 

## 필요 조건 

- Windows 10 with WSL 2
- VS Code 
  - Global extension 
    - `Remote-Container`
  - Container extension 
    - Julia 
    - Jupyter 
    - Python 
    - R 
    - R LSP Client 
    - Radian 
- Docker Desktop 
- jupyter/datascience-notebook:latest (from dockerhub)


## 간단한 개념 

- VS Code의 컨테이너 접속 기능을 활용해 `datascience-notebook` 컨테이너 접속한다. 
  - 이 컨테이너는 안에 python, jupyterlab, R, Julia를 모두 갖고 있다. 따라서 이 녀석 하나만 깔면 된다. 
- 각각의 언어에 접근하기 위해서 VS Code Extension을 설치한다. 
  - Julia, Python의 경우 공식 확장이므로 쓰면 된다. 
  - R의 경우 비공식 확장이므로 약간의 세팅이 필요하다. 


## For Julia 

- 필요한 파일을 `.jl` 확장자로 만든다. 
- VS Code가 알아서 잘 잡아서 줄리아 커널과 연결시켜준다. 
- 간략한 명령어 https://www.julia-vscode.org/docs/stable/userguide/runningcode/
  - 코드 셀 구분은 `##`
  - CTRL + ENTER 해당 라인 실행 
  - ALT + ENTER 코드 블럭 실행 (드래그앤드롭 선택) 
  - SHIFT + ENTER 코드 셀 실행

- 패키지 설치는 두가지로 가능하다. 

  1. Julia 콘솔에서 `]`를 치면 패키지 관리 모드로 들어간다.   

  ```julia
  >(pkg) add SOMETHING
  ```
    
  - 이렇게 설치할 경우는 별도로 `Pkg`를 호출하지 않도 설치가 가능하다. 다만 연속된 설치를 지원하지는 않는다. 

  2. 아래와 같이 설치할 수도 있다.
  
    ```julia
    using Pkg 
    Pkg.add("Plots")
    Pkg.add("PyPlot") 
    ```

- Julia는 JIT를 쓰기 때문에 패키지를 설치하고 명령을 구동하는 데 시간이 오래 걸린다. 이 과정을 작업을 시작하기 전에 미래 해두는 것이 좋다. 즉, 필요한 경우 미리 컴파일을 해놓는 것이 좋다. 
- QuantEcon의 [아래의 예](https://julia.quantecon.org/getting_started_julia/julia_by_example.html)를 따르자. 


## For Python 

- 필요한 파일을 `.py` 확장자로 만든다. 
  - 만일 주피터 노트북을 쓰고 싶다면 `.ipynb`로 만들면 된다. 

- 간략한 명령어 
  - Code 블럭의 구별은 `#%%`
  - Python은 VS Code에서 거의 완벽하게 지원이 된다. 
  - 별다른 설명이 필요하지 않다. 

## For Rstat

- 확장 두 개를 깐다. 
  - R Support: https://marketplace.visualstudio.com/items?itemName=Ikuyadeu.r
  - R LSP Client: https://marketplace.visualstudio.com/items?itemName=REditorSupport.r-lsp
- 다음으로 R 내에서 LSP와 연결할 패키지를 설치한다. 

```r
remotes::install_github("REditorSupport/languageserver")
```
- 마지막으로 Rstat에서 편리하게 사용할 터미널 앱을 깐다. 파이썬으로 제작되었다. 다행스럽게도 DS 도커는 이미 파이썬을 잘 지원하기 때문에 쉽게 쓸 수 있다. 주의할 것은 Rstat 내부가 아니라 그냥 docker의 bash에 접속한 상태에서 깔아야 한다는 것이다. 

```shell
pip install -U radian 
```

- 이제 VS Code에서 설정 몇 가지를 바로 잡아 줘야 한다.   
    - `File > Preferences > Settings`로 가자 
    - 옆에 탭을 보면 `Extensions`가 있을 것이다. 여기서 `R`로 찾아가자. 
    - Extension의 설정을 
      - User, Remote, Workspace 등 상황에 맞게 다양하게 정할 수 있다. 
      - 여기서는 Workspace에 하도록 하겠다. 
        - `R: Bracketed Paste` 항목 체크 
        - `R › Rterm: Linux`
          - `/opt/conda/bin/radian`
        - `R: Session Watcher` 항목 체크 

## Jupyterlab 

- `ipynb`를 확장자로 해서 노트북을 쓰고 싶다면, 그냥 쓰면 된다. 

1. 콘테이너를 부착한 후 
2. 커널을 선택한다. 



