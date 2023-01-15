//
//  MyTableViewCell.swift
//  TableViewButtonActions
//
//  Created by Arpan Bhowmik on 12/1/23.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func didTapButton(with text: String)
}

class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: MyTableViewCellDelegate?
    
    private var title = ""
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.didTapButton(with: title)
    }
    
    func configure(with text: String) {
        self.title = text
        button.setTitle(text, for: .normal)
    }
}
