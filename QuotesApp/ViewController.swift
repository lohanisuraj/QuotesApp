//
//  ViewController.swift
//  QuotesApp
//
//  Created by IME Macmini on 13/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let quotesManager = QuotesManager()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesManager.fetchQuotes()
        tableView.register(UINib(nibName: "QuotesTableViewCell", bundle: nil), forCellReuseIdentifier: "QuotesCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuotesCell", for: indexPath)
        return cell
    }
  
    
}
