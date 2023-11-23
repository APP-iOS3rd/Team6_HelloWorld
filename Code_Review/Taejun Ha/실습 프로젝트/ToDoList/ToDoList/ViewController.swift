//
//  ViewController.swift
//  ToDoList
//
//  Created by Taejun Ha on 11/23/23.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var context: NSManagedObjectContext?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initCoreData()
        
        title = "To Do List "
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    func initCoreData() {
        let container = NSPersistentContainer(name: "CoreDataTutorial")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("initCoreData Error: \(error)")
            } else {
                self.context = container.viewContext
            }
        }
    }

    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else { return }
            
            self?.createItem(name: text)
        }))
        
        present(alert, animated: true)
    }
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else { return }
                
                self?.updateItem(item: item, newName: newName)
            }))
            self.present(alert, animated: true)
        }))
        
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {[weak self] _ in
            self?.deleteItem(item: item)
        }))
        present(sheet, animated: true)
    }
    
    //MARK: - CoreData
    // 저장된 모든 값을 가져옴
    func getAllItems() {
        if let context = context {
            do {
                models = try context.fetch(ToDoListItem.fetchRequest())
                // 기본적으로 UI관련 모든 작업은 Main 스레드에서 수행되어야함
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                // error
            }
        }
    }

    // 항목 생성
    func createItem(name: String) {
        if let context = context {
            let newItem = ToDoListItem(context: context)
            newItem.name = name
            newItem.createdAt = Date()
            
            do {
                try context.save()
                getAllItems()
            } catch {
                
            }
        }
    }
    
    // 항목 삭제
    func deleteItem(item: ToDoListItem) {
        if let context = context {
            context.delete(item)
            
            do {
                try context.save()
                getAllItems()
            } catch {
                // error
            }
        }
    }
    
    // 항목 업데이트
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        if let context = context {
            do {
                try context.save()
                getAllItems()
            } catch {
                // error
            }
        }
    }
}

