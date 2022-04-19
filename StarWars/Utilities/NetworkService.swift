//
//  NetworkService.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import Foundation
import Combine

///This implements the network communication operations
class NetworkService: NetworkServiceProtocol {
    private var fullURL: String
    private var method: Method
    private var urlExtension: URLExtensions
    private let session: URLSessionProtocol
    
    init(withMethod method: Method, withURLExtension urlExtension: URLExtensions, session: URLSessionProtocol) {
        self.fullURL = Constants.fullURL(with: urlExtension)
        self.method = method
        self.session = session
        self.urlExtension = urlExtension
    }
    
    ///This function is called to get planetDetails, returns the approprait detail in response or Network Error
    public func getPlanetInformation(completion: @escaping((Result<PlanetsModel, NetworkError>) -> Void)) {
        request(method: method, completion: completion)
    }
    
    ///This function is called to get vehicleDetails, returns the approprait detail in response or Network Error
    public func getVehicleInformation(completion: @escaping((Result<VehiclesModel, NetworkError>) -> Void)) {
        request(method: method, completion: completion)
    }
    
    ///This function is called to get filmsDetails, returns the approprait detail in response or Network Error
    public func getFilmsInformation(completion: @escaping((Result<FilmsModel, NetworkError>) -> Void)) {
        request(method: method, completion: completion)
    }
    
    ///This function is called to get speciesDetails, returns the approprait detail in response or Network Error
    public func getSpeciesInformation(completion: @escaping((Result<SpeciesModel, NetworkError>) -> Void)) {
        request(method: method, completion: completion)
    }
    
    ///This function is called to get starshipDetails, returns the approprait detail in response or Network Error
    public func getStarshipInformation(completion: @escaping((Result<StarShipsModel, NetworkError>) -> Void)) {
        request(method: method, completion: completion)
    }
    
    ///This function is called to get peopleDetails, returns the appropraite detail in response or Network Error
    public func getPeopleInformation(completion: @escaping((Result<PeopleModel, NetworkError>) -> Void)) {
        request(method: method, completion: completion)
    }
    
    /// this is the private function that would create the URLRequest. Basically manages the header and body of the api call
    private func request<T: Codable>(method: Method,
                                  completion: @escaping((Result<T, NetworkError>) -> Void)) {
        //ensure a valid url is formed
        guard let urlString = URL(string: fullURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        
        var request = URLRequest(url: urlString)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        call(with: request, completion: completion)
    }
    /// this is the private function that would calles the API endpoint. The information is then encoded to be used later in the app
    private func call<T: Codable>(with request: URLRequest,
                                  completion: @escaping((Result<T, NetworkError>) -> Void)) {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                //return network failed error when network connection returns error
                completion(.failure(.failedRequest))
                return
            }
            
            guard let responseData = data else {
                //return empty respone error
                completion(.failure(.emptyResponse))
                return
            }
            
            do {
                // this saves the data received to the path
                // can be updated to be done somewhere else.
                PersistenceManager().persistData(dataToSave: responseData, path: self.urlExtension)
                //tries to parse response
                let responseModel = try JSONDecoder().decode(T.self, from: responseData)
                completion(.success(responseModel))
            } catch {
                //unable to parse response, return invalid response
                completion(.failure(.invalidResponse))
            }
        }
        dataTask.resume()
    }
}

enum Method: String {
    case GET
    case POST
}

enum NetworkError: Error, Equatable {
    case invalidURL
    case emptyResponse
    case invalidResponse
    case failedRequest
    case responseInvalid
}
