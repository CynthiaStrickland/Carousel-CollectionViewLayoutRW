//
//  MasterViewController.swift
//  CustomCollectionViewLayoutRW
//
//  Created by Cynthia Strickland on 3/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

private let detailID = "MasterToDetail"
private let characterID = "CharacterCell"

class MasterViewController: UICollectionViewController {
  
    let charactersData = Characters.loadCharacters()
    let columns:CGFloat = 3.0
    let inset:CGFloat = 8.0
    let spacing:CGFloat = 8.0
    let lineSpacing:CGFloat = 8.0
    
    var isRandom = false
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController!.isToolbarHidden = true
    
    // Refresh Control
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(MasterViewController.refreshControlDidFire), for: .valueChanged)
    collectionView?.refreshControl = refreshControl
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == detailID {
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.character = sender as? Characters
    }
  }
  
  func refreshControlDidFire() {
    isRandom = true
    collectionView?.reloadData()
    collectionView?.refreshControl?.endRefreshing()
  }

}


// MARK: UICollectionViewDataSource
extension MasterViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return charactersData.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterID, for: indexPath) as! CharactersCell
    
    let character = charactersData[indexPath.item]
    cell.charactersImage.image = UIImage(named: character.name)
    cell.charactersTitle.text = character.title
    
    return cell
  }
}

// MARK: UICollectionViewDelegate

extension MasterViewController {
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let character = charactersData[indexPath.item]
    performSegue(withIdentifier: detailID, sender: character)
  }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MasterViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = Int((collectionView.frame.width / columns) - (inset + spacing))
        
        var randomSize: Int
        if isRandom == true {
            randomSize = 64 * Int(arc4random_uniform(UInt32(3)) + 1)
        } else {
            randomSize = width
        }
        
        return CGSize(width: randomSize, height: randomSize)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return spacing
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return lineSpacing
        
    }
}










