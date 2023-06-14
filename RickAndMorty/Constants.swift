//
//  Constants.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 13/06/2023.
//

import Foundation

struct ENDPOINTS {
    static let characters = "https://rickandmortyapi.com/api/character"
    static let locations = "https://rickandmortyapi.com/api/location"
    static let episodes = "https://rickandmortyapi.com/api/episode"
}

struct STRINGS {
    // error
    static let errorTitle = "Error!"
    static let errorGenericDescription = "Unexpected error."
    
    // loading
    static let loading = "Loading..."
    
    // charactersListViewController
    static let page = "Page "
    static let filterPlaceholder = "Search by name"
    static let filtered = "Filter applied"
    static let noCharacter = "No characters to show."
    
}
