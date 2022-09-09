//
//  NetworkService.swift
//  BreakingBad_API
//
//  Created by Cenk Bahadır Çark on 9.09.2022.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchData(url: String, completion: @escaping ([CharacterResponse]?) -> ()){
        
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url){data ,response ,error in
                if let data = data{
                    do{
                        let characterResponse = try JSONDecoder().decode([CharacterResponse].self, from: data)
                        DispatchQueue.main.async {
                            completion(characterResponse)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }else{
                    print("no data")
                }
            }.resume()
        }else{
            print("invalid URL")
        }
    }
}
