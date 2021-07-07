import UIKit

// MARK: - Задача 3*. К выполнению необязательна. 

enum LinkedList<T> {
    indirect case value(T, LinkedList<T>)
    case none
}

let linkedList = LinkedList.value(5, .value(15, .value(25, .none)))
