//
//  CharactersListViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Nico Valentini Mac Adden on 07/07/2023.
//

import XCTest
@testable import RickAndMorty

final class CharactersListViewModelTests: XCTestCase, CharactersListViewModelDelegate {
    
    func onSuccess(responseCase: RickAndMorty.CharactersListResponse) {
        
    }
    
    func onError(error: String) {
        
    }
    
    
    var charactersListViewModel: CharactersListViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        charactersListViewModel = CharactersListViewModel(delegate: self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        charactersListViewModel = nil
    }
    
    func test_AddPage_WhenAreInFirstPage() {
        
    }
    
    
}
