//
//  InformationManagerTests.swift
//  StarWarsTests
//
//  Created by Shalom Owolabi on 19/04/2022.
//

import XCTest
@testable import StarWars

class InformationManagerTests: XCTestCase {

    var sut: InformationViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchWithPlanetExtension (){
        let mockNetwork = MockNetworkService()
        sut = InformationViewModel(mockNetwork, MockPersistenceManager())
        
        sut.fetch(with: .planets)
        
        XCTAssertTrue(mockNetwork.isGetPlanetInformationCalled)
        XCTAssertFalse(mockNetwork.isGetFilmsInformationCalled)
        XCTAssertFalse(mockNetwork.isGetStarshipInformationCalled)
        XCTAssertFalse(mockNetwork.isGetSpeciesInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPeopleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetVehicleInformationCalled)
    }
    
    func testFetchWithPeopleExtension (){
        let mockNetwork = MockNetworkService()
        sut = InformationViewModel(mockNetwork, MockPersistenceManager())
        
        sut.fetch(with: .people)
        
        XCTAssertTrue(mockNetwork.isGetPeopleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetFilmsInformationCalled)
        XCTAssertFalse(mockNetwork.isGetStarshipInformationCalled)
        XCTAssertFalse(mockNetwork.isGetSpeciesInformationCalled)
        XCTAssertFalse(mockNetwork.isGetVehicleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPlanetInformationCalled)
    }
    
    func testFetchWithVehicleExtension (){
        let mockNetwork = MockNetworkService()
        sut = InformationViewModel(mockNetwork, MockPersistenceManager())
        
        sut.fetch(with: .vehicles)
        
        XCTAssertTrue(mockNetwork.isGetVehicleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetFilmsInformationCalled)
        XCTAssertFalse(mockNetwork.isGetStarshipInformationCalled)
        XCTAssertFalse(mockNetwork.isGetSpeciesInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPeopleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPlanetInformationCalled)
    }
    
    func testFetchWithFilmsExtension (){
        let mockNetwork = MockNetworkService()
        sut = InformationViewModel(mockNetwork, MockPersistenceManager())
        
        sut.fetch(with: .films)
        
        XCTAssertTrue(mockNetwork.isGetFilmsInformationCalled)
        XCTAssertFalse(mockNetwork.isGetStarshipInformationCalled)
        XCTAssertFalse(mockNetwork.isGetSpeciesInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPeopleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetVehicleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPlanetInformationCalled)
    }
    
    func testFetchWithSpeciesExtension (){
        let mockNetwork = MockNetworkService()
        sut = InformationViewModel(mockNetwork, MockPersistenceManager())
        
        sut.fetch(with: .species)
        
        XCTAssertTrue(mockNetwork.isGetSpeciesInformationCalled)
        XCTAssertFalse(mockNetwork.isGetFilmsInformationCalled)
        XCTAssertFalse(mockNetwork.isGetStarshipInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPeopleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetVehicleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPlanetInformationCalled)
    }
    
    func testFetchWithStarshipExtension (){
        let mockNetwork = MockNetworkService()
        sut = InformationViewModel(mockNetwork, MockPersistenceManager())
        
        sut.fetch(with: .starships)
        
        XCTAssertTrue(mockNetwork.isGetStarshipInformationCalled)
        XCTAssertFalse(mockNetwork.isGetFilmsInformationCalled)
        XCTAssertFalse(mockNetwork.isGetSpeciesInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPeopleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetVehicleInformationCalled)
        XCTAssertFalse(mockNetwork.isGetPlanetInformationCalled)
        
    }
    
    func testLoadFromMemoryWithStarshipExtension (){
        let persistData = MockPersistenceManager()
        sut = InformationViewModel(MockNetworkService(), persistData)
        
        sut.loadFromMemory(with: .starships)
        
        XCTAssertTrue(persistData.wasLoadDataCalled)
    }

}
