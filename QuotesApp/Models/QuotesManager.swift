//
//  QuotesManager.swift
//  QuotesApp
//
//  Created by IME Macmini on 15/05/2021.
//

import Foundation

protocol QuotesManagerDelegate {
    func didUpdateQuotesData(quotesData: [QuotesData])
    func didErrorOccur(errror: Error)
}

struct QuotesManager {
    
    var delegate: QuotesManagerDelegate?
    
    let quotesUrl = K.url
    
    func fetchQuotes(){
        if let url = URL(string: quotesUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didErrorOccur(errror: error!)
                }else{
                    let decoder = JSONDecoder()
                    if let safeData = data{
//                        let dataString = String(data: safeData, encoding: .utf8)
//                        print(dataString)
                        do{
                            let quotes  = try decoder.decode([QuotesData].self, from: safeData)
                            self.delegate?.didUpdateQuotesData(quotesData: quotes)
                        }catch{
                            self.delegate?.didErrorOccur(errror: error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
