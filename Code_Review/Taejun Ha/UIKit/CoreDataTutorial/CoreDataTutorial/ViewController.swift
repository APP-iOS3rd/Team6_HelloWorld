//
//  ViewController.swift
//  CoreDataTutorial
//
//  Created by Taejun Ha on 11/22/23.
//

import UIKit
import CoreData // CoreData 프레임워크 가져오기

class ViewController: UIViewController {
    @IBOutlet var name: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var status: UILabel!
    
    // 관리 객체 컨텍스트 객체에 대한 참조를 저장할 변수를 선언
    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initCoreData()
    }
    
    func initCoreData() {
        //영구 컨테이너(저장소) 초기화
        let container = NSPersistentContainer(name: "CoreDataTutorial")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("initCoreData Error: \(error)")
            } else {
                //관리 객체 컨텍스트(NSManagedObjectContext)에 대한 참조 설정
                self.managedObjectContext = container.viewContext
            }
        }
    }

    //관리 객체 콘텍스트를 가져와서 contacts entity를 가져오고 거기에 저장을 해줘야함
    @IBAction func saveContact(_ sender: Any) {
        if let context = managedObjectContext, let entityDescription = NSEntityDescription.entity(forEntityName: "Contacts", in: context) {
            let contact = Contacts(entity: entityDescription, insertInto: managedObjectContext)
            
            contact.name = name.text
            contact.address = address.text
            contact.phone = phone.text
            
            do {
                try managedObjectContext?.save()
                
                name.text = ""
                address.text = ""
                phone.text = ""
                status.text = "Contact Added"
            } catch let error {
                status.text = error.localizedDescription
            }
        }
    }
    
    @IBAction func findContact(_ sender: Any) {
        // entityDescription 얘가 Entity라고 보면 됨
        if let context = self.managedObjectContext, let entityDescription = NSEntityDescription.entity(forEntityName: "Contacts", in: context) {
            
            // 엔티티에게 요청할거기 때문에 엔티티요청 객체를 만들어
            let request: NSFetchRequest<Contacts> = Contacts.fetchRequest()
            // 이렇게 디스크립션을 넣어주면 어떤 Entity한테 리퀘스트 해야할지 알려주는거임
            request.entity = entityDescription
            
            if let name = name.text {
                request.predicate = NSPredicate(format: "(name = %@)", name)
            }
            
            do {
                let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
                
                if results.count > 0 {
                    let match = results[0] as! NSManagedObject
                    
                    name.text = match.value(forKey: "name") as? String
                    address.text = match.value(forKey: "address") as? String
                    phone.text = match.value(forKey: "phone") as? String
                    status.text = "Success Find \(results.count)"
                } else {
                    status.text = "Fail Find"
                }
            } catch let error {
                status.text = error.localizedDescription
            }
        }
    }
}
