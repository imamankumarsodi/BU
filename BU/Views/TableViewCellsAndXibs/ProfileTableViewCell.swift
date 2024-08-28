//
//  ProfileTableViewCell.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import UIKit

class ProfileTableViewCell: SBaseTableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //TODO: Configure with info
    public func configure(with info: CategoryViewModel){
        self.lblTitle.text = info.title
        self.imgView.image = info.image
       // self.titlelLabelCategory.text = info.title.replacingOccurrences(of: ConstantTexts.blankSpace, with: ConstantTexts.newLineBreak)
    }

    
}
