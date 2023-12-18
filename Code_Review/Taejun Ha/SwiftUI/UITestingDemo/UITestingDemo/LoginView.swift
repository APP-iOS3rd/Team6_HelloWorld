//
//  LoginView.swift
//  UITestingDemo
//
//  Created by Taejun Ha on 12/18/23.
//

import SwiftUI

struct LoginView: View {
    // User 인스턴스에 엑세스할 수 있도록 EnvironmentObject 속성을 선언
    @EnvironmentObject private var user: User
    // 나중에 시트를 닫을 수 있도록 ... 속성을 선언
    @Environment(\.presentationMode) var presentationMode
    
    // 경고 표시 상태 속성을 선언
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Username", text: $user.username)
                    SecureField("Password", text: $user.password)
                }
                
                Button {
                    if user.login() {
                        // 시트를 닫음
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Login")
                }
                .accessibilityIdentifier("loginNow")
            }
            .navigationTitle(Text("Login"))
            .navigationBarItems(trailing: Button{
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .accessibilityLabel("Dismiss")
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed"), message: Text("사용자이름, 패스워드가 일치하지 않습니다."), dismissButton: Alert.Button.default(Text("OK"), action: {
                    showAlert = false
                }))
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(User())
}
