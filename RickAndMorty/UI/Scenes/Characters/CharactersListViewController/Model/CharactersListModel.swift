//
//  CharactersListModel.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation

enum CharactersListUIItem {
    case data(CharacterUIItems)
    case noCharacter
}

struct CharacterUIItems: Decodable {
    var name: String
    var status: CharacterStatus
    var species: String
    var type: String?
    var image: String
}

struct CharactersResponse: Decodable {
    var info: CharactersInfoResponse
    var results: [CharacterInformation]
}

struct ErrorResponse: Decodable {
    var error: String
}

struct CharactersInfoResponse: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct CharacterInformation: Decodable {
    var id: Int
    var name: String
    var status: CharacterStatus
    var species: String
    var type: String?
    var gender: CharacterGender
    var origin: CharacterLocation
    var location: CharacterLocation
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

struct CharacterLocation: Decodable {
    var name: String
    var url: String?
}

enum CharacterStatus: String, Decodable {
    case dead = "Dead"
    case alive = "Alive"
    case unknown = "unknown"
}

enum CharacterGender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    case genderless = "Genderless"
}
