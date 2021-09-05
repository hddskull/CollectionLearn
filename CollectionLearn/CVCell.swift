//
//  CVCell.swift
//  CollectionLearn
//
//  Created by Gladkov Maxim on 05.09.2021.
//

import UIKit

class CVCell: UICollectionViewCell {
    
    var data: CollElem? {
        didSet {
            guard let data = data else {
                return
            }
            img.image = data.image
        }
    }
    
    let img: UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "timer.png")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(img)
        img.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
