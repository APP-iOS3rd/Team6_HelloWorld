//
//  loadJSON.swift
//  231102
//
//  Created by 김재완 on 2023/11/02.
//

import SwiftUI

// JSON 파일을 로드하는 표준 방식, 이후 앱에서도 사용이 가능
func loadJSON<T: Decodable>(_ filename: String) -> T {// 어떤 타입을 들어오던지 간에 다 처리하겠다는 것임(오류처리)
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) // file을 생성 , Bundle 이미지파일을 바로 가져올수 있는 유딜리티임
    else {
        fatalError("\(filename) not found") //일반적인 처리임
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could net load \(filename): \(error)")// 여기도 혹시나 예외가 발생되면 에러문구로 처리
    }
    do {
        return try JSONDecoder().decode(T.self, from: data) //어떤 녀석이 들어와도 이렇게 해주겠다 라는 것
    } catch  {// 에러가 나면 여기서 잡아주겟다
        fatalError("Unable to parse \(filename): \(error)")
    }
}
//  핵심 코드는 3줄인데 에러잡는다고 길어진것임
// 나중에 우리가 별도로 쓸수 있지않을까해서 별도로 만든것임 
