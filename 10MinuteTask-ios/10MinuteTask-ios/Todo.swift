//
//  Todo.swift
//  10MinuteTask-ios
//
//  Created by jina on 2020/09/12.
//  Copyright © 2020 jina. All rights reserved.
//

import UIKit

struct Todo: Equatable, Codable {
    let id:Int
    var detail:String
    var isDone:Bool
    
    mutating func update(isDone:Bool, detail:String){
        self.detail = detail
        self.isDone = isDone
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
           return lhs.id == rhs.id
       }
}

class TodoManager {
    
    static let shared = TodoManager()
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String) -> Todo{
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        
        return Todo(id: nextId, detail: detail, isDone: false)
    }
    
    func deleteTodo(_ todo: Todo){
        if let index = todos.firstIndex(of: todo){
            todos.remove(at: index)
        }
        saveTodo()
    }
    
    func addTodo(_ todo: Todo){
        todos.append(todo)
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo){
        guard let index = todos.firstIndex(of: todo) else {return}
        todos[index].update(isDone: todo.isDone, detail: todo.detail)
        saveTodo()
    }
    
    func saveTodo(){
        Storage.store(todos, to: .documents, as: "todos.json")
    }
}


class TodoViewModel{
    private let manager = TodoManager.shared
    
    var todos:[Todo]{
        return manager.todos
    }
    
    var numOfTodos:Int {
        return todos.count
    }
    
    func addTodo(_ todo: Todo){
        manager.addTodo(todo)
    }
    func deleteTodo(_ todo: Todo){
        manager.deleteTodo(todo)
    }
    func updateTodo(_ todo: Todo){
        manager.updateTodo(todo)
    }
    
 
}
