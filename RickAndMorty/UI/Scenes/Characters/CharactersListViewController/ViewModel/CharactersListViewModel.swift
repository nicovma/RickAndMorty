//
//  CharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 13/06/2023.
//

import Foundation
import Alamofire

class CharactersListViewModel {
    
    // MARK: - Properties
    
    let dateFormatter = DateFormatter()
    let decoder = JSONDecoder()
    
    var delegate: CharactersListViewModelDelegate
    
    var rawResponse: CharactersResponse?
    var rawErrorResponse: ErrorResponse?
    
    var pageNumber = 1
    
    var filterText = ""
    
    var isFilteredResponse = false
    
    var showPrev: Bool {
        guard let rawResponse = rawResponse else {
            return false
        }
        
        if rawResponse.info.prev != nil {
            return true
        }
        return false
    }
    
    var showNext: Bool {
        guard let rawResponse = rawResponse else {
            return false
        }
        
        if rawResponse.info.next != nil {
            return true
        }
        return false
    }
    
    var pageText: String {
        return STRINGS.page + String(pageNumber)
    }
    
    var uiItems: [CharactersListUIItem]? {
        guard let rawResponse = rawResponse else {
            return nil
        }
        if rawResponse.results.count == 0 {
            return [.noCharacter]
        }

        var charactersUIItems: [CharactersListUIItem] = []
        
        for character in rawResponse.results {
            let characterInfo: CharacterUIItems = CharacterUIItems(name: character.name, status: character.status, species: character.species, type: character.type, image: character.image)
            charactersUIItems.append(.data(characterInfo))
        }
        return charactersUIItems
    }
    
    // MARK: - Publics methods
    
    init(delegate: CharactersListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData() {
        let headers: HTTPHeaders = []
        isFilteredResponse = filterText != ""
        AF.request(ENDPOINTS.characters, method: .get, parameters: getDateParameters(), encoding: URLEncoding.default, headers: headers)
                .responseData { response in
                    switch response.result {
                    case .failure(let error):
                        self.delegate.onError(error: error.localizedDescription)
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            if response.response?.statusCode == 200 {
                                self.rawResponse = try decoder.decode(CharactersResponse.self, from: data)
                                self.delegate.onSuccess(responseCase: .loadData)
                            } else {
                                self.rawErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
                                self.delegate.onError(error: self.rawErrorResponse?.error ?? STRINGS.errorGenericDescription)
                            }
                        } catch {
                            self.delegate.onError(error: error.localizedDescription)
                        }
                    }
            }
    }
    
    func addPage() {
        pageNumber+=1
    }
    
    func subtractPage() {
        pageNumber-=1
    }
    
    private func getDateParameters() -> Parameters {
        let parameters: Parameters = ["page":  pageNumber, "name": filterText]
        return parameters
    }
}
