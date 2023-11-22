//
//  ViewController.swift
//  Database_FMDB_Practice
//
//  Created by Taejun Ha on 11/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var status: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    var databasePath = ""
    var resultItems = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        initDB()
    }
    
    func initDB() {
        let fileManager = FileManager.default
        let dirPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPath[0].appendingPathComponent("contacts.db").path()
        
        if !fileManager.fileExists(atPath: databasePath) {
            let contactDB = FMDatabase(path: databasePath)
            
            if contactDB.open() {
                let sql_statement = "create table if not exists contacts ( id integer primary key autoincrement, name text, address text, phone text);"
                
                if !contactDB.executeStatements(sql_statement) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
        }
    }
    
    @IBAction func saveContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        
        if contactDB.open(){
            let sql_statement = "insert into contacts (name, address, phone) values ('\(name.text ?? "")','\(address.text ?? "")','\(phone.text ?? "")')"
            
            do {
                try contactDB.executeUpdate(sql_statement, values: nil)
            } catch {
                print("Error: \(contactDB.lastErrorMessage())")
                status.text = "contact 추가 실패!!"
            }
            
            status.text = "Contact Added"
            
            name.text = ""
            address.text = ""
            phone.text = ""
            
            contactDB.close()
        } else {
            status.text = "DB 열기 오류발생"
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    
    @IBAction func findContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        
        if contactDB.open() {
            var sql_statement = "select id, name, address, phone from contacts where "
            var nameWhere = false
            var addressWhere = false
            
            if let nameText = name.text, nameText != "" {
                sql_statement += "name='\(nameText)'"
                nameWhere = true
            }
            if let addressText = address.text, addressText != "" {
                if nameWhere { sql_statement += " AND " }
                sql_statement += "address='\(addressText)'"
                addressWhere = true
            }
            if let phoneText = phone.text, phoneText != "" {
                if nameWhere || addressWhere { sql_statement += " AND " }
                sql_statement += "phone='\(phoneText)'"
            }
            
            do {
                let results: FMResultSet? = try contactDB.executeQuery(sql_statement, values: nil)
                
                resultItems = [Contact]()
                while results?.next() == true {
                    let id = results?.int(forColumn: "id")
                    let name = results?.string(forColumn: "name")
                    let address = results?.string(forColumn: "address")
                    let phone = results?.string(forColumn: "phone")
                    self.resultItems.append(Contact(id: id, name: name, address: address, phone: phone))
                }
            }catch {
                print("Error: \(contactDB.lastErrorMessage())")
            }
            
            contactDB.close()
            tableView.reloadData()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
        
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.id.text = "Id :" + String(resultItems[indexPath.row].id!)
        cell.name.text = "Name :" + (resultItems[indexPath.row].name ?? "")
        cell.address.text = "Address :" + (resultItems[indexPath.row].address ?? "")
        cell.phone.text = "Phone :" + (resultItems[indexPath.row].phone ?? "")
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

class TableViewCell: UITableViewCell {
    @IBOutlet var id: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phone: UILabel!
    
}

struct Contact {
    let id: Int32?
    let name: String?
    let address: String?
    let phone: String?
}
