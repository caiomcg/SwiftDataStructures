/* * *
 * Author: Caio Guedes<caiomcg@gmail.com> 
 * Creation date: 28/11/2018
 * * */

import UIKit

class Node<T> {
    var previous: Node?
    var next: Node?
    var content: T?
    
    init(content: T) {
        self.content = content
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init() {}
    
    func insertFront(content: T) {
        let node = Node(content: content)
        
        if head != nil {
            head!.next = node
            node.previous = head!
            
            head = node
        } else {
            head = node
            tail = node
        }
    }
    
    func insertBack(content: T) {
        let node = Node(content: content)
        
        if tail != nil {
            tail!.previous = node
            node.next = tail
            
            tail = node
        } else {
            head = node
            tail = node
        }
    }
    
    func iterate(reverse: Bool, completion: (inout T) -> Void) {
        if head != nil {
            var node: Node<T>? = (reverse ? head : tail)
            
            while node != nil {
                completion(&(node!.content!))
                node = (reverse ? node!.previous : node!.next)
            }
        }
    }
}

let list = LinkedList<Int>()

for x in 5...10 {
    list.insertFront(content: x)
}

for x in (0...4).reversed() {
    list.insertBack(content: x)
}

list.iterate(reverse: true) { content in
    content = 10
}

list.iterate(reverse: true) { content in
    print("Content \(content)")
}
