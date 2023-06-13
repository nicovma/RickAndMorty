//
//  CharactersListAdapterDelegate.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation

protocol CharactersListAdapterDelegate: AnyObject {
    func showCharacterDetail(index: Int)
}
