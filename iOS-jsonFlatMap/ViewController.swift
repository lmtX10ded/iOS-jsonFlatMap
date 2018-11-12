//
//  ViewController.swift
//  iOS-jsonFlatMap
//
//  Created by My Computer on 2018-11-12.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                //Now get title value
                guard let title = jsonArray[0]["title"] as? String else { return }; print(title) // delectus aut autem
                for dic in jsonArray{
                    guard let title = dic["title"] as? String else { return }
                    print(title) //Output
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        

    }


}

