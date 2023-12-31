//
//  ContentView.swift
//  GestureDemo
//
//  Created by Taejun Ha on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        BasicGestureView()
//                OnChangedGestureView()
        //        UpdatingGestureView()
        SimultaneouslyGestureView()
//        SequencedGestureView()
    }
}

// 여러 개의 제스처를 결합 sequenced 경우
// 롱 프레스 제스처와 드래그 제스처를 순차적으로 구성
// 이미지의 색상이 녹색으로 바뀔 때까지 롱 프레스한 다음 드래그 제스처를 사용하여 이미지를 이동
struct SequencedGestureView: View {
    
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnable: Bool = false
    
    var body: some View {
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 1.0)
            .onEnded { _ in
                self.dragEnable = true
            }
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                switch value {
                case .first(true):
                    print("Long Press in progress")
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded{ _ in
                self.dragEnable = false
            }
        
        VStack {
            Image(systemName: "hand.point.right.fill")
                .foregroundStyle(dragEnable ? .green : .blue)
                .font(.largeTitle)
                .frame(width: 100,height: 100)
                .offset(offset)
                .gesture(longPressBeforeDrag)
        }
    }
}

// 제스처를 결합하여 적용
struct  SimultaneouslyGestureView: View {

    // updating 콜백은 DragGesture.Value 객체에서 translation 값을 추출하여
    // @GestureState 프로퍼티에 할당(상태를 임시 저장)
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false

    var body: some View {

        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) { value, state, transaction in
                state = value
            }
            .simultaneously(with: DragGesture())
            .updating($offset) { value, state, transaction in
                state = value.second?.translation ?? .zero
            }

        VStack {
            Image(systemName: "hand.point.right.fill")
                .foregroundStyle(longPress ? .red : .blue)
                .font(.largeTitle)
            // 화면의 드래그 제스처에 따라 움직이도록 처리
                .offset(offset)
                .gesture(longPressAndDrag)
        }
    }
}


// updating 액션 콜백
struct UpdatingGestureView: View {
    
    // updating 콜백은 DragGesture.Value 객체에서 translation 값을 추출하여
    // @GestureState 프로퍼티에 할당( 상태를 임시 저장 )
    @GestureState private var offset: CGSize = .zero
    
    var body: some View {
        let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in
                state = dragValue.translation
            }
        
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .font(.largeTitle)
                .frame(width: 100, height: 100)
            // 화면의 드래그 제스처에 따라 움직이도록 처리
                .offset(offset)
                .gesture(drag)
        }
        .padding()
    }
}

// onChanged
struct OnChangedGestureView: View {
    
    @State private var magnification: CGFloat = 1.0
    
    var body: some View {
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in
                print("Magnifying")
                self.magnification = value
            }
            .onEnded{ _ in print("MagnificationGesture") }
        
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .font(.largeTitle)
                .frame(width: 100, height: 100)
            // 확대/축소 작업의 현재 비율을 가지고 이미지 뷰의 크기 조절
                .scaleEffect(magnification)
                .gesture(magnificationGesture)
        }
        .padding()
    }
}

struct BasicGestureView: View {
    let tap = TapGesture()
        .onEnded{ print("Tapped") }
    
    let doubleTap = TapGesture(count: 2)
        .onEnded{ print("Double Tapped") }
    
    let longPress = LongPressGesture(minimumDuration: 2, maximumDistance: 25)
        .onEnded{ _ in print("LongPressGesture") }
    
    var body: some View {
        VStack {
            Image(systemName: "hand.point.right.fill")
                .gesture(tap)
                .gesture(doubleTap)
                .gesture(longPress)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
