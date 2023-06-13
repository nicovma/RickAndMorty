//
//  CharactersDetailModel.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation

enum CharacterDetailUIItem {
    case image(String)
    case basicInfo(CharacterBasicInfo)
}

struct CharacterBasicInfo {
    var name: String
}
