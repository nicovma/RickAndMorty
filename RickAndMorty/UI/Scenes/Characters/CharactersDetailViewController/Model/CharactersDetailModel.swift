//
//  CharactersDetailModel.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation

enum CharacterDetailUIItem {
    case image(CharacterBasicInfo)
    case basicInfo(CharacterClasificationInfo)
    case episode(String)
}

struct CharacterClasificationInfo {
    var name: String
    var value: String?
}

struct CharacterBasicInfo {
    var name: String
    var status: CharacterStatus
    var date: String
    var image: String
}
