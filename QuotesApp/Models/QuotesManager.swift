//
//  QuotesManager.swift
//  QuotesApp
//
//  Created by IME Macmini on 15/05/2021.
//

import Foundation

protocol QuotesManagerDelegate {
   func didUpdateQuotesData()
}

struct QuotesManager {
    let quotesUrl = "https://quoteapi.answersflow.com/quotes/api/all-api/"
    
    func fetchQuotes(){
        if let url = URL(string: quotesUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                }else{
                    let decoder = JSONDecoder()
                    if let safeData = data{
//                        let dataString = String(data: safeData, encoding: .utf8)
//                        print(dataString)
                        do{
                            let quotes  = try decoder.decode([QuotesData].self, from: safeData)
                            print(quotes[0].id)
                        }catch{
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
