
/*Button view*/

import SwiftUI

struct CalculatorButtonView: View {
    
    let button: CalculatorButton.ButtonType
    
    // 부분은 클로저를 통해 버튼이 탭(Tap)되었을 때 실행할 코드
    let onTab: () -> Void

    var body: some View {
        Button(action: {
            onTab()
        }) {
            button.view
        }
    }
}

extension CalculatorButton.ButtonType   {
    
    
    @ViewBuilder
    
    var view : some View {
        switch self {
        case let .digit(value):
            Text(value)
                .modifier(StandardNumber())
        case let .operatorButton(op):
            Text(op)
                .modifier(StandardNumber())
        case .delete:
             Text("Delete")
                .modifier(StandardZero())
        case .equals:
             Text("=")
                .modifier(StandardZero())
        }
    }
}

struct StandardNumber: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 40)
            .font(.system(size: 40))
            .fontWeight(.heavy)
            .padding(20)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
    }
}

struct StandardZero: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 130)
            .font(.system(size: 40))
            .fontWeight(.heavy)
            .padding(20)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
    }
}

#Preview {
    CalculatorButtonView(button: .digit("1"), onTab: {} )
}
