//
//  ViewController.swift
//  10MinuteTask-ios
//
//  Created by jina on 2020/09/06.
//  Copyright © 2020 jina. All rights reserved.
//  * table cell 에 리스트 띄우기
//  * delete 구현하기
//  * isDone 구현하기
//  * 네비게이션 구현하기
//  * 타이머 구현하기 10분마다 알림
//  * 로그 기록하기

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var homeTitle: UINavigationItem!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var addTodoButton: UIButton!
    
    let todoListViewModel = TodoViewModel()
    
    @IBAction func addTodo(_ sender: Any) {
        guard let detail = inputTextField.text, detail.isEmpty == false else {return}
        print("입력된 detail \(detail)")
        
        let todo = TodoManager.shared.createTodo(detail: detail)
        todoListViewModel.addTodo(todo)
        
        for var test in todoListViewModel.todos{
            print("\(test.detail)")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTitle.title="TodoList"
        
    }


}



extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("todoListViewModel.numOfTodos : \(todoListViewModel.numOfTodos)")
        return todoListViewModel.numOfTodos;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TodoListCell else{
            print("is not Todolistcell")
            return UITableViewCell()
        }
        
        print("2")
        
        var todo: Todo = todoListViewModel.todos[indexPath.item]
        cell.updateUI(todo: todo)
        print("todo :  \(todo.detail) \(todo.id)")
     
        
        return cell
    }
    
    
}

class TodoListCell: UITableViewCell{
    
    @IBOutlet weak var task: UILabel!
    
    func updateUI(todo: Todo){
        task.text = todo.detail
    }
    
}
