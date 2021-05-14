//
//  QuotesTableViewCell.swift
//  QuotesApp
//
//  Created by IME Macmini on 14/05/2021.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var quotesTextLabel: UITextView!
    @IBOutlet weak var socialMediaView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func socialMediaButtonPressed(_ sender: UIButton) {
    }
    
    
    
}
