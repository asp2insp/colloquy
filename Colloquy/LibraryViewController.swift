//
//  SecondViewController.swift
//  Colloquy
//
//  Created by Josiah Gaskin on 5/25/15.
//  Copyright (c) 2015 Colloquy. All rights reserved.
//

import UIKit

class LibraryViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("com.colloquy.libraryitem", forIndexPath: indexPath) as! LibraryItemCollectionViewCell
        cell.text = "\(indexPath.row/30)/\(indexPath.row % 30)/15"
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100 // TODO bind to data store
    }
}

