//
//  User.swift
//  UITestingDemo
//
//  Created by Taejun Ha on 12/18/23.
//

import Foundation

class User: ObservableObject {
    @Published var isLogined = false
    @Published var username = ""
    @Published var password = ""
    
    func login() -> Bool {
        guard username == "test" && password == "pass"  else { return  false }
        
        password = ""
        isLogined = true
        
        return true
    }
    
    func logout() {
        isLogined = false
        username = ""
    }
}
