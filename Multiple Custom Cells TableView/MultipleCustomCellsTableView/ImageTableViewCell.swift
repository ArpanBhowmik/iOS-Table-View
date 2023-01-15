//
//  ImageTableViewCell.swift
//  MultipleCustomCellsTableView
//
//  Created by Arpan Bhowmik on 12/1/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    static let identifier = "ImageTableViewCell"
    @IBOutlet weak var myImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with imageName: String) {
        if myImageView == nil {
            print("found nil")
            return
        }
        myImageView.image = UIImage(named: imageName)
    }
}
