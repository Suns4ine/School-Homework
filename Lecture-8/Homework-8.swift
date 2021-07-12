//
//  Homework-8.swift
//  
//
//  Created by Vyacheslav Pronin on 12.07.2021.
//

import Foundation

enum DataChecking: Error {
    case invalidData
    case invalidResult(_ result: Int)
}

func checkTask(example: String) throws -> Result<Int, DataChecking> {
    let array = example.split(separator: " ")
    
    guard array.count == 5 && (array[1] == "+" || array[1] == "-") && array[3] == "="  else {
        throw DataChecking.invalidData
    }
    
    if let firstNumb = Int(array[0]), let secondNumb = Int(array[2]), let resultExample = Int(array[4]) {
        let result = firstNumb + secondNumb
        return (result == resultExample ) ?
            .success(result) :
            .failure(DataChecking.invalidResult(result))
    }
    throw DataChecking.invalidData
}

func checkHomework(examples: [String]) -> String {
    var failureExample = ""
    let threshold = 0.75
    
    guard !examples.isEmpty else { return "Нет примеров"}

    for example in examples {
        do {
            let result = try checkTask(example: example)
            switch result {
                case .success: continue
                case .failure: failureExample.append(example + "\n")
            }
        }
        catch { return "Переделывай" }
    }
    if Double(failureExample.count) / Double(examples.count) <= threshold {
        return "Молодец"
    }
    return "Делай заново\n\(failureExample)"
}
