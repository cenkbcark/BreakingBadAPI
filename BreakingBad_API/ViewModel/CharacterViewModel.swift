//
//  CharacterViewModel.swift
//  BreakingBad_API
//
//  Created by Cenk Bahadır Çark on 10.09.2022.
//

import Foundation

//Array of View Model

struct CharacterListViewModel {
    
    let characterList : [CharacterResponse]
    
    func numberOfRowInSection() -> Int {
        return self.characterList.count
    }
    
    func characterAtIndex(_ index: Int) -> CharacterViewModel {
        let characterData = self.characterList[index]
        return CharacterViewModel(characterData)
        
    }
    
}
//Single data for View Model

struct CharacterViewModel{
    
    let characterModel : CharacterResponse
    
    init(_ character: CharacterResponse){
        self.characterModel = character
    }
    
    var name : String{
        return characterModel.name ?? "Unknown"
    }
    var img : String{
        return characterModel.img ?? "None"
    }
    var nickname : String{
        return characterModel.nickname ?? "Unknown"
    }
    var portrayed : String{
        return characterModel.portrayed ?? "Unknown"
    }
    var occupation : Array<String> {
        return characterModel.occupation ?? []
    }
    //
    var birthday : Birthday? {
        return characterModel.birthday
    }
    var status : Status? {
        return characterModel.status
    }
    var category : Category? {
        return characterModel.category
    }
    
    
    
    
    
    
    
    
    
}
