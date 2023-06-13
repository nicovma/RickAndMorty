//
//  CharactersListViewModelDelegate.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation

protocol CharactersListViewModelDelegate: AnyObject {
    func onSuccess(responseCase: CharactersListResponse)
    func onError(error: String)
}

enum CharactersListResponse {
    case loadData
}
