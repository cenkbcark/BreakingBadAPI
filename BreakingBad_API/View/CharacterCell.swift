//
//  CharacterCell.swift
//  BreakingBad_API
//
//  Created by Cenk Bahadır Çark on 10.09.2022.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nicknameLbl: UILabel!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var playerLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    //
    
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var birtdayLbl: UILabel!
    
    func setCharacter(character: CharacterViewModel){
        nameLbl.text = "Name: \(character.name)"
        nicknameLbl.text = "Nickname: \(character.nickname)"
        jobLbl.text = "Occupation: \(character.occupation[0])"
        playerLbl.text = "By: \(character.portrayed)"
        categoryLbl.text = "In: \(character.category?.rawValue ?? "Unknown")"
        statusLbl.text = "Status: \(character.status?.rawValue ?? "Unknown")"
        birtdayLbl.text = "Birthday: \(character.birthday?.rawValue ?? "Unknown")"
        //imageconfig
        imageView.kf.setImage(with: URL(string: character.img))
    }
    
    func configureCell(){
        imageView.layer.cornerRadius = 25
        nameLbl.layer.masksToBounds = true
        nameLbl.layer.cornerRadius = 20
        statusLbl.layer.masksToBounds = true
        statusLbl.layer.cornerRadius = 20
        jobLbl.layer.masksToBounds = true
        jobLbl.layer.cornerRadius = 20
        playerLbl.layer.masksToBounds = true
        playerLbl.layer.cornerRadius = 20
    }
    
}
