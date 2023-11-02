//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Taejun Ha on 10/19/23.
//

/*
 [# 스위프트 구조화된 동시성]
 
 동시성
    - 여러 작업을 병렬로 수행하는 소프트웨어 기능 ( 도로에 차선이 여러개면 자동차가 동시에 여러대 지나갈 수 있는 느낌 )
    - Swift는 구조화된 방식으로 비동기(asynchronous)와 병렬(parallel) 코드 작성을 지원
    - 비동기 코드는 일시적으로 중단되었다가 다시 실행할 수 있지만 한번에 프로그램의 한 부분만 실행
    - 병렬 코드는 동시에 코드의 여러 부분이 실행됨을 의미
    - 동시성 이라는 용어를 사용하여 비동기와 병렬 코드의 일반적인 조합을 나타냄
 
 
 스레드(thread)
    - 메인 프로세스 내에서 실행되는 미니 프로세스로 생각할 수 있으며, 그 목적은 애플리케이션 코드 내에서 병렬 실행의 형태를 가능하게 하는 것
    - Swift에서 동시성 모델은 쓰레드의 최상단에 구축되지만 직접적으로 상호작용할 필요는 없음
      ( 구조화된 동시성이 모든 복잡성을 처리 )
    - 멀티 프로세스보다 멀티 스레드가 쉽고 빠르기 때문에 멀티 스레드를 사용함 근데 스레드는 데이터를 읽어올 때는 문제가 없지만 같은 데이터에 쓰기를 하려고 하면 문제가 생길 수 있음 이걸 알아서 swift가 관리해줌
 
 애플리케이션 메인 스레드
    - 앱이 시작될 때 기본적으로 실행되는 단일 스레드
    - 주요 역할 : UI 레이아웃 렌더링, 이벤트 처리 및 사용자 인터페이스에서 뷰와 사용자 상호작용 측면에서 사용자 인터페이스를 처리
 
 비동기 함수 정의와 호출 (async/await)
    - 함수 파라미터 뒤의 선언에 async 키워드를 선언
    - 함수 또는 메서드가 값을 반환한다면 반환 화살표(->) 전에 async를 작성
    - 비동기 메서드를 호출할 때 해당 메서드가 반환될 때까지 실행이 일시 중단
    - 중단될 가능성이 있는 지점을 표시하기 위해 호출 앞에 await을 작성
    - Task를 이용하여 동기 함수에서 비동기 함수 호출
 
 비동기 함수 병렬로 호출
    - 비동기 함수를 호출하고 주변의 코드와 병렬로 실행하려면 (동시실행)
    - 상수를 정의할 때 let 앞에 async를 작성하고 상수를 사용할 때마다 await를 작성
    - await 를 사용하여 결과를 사용할 수 있을 때까지 실행이 중지
 
 
 
 
 [## 작업과 작업 그룹 (Tasks and Task Groups)]
 
 작업(task)은 프로그램의 일부로 비동기적으로 실행할 수 있는 작업 단위
    - 모든 비동기 코드는 어떠한 작업의 일부로 실행
    - 작업은 계층 구조로 정렬이 가능
    - 작업 그룹(task group)을 생성하고 해당 그룹에 하위 작업을 추가 가능
    - 작업과 작업 그룹 간의 명시적 관계 때문에 이 접근 방식을 구조적 동시성 또는 구조화된 동시성 이라고 함
 
 [## 구조화되지 않은 동시성 (Unstructured Concurrency)]
 구조화된 동시성을 하는게 좋음
 
    - 작업 그룹의 일부인 작업과 다리 구조화되지 않은 작업에는 사우이 작업이 없음
 
    - 프로그램이 필요로 하는 방식으로 구조화되지 않은 작업을 관리할 수 있는 완전한 유연성이 있지만 정확성에 대한 책임도 있음
    - 구조화 되지 않는 작업을 생성하려면 Task.init(priority: operation:) 초기화 구문을 호출
    - 분리된 작업으로 알려진 현재 액터의 일부가 아닌 구조화 되지 않은 작업을 생성하려면 Task.detached(priority: operation:) 메서드를 호출
 */


import SwiftUI

struct ContentView: View {
    @State var sumOfRangeValue = 0
    var body: some View {
        VStack {
            Spacer()
                Button(action: {
                    // doSomething과 takesTooLong 은 비동기로 되어있지만 지금 이 struct 안에 있는 코드들은 동기 코드임 메인스레드에 있기 때문에 Task로 감싸주고 해야 await doSomehing()이 사용가능해짐
                    // 동기 함수에서 비동기 함수 호출
                    Task {
                        await doSomething()
                    }
                }) {
                    Text("Do Something")
                }
            Spacer()
            Button(action: {
                    Task {
                        await sumOfRange(1, 100)
                    }
                }) {
                    Text("Sum Of Range")
                }
          
            Spacer()
        }
    }
    
//
//    func sumOfRange(_ start: Int, _ end: Int) async {
//        print("[Start sumOfRange]")
//        async let leftRange = sumOfSubRange(start, (start+end)/2)
//        async let rightRange = sumOfSubRange((start+end)/2+1, end)
//        
//        print("\nleftRange + rightRange = \((await leftRange) + (await rightRange))\n")
//    }
//    
//    func sumOfSubRange(_ start: Int, _ end: Int) async -> Int {
//        print("----[Start sumOfSubRange]")
//        return Array(start...end).reduce(0, +)
//    }
//    


    
    func sumOfRange(_ start: Int, _ end: Int) async {
        print("[Start sumOfRange]")
        var totalSum: Int = 0
        let indexList = [0, 50]
        
        await withTaskGroup(of: (Int).self) { group in
            for i in 0...1 {
                group.addTask{
                    return (await sumOfSubRange(indexList[i] + 1, indexList[i] + 50))
                }
            }
            
            for await (result) in group {
                totalSum += result
            }
        }
        
        print(totalSum)
    }
    
    func sumOfSubRange(_ start: Int, _ end: Int) async -> Int {
        print("----[Start sumOfSubRange]")
        return Array(start...end).reduce(0, +)
    }
    
    
    
    
    
    
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    
    // 작업 그룹
    // 동적인 조건에 따라 여러 작업을 동시에 생성하고 실행해야 하는 상황
    // withTaskGroup() 함수 이용
    // addTask() 함수를 호출하여 각각의 새로운 작업을 추가할 수 있음
    // cancelAll() 그룹의 모든 작업을 취소하는 메서드
    // isCancelled 작업 그룹이 이미 취소되었는지 여부를 확인하는 속성
    // isEmpty 작업 그룹 내에 작업이 남아 있는지 여부를 확인하는 속성
    
    // 데이터 경쟁 피하기
    // 동시에 데이터에 접근하는 여러 작업은 데이터 경쟁(Data race) 조건이 발생할 위험이 있음
    // 여러 작업이 동시에 동일한 데이터에 접근하려고 시도하면 데이터 오류가 발생
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        
        print("Start \(Date())")
        
        // 반환 타입을 변경 : Void.self 에서 (Int, Date)로 변경
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return (i, await takesTooLong())
                }
            }
            
            // for-await 표현식을 사용하여 비동기적으로 반환된 값을 루프
            // timeStamps에 담아줌
            // 동시 작업에서 반환되는 값의 수신을 기다려서 처리
            // 일련의 데이터가 AsyncSequence 프로토콜 준수하는 것이 필수임
            for await (task, date) in group {
                timeStamps[task] = date
            }
        }
        // 작업 그룹이 종료된 후 저장된 timeStamps 딕셔너리 항목을 출력
        for (task, date) in timeStamps {
            print("Task = \(task), Date = \(date)")
        }
        
        print("End \(Date())")
    }
    
    func takesTooLong() async -> Date{
        sleep(UInt32.random(in: 1...5)) // 랜덤 초 지원
        return Date()
    }
    

    
    /*
    // 오류 핸들링과 함께 p. 238
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takesTooLong(6)
        } catch DurationError.tooShort {
            print("Error: Duration too Short")
        } catch DurationError.tooLong {
            print("Error: Duration too Long")
        } catch {
            print("Unknown error")
        }
        print("End \(Date())")
    }
    
    func takesTooLong(_ delay: UInt32) async throws{
        
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        
        sleep(delay)
        print("Async task completed at \(Date())")
    }
    */
    
    
    
    
    /*
    // async-let 바인딩
//    - 비동기 함수를 호출하고 주변의 코드와 병렬로 실행하려면 (동시실행)
//    - 상수를 정의할 때 let 앞에 async를 작성하고 상수를 사용할 때마다 await를 작성
    func doSomething() async {
        print("Start \(Date())")
        async let result1 = takesTooLong()
        async let result2 = takesTooLong()
        async let result3 = takesTooLong()
        print("After async-let \(Date())")
        for i in 1...5 {print(i)}
        print("End \(await result1)")
        print("result2")
        print("End \(await result2)")
        print("result3")
        print("End \(await result3)")
        for i in 6...10 {print(i)}
    }
    
    func takesTooLong() async -> Date {
        sleep(UInt32(Int.random(in: 1...5))) // 랜덤 초 지연
        print("Async task completed at \(Date())")
        return Date()
    }
    */
    
    
    /*
    // 비동기 함수 선언 async
    // 비동기 함수 호출은 await
    // takesTooLong 실행되는 동안 버튼 클릭도 안 됨
    func doSomething() async {
        print("Start \(Date())")
        await takesTooLong()
        print("End \(Date())")
    }
    
    func takesTooLong() async {
        sleep(5)    // 5초 지연
        print("Async task completed at \(Date())")
    }
    */
    
    
    
    
    /*
    // 동기 코드 p.232~233
    // takesTooLong() 함수가 실행되는 동안 아무 것도 할 수 없음
    func doSomething() {
        print("Start \(Date())")
        takesTooLong()
        print("End \(Date())")
    }
    
    func takesTooLong() {
        sleep(5)    // 5초 지연
        print("Async task completed at \(Date())")
    }
    */
}


#Preview {
  ContentView()
}
