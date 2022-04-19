//
//  MockNetworkService.swift
//  StarWarsTests
//
//  Created by Shalom Owolabi on 19/04/2022.
//

import Foundation
@testable import StarWars

///Mock network service for testing
class MockNetworkService: NetworkServiceProtocol {
    var isGetPlanetInformationCalled: Bool = false
    var shouldGetPlanetInformationReturnError: Bool = false
    var demoPlanetResponse: PlanetsModel = PlanetsModel(count: 1, next: nil, previous: nil, results: [])
    
    func getPlanetInformation(completion: @escaping ((Result<PlanetsModel, NetworkError>) -> Void)) {
        isGetPlanetInformationCalled = true
        
        guard !shouldGetPlanetInformationReturnError else {
            completion(.failure(.failedRequest))
            return
        }
        
        completion(.success(self.demoPlanetResponse))
    }
    var isGetVehicleInformationCalled: Bool = false
    var shouldGetVehicleInformationReturnError: Bool = false
    var demoVehicleResponse: VehiclesModel = VehiclesModel(count: 1, next: nil, previous: nil, results: [])
    func getVehicleInformation(completion: @escaping ((Result<VehiclesModel, NetworkError>) -> Void)) {
        isGetVehicleInformationCalled = true
        guard !shouldGetVehicleInformationReturnError else {
            completion(.failure(.failedRequest))
            return
        }
        
        completion(.success(demoVehicleResponse))
    }
    
    var isGetFilmsInformationCalled: Bool = false
    var shouldGetFilmsInformationReturnError: Bool = false
    var demoFilmsResponse: FilmsModel = FilmsModel(count: 1, next: nil, previous: nil, results: [])
    func getFilmsInformation(completion: @escaping ((Result<FilmsModel, NetworkError>) -> Void)) {
        isGetFilmsInformationCalled = true
        guard !shouldGetFilmsInformationReturnError else {
            completion(.failure(.failedRequest))
            return
        }
        
        completion(.success(demoFilmsResponse))
    }
    
    var isGetSpeciesInformationCalled: Bool = false
    var shouldGetSpeciesInformationReturnError: Bool = false
    var demoSpeciesResponse: SpeciesModel = SpeciesModel(count: 1, next: nil, previous: nil, results: [])
    func getSpeciesInformation(completion: @escaping ((Result<SpeciesModel, NetworkError>) -> Void)) {
        isGetSpeciesInformationCalled = true
        guard !shouldGetSpeciesInformationReturnError else {
            completion(.failure(.failedRequest))
            return
        }
        
        completion(.success(demoSpeciesResponse))
    }
    
    var isGetStarshipInformationCalled: Bool = false
    var shouldGetStarshipInformationReturnError: Bool = false
    var demoStarshipResponse: StarShipsModel = StarShipsModel(count: 1, next: nil, previous: nil, results: [])
    func getStarshipInformation(completion: @escaping ((Result<StarShipsModel, NetworkError>) -> Void)) {
        isGetStarshipInformationCalled = true
        guard !shouldGetStarshipInformationReturnError else {
            completion(.failure(.failedRequest))
            return
        }
        
        completion(.success(demoStarshipResponse))
    }
    
    var isGetPeopleInformationCalled: Bool = false
    var shouldGetPeopleInformationReturnError: Bool = false
    var demoPeopleResponse: PeopleModel = PeopleModel(count: 1, next: nil, previous: nil, results: [])
    func getPeopleInformation(completion: @escaping ((Result<PeopleModel, NetworkError>) -> Void)) {
        isGetPeopleInformationCalled = true
        guard !shouldGetPeopleInformationReturnError else {
            completion(.failure(.failedRequest))
            return
        }
        
        completion(.success(demoPeopleResponse))
    }
}
