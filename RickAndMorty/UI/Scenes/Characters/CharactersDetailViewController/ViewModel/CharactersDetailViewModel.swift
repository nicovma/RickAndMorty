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
    let dateFormatter = DateFormatter()
        
    var uiItems: [CharacterDetailUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        
        var items: [CharacterDetailUIItem] = [
            .image(CharacterBasicInfo(name: rawResponse.name,status: rawResponse.status, date: String(rawResponse.created.prefix(10)), image: rawResponse.image)),
            .basicInfo(CharacterClasificationInfo(name: STRINGS.specieTitle, value: rawResponse.species)),
            .basicInfo(CharacterClasificationInfo(name: STRINGS.typeTitle, value: rawResponse.type == "" ? STRINGS.unknownValue : rawResponse.type )),
            .basicInfo(CharacterClasificationInfo(name: STRINGS.genderTitle, value: rawResponse.gender.rawValue)),
            .basicInfo(CharacterClasificationInfo(name: STRINGS.originTitle, value: rawResponse.origin.name)),
            .basicInfo(CharacterClasificationInfo(name: STRINGS.locationTitle, value: rawResponse.location.name)),
            .basicInfo(CharacterClasificationInfo(name: STRINGS.episodesTitle, value: nil))]
        
        for episode in rawResponse.episode {
            
            let separatedComponents = episode.components(separatedBy: "/")
            if let lastComponent = separatedComponents.last {
                items.append(.episode(lastComponent))
            }
        }
        
        return items
        
    }
}
