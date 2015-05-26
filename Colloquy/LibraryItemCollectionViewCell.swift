//
//  LibraryItemCollectionViewCell.swift
//  Colloquy
//
//  Created by Josiah Gaskin on 5/25/15.
//  Copyright (c) 2015 Colloquy. All rights reserved.
//

import Foundation
import UIKit

class LibraryItemCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var text : String = "" {
        didSet {
            nameLabel.text = text
        }
    }
}