//
//  SVGImageCell.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import UIKit

class SVGImageCell: UICollectionViewCell {
    static let identitifer = "SVGImageCell"
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFill
    }
    override func prepareForReuse() {
        imageView.image = nil
    }
    func setupCell(image:UIImage){
        imageView.image = image
    }

}
