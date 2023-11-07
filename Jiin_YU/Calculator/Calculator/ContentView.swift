/*
 
 1. array 사용해서 중복되는 코드 고치기
 2. enum 사용해서 오퍼레이션 부분 고치기
 3. 앞에 숫자를 넣지 않고 = 눌러서 생기는 에러부분 처리(enum)
 4. 계산을 끝내고 나면 다시 처음으로 돌아가기
 5. 뷰랑 로직 부분 분리하기
 6. extension 써보기
 
 mvvm 모델????
 model 이라는 이름은 실제 사용모델?
 손은 view , 손가락을 움직이는 힘을 view model
 
 */

import SwiftUI

struct ContentView: View {
    @State private var expression: String = ""
    @StateObject private var calculatorButton: CalculatorButton = CalculatorButton()

    var body: some View {
        VStack {
            TextField("Enter number", text: $calculatorButton.expression)
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .frame(height: 200)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
                .padding()

            ForEach(calculatorButton.buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(button: button)  {
                            do{
                                try calculatorButton.handleButtonpress(button)
                            }catch {
                                print("Error\(CalculatorError.unknownError)")
                            }
                          
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
