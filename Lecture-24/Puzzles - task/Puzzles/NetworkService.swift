//
//  NetworkService.swift
//  Puzzles
//
//  Created by Leonid Serebryanyy on 18.11.2019.
//  Copyright © 2019 Leonid Serebryanyy. All rights reserved.
//

import Foundation
import UIKit


class NetworkService {
	
	let session: URLSession

	init() {
		session = URLSession(configuration: .default)
	}
	
	
	// MARK:- Первое задание
	
	///  Вот здесь должны загружаться 4 картинки и совмещаться в одну.
	///  Для выполнения этой задачи вам можно изменять только этот метод.
	///  Метод, соединяющий картинки в одну, уже написан (вызывается в конце).
	///  Ответ передайте в completion.
	///  Помните, что надо сделать так, чтобы метод работал как можно быстрее.
	public func loadPuzzle(completion: @escaping (Result<UIImage, Error>) -> ()) {
		// это адреса картинок. они работающие, всё ок!
		let firstURL = URL(string: "https://storage.googleapis.com/ios_school/tu.png")!
		let secondURL = URL(string: "https://storage.googleapis.com/ios_school/pik.png")!
		let thirdURL = URL(string: "https://storage.googleapis.com/ios_school/cm.jpg")!
		let fourthURL = URL(string: "https://storage.googleapis.com/ios_school/apple.jpeg")!
		let urls = [firstURL, secondURL, thirdURL, fourthURL]
		
		// в этот массив запишите итоговые картинки
		var results = [UIImage]()

        DispatchQueue.global().sync {
            
            let imageDispatchGroup = DispatchGroup()
            
            for url in urls {
                
                imageDispatchGroup.enter()
                //debugPrint("enter \(url)") //проверка синхронности
                
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if error != nil {
                        return
                    }
                    guard let httpRespone = response as? HTTPURLResponse,
                          (200...299).contains(httpRespone.statusCode) else {
                        return
                    }
                    
                    if let safeData = data,
                       let image = UIImage(data: safeData) {
                        results.append(image)
                    }
                    //debugPrint("leave \(url)") //проверка синхронности
                    imageDispatchGroup.leave()
                }
                task.resume()
            }
            imageDispatchGroup.wait()
            
            if let merged = ImagesServices.image(byCombining: results) {
                completion(.success(merged))
            }
        }
	}
	
	
	// MARK:- Второе задани
	
	///  Здесь задание такое:
	///  У вас есть keyURL, который приведёт вас к ссылке на клад.
	///  Верните картинку с этим кладом в completion
	public func loadQuiz(completion: @escaping(Result<UIImage, Error>) -> ()) {
		let keyURL = URL(string: "https://sberschool-c264c.firebaseio.com/enigma.json?avvrdd_token=AIzaSyDqbtGbRFETl2NjHgdxeOGj6UyS3bDiO-Y")!
		
        let task = URLSession.shared.dataTask(with: keyURL) { data, respone, error in
            if error != nil {
                return
            }
            
            guard let httpRespone = respone as? HTTPURLResponse,
                  (200...299).contains(httpRespone.statusCode) else {
                return
        }
            
            guard let safeData = data,
                  var stringUrl = String(data: safeData, encoding: .utf8 ) else {
                return
            }
           
            //Удаляем обратные слешы, чтобы у нас был правильный url
            stringUrl.removeLast()
            stringUrl.removeFirst()
            
            guard let imageUrl = URL(string: stringUrl),
                  let imageData = try? Data(contentsOf: imageUrl),
                  let image = UIImage(data: imageData) else {
                return
            }
            
            completion(.success(image))
        }
        task.resume()
    }
}
