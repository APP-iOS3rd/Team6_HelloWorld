//
//  ViewController.swift
//  Database_Tutorial
//
//  Created by Taejun Ha on 11/22/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var name: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var status: UILabel!
    
    var databasePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 처음에 데이터베이스 초기화 해주기위한 함수
        initDB()
    }
    
    // MARK: - 데이터베이스 초기화 단계
    func initDB() {
        let fileMgr = FileManager.default
        // 유저 즉, 사용자 계정의 디렉토리니가 .userDomainMask를 주는거임
        let dirPath = fileMgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        databasePath = dirPath[0].appendingPathExtension("contacts.db").path()
        
        // 파일이 이미 있는지 확인 - 파일 없으면 if문 안으로 들어감
        if !fileMgr.fileExists(atPath: databasePath) {
            // DB 초기화 시작 - databasePath의 경로에 맞게 DB를 만들어줌
            let contactDB = FMDatabase(path: databasePath)
            
            // 만든 DB를 오픈
            if contactDB.open() {
                //오픈 했으니 테이블 만들줘야지
                // - 아래 처럼 쿼리문을 일단 변수에 담아줘
                let sql_statement = "create table if not exists contacts ( id integer primary key autoincrement, name text, address text, phone text);"
                //execute 뜻 그대로 쿼리문을 수행해줌 그럼 결과적으로 테이블이 생성되겠지
                // - executeStatements는 쿼리문 수행이 잘 되었는지 Bool 타입을 리턴함
                // - executeStatements로 create 뿐만 아니라 모든 쿼리문을 다 이걸로 수행 하는거임 insert, drop 등등
                if !contactDB.executeStatements(sql_statement) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                // 오픈해서 사용 다 했으면 다시 닫아줘야함
                contactDB.close()
            } else {
                // contactDB.open()이 실패 했을 때
                print("Error: \(contactDB.lastErrorMessage())")
            }
        }
    }

    
    
    @IBAction func saveContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        
        if contactDB.open() {
            let sql_statement = "insert into contacts (name, address, phone) values ('\(name.text ?? "")','\(address.text ?? "")', '\(phone.text ?? "")');"
            
            do {
                try contactDB.executeUpdate(sql_statement, values: nil)
            } catch {
                print("Error: \(contactDB.lastErrorMessage())")
                status.text = "contact 추가 실패!!"
            }
            
            status.text = "Contact Added"
            // DB에 데이터 추가 완료 됐으니 textField들을 비워줌
            name.text = ""
            address.text = ""
            phone.text = ""
            
            contactDB.close()
        } else {
            status.text = "DB 열기 오류발생"
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    // 데이터베이스 데이터를 검색&추출
    @IBAction func findContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        var items = [Contact]()
        
        if contactDB.open() {
            let sql_statement = "select id, name, address, phone from contacts where name='\(name.text ?? "")';"
            
            do {
                // select 해온 결과를 FMResultSet에 넣어야함
                let results: FMResultSet? = try contactDB.executeQuery(sql_statement, values: nil)
                
                while results?.next() == true {
                    let id = results?.int(forColumn: "id")
                    let name = results?.string(forColumn: "name")
                    let address: String = results?.string(forColumn: "address") ?? ""
                    let phone: String = results?.string(forColumn: "phone") ?? ""
                    print("\(address), \(phone)")
                    items.append(Contact(id: id, name: name, address: address, phone: phone))
                }
                
                // 이 next는 selecet된 데이터가 많아도 가장 먼저온 녀석 한놈만 사용가능함
//                if results?.next() == true {
//                    address.text = results?.string(forColumn: "address")
//                    phone.text = results?.string(forColumn: "phone")
//                    status.text = "Record Found"
//                } else {
//                    status.text = "Record Not Found"
//                    address.text = ""
//                    phone.text = ""
//                }
            } catch {
                print("Error: \(contactDB.lastErrorMessage())")
            }
            
            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
        
        for i in items {
            print("\(i.address) \(i.phone)")
        }
    }
}

struct Contact {
    let id: Int32?
    let name: String?
    let address: String?
    let phone: String?
}
