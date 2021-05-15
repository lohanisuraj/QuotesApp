//
//  ViewController.swift
//  QuotesApp
//
//  Created by IME Macmini on 13/05/2021.
//

import UIKit

class ViewController: UIViewController,QuotesManagerDelegate {
    var quotesManager = QuotesManager()
    var data: [QuotesData]?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesManager.delegate = self
        quotesManager.fetchQuotes()
        tableView.register(UINib(nibName: "QuotesTableViewCell", bundle: nil), forCellReuseIdentifier: "QuotesCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func didUpdateQuotesData(quotesData: [QuotesData]) {
        DispatchQueue.main.async {
            self.data = quotesData
            self.tableView.reloadData()
        }
    }
    func didErrorOccur(errror: Error) {
        print(errror)
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuotesCell", for: indexPath) as! QuotesTableViewCell
        if data != nil{
            cell.quotesLabel.text = data?[indexPath.row].description
        }
    
        return cell
    }
  
    
}
