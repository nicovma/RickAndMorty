//
//  CharactersDetailViewModel.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation

class CharactersDetailViewModel {
    
    // MARK: - Properties
    
    var rawResponse: CharacterInformation?
        
    var uiItems: [CharacterDetailUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        return [.image(rawResponse.image),.basicInfo(CharacterBasicInfo(name: rawResponse.name))]
    }
}
