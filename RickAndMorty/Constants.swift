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
    // ErrorView
    static let errorTitle = "Error!"
    static let errorGenericDescription = "Unexpected error."
    
    // LoadingView
    static let loading = "Loading..."
    
    // CharactersListViewController
    static let page = "Page "
    static let filterPlaceholder = "Search by name"
    static let filtered = "Filter applied "
    static let noCharacter = "No characters to show."
    
    
    // CharacterImageCell
    static let createdOn = "Created on "
    
    // CharactersDetailViewModel
    static let specieTitle = "Specie:"
    static let typeTitle = "Type:"
    static let genderTitle = "Gender:"
    static let originTitle = "Origin:"
    static let locationTitle = "Location:"
    static let episodesTitle = "Episodes"
    static let episodeTitle = "Episode "
    static let unknownValue = "Unknown "
    
    
}
