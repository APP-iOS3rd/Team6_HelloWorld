//
//  ApiKeys.swift
//  Weather_API_Demo
//
//  Created by Taejun Ha on 12/1/23.
//

import Foundation

// .plist 파일에서 key에 해당하는 API_KEY 를 반환
func getValueOfPlistFile(_ plistFileName: String, _ key: String) -> String? {
    // 생성한 .plist 파일 경로 불러오기
    guard let filePath = Bundle.main.path(forResource: plistFileName, ofType: "plist") else { fatalError("Couldn't find file '\(plistFileName).plist'") }
    
    // .plist 파일 내용을 딕셔너리로 받아오기
    let plist = NSDictionary(contentsOfFile: filePath)
    
    // 딕셔너리에서 키 찾기
    guard let value = plist?.object(forKey: key) as? String else { fatalError("Couldn't find key '\(key)'") }
    
    return value
}
