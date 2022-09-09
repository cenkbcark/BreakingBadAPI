//
//  ViewController.swift
//  BreakingBad_API
//
//  Created by Cenk Bahadır Çark on 9.09.2022.
//

import UIKit
import Kingfisher

final class ViewController: UIViewController {
    
    private var characterListViewModel : CharacterListViewModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     override func viewDidLoad() {
        super.viewDidLoad()
         
         self.collectionView.dataSource = self
         self.collectionView.delegate = self
         //fetch data
         getData()
        
    }
    
    private func getData() {
        let url = "https://www.breakingbadapi.com/api/characters"
        
        NetworkService.shared.fetchData(url: url) { characters in
            
            if let characters = characters {
                self.characterListViewModel = CharacterListViewModel(characterList: characters)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characterListViewModel?.numberOfRowInSection() ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CharacterCell{
            
            cell.layer.cornerRadius = 25.0
            cell.configureCell()
            let characterViewModel = self.characterListViewModel?.characterAtIndex(indexPath.row)
            cell.setCharacter(character: characterViewModel!)
            return cell
        }
        return UICollectionViewCell()
    }
}

