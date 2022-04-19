//
//  NetworkConectionTests.swift
//  StarWarsTests
//
//  Created by Shalom Owolabi on 19/04/2022.
//

import XCTest
@testable import StarWars

class NetworkConectionTests: XCTestCase {
    var sut: NetworkService!
    var session = MockURLSession()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkService(withMethod: .GET, withURLExtension: .films, session: session)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_get_resume_called() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        sut.getSpeciesInformation { someResponse in
            //Return Data
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data_for_planet() {
        let expectedData = "{\"count\":60,\"next\":\"https://swapi.dev/api/planets/?page=2\",\"previous\":\"https://swapi.dev/api/planets/?page=2\",\"results\":[{\"name\":\"Kamino\",\"rotation_period\":\"27\",\"orbital_period\":\"463\",\"diameter\":\"19720\",\"climate\":\"temperate\",\"gravity\":\"1standard\",\"terrain\":\"ocean\",\"surface_water\":\"100\",\"population\":\"1000000000\",\"residents\":[\"https://swapi.dev/api/people/22/\",\"https://swapi.dev/api/people/72/\",\"https://swapi.dev/api/people/73/\"],\"films\":[\"https://swapi.dev/api/films/5/\"],\"created\":\"2014-12-10T12:45:06.577000Z\",\"edited\":\"2014-12-20T20:58:18.434000Z\",\"url\":\"https://swapi.dev/api/planets/10/\"}]}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: PlanetsModel?
        var actualError: Error?
        let dataExpectation = expectation(description: "data")
        sut.getPlanetInformation { data in
            print(data, "holding")
            switch data {
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            dataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (_) in
            XCTAssertNil(actualError)
            XCTAssertNotNil(actualData)
        }
    }
    
    func test_get_should_return_data_for_people() {
        let expectedData = "{\"count\":82,\"next\":\"https://swapi.dev/api/people/?page=2\",\"previous\":null,\"results\":[{\"name\":\"Obi-WanKenobi\",\"height\":\"182\",\"mass\":\"77\",\"hair_color\":\"auburn,white\",\"skin_color\":\"fair\",\"eye_color\":\"blue-gray\",\"birth_year\":\"57BBY\",\"gender\":\"male\",\"homeworld\":\"https://swapi.dev/api/planets/20/\",\"films\":[\"https://swapi.dev/api/films/1/\",\"https://swapi.dev/api/films/2/\",\"https://swapi.dev/api/films/3/\",\"https://swapi.dev/api/films/4/\",\"https://swapi.dev/api/films/5/\",\"https://swapi.dev/api/films/6/\"],\"species\":[],\"vehicles\":[\"https://swapi.dev/api/vehicles/38/\"],\"starships\":[\"https://swapi.dev/api/starships/48/\",\"https://swapi.dev/api/starships/59/\",\"https://swapi.dev/api/starships/64/\",\"https://swapi.dev/api/starships/65/\",\"https://swapi.dev/api/starships/74/\"],\"created\":\"2014-12-10T16:16:29.192000Z\",\"edited\":\"2014-12-20T21:17:50.325000Z\",\"url\":\"https://swapi.dev/api/people/10/\"}]}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: PeopleModel?
        var actualError: Error?
        let dataExpectation = expectation(description: "data")
        sut.getPeopleInformation { data in
            print(data, "holding")
            switch data {
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            dataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (_) in
            XCTAssertNil(actualError)
            XCTAssertNotNil(actualData)
        }
    }
    
    func test_get_should_return_data_for_starship() {
        let expectedData = "{\"count\":36,\"next\":\"https://swapi.dev/api/starships/?page=2\",\"previous\":null,\"results\":[{\"name\":\"Rebeltransport\",\"model\":\"GR-75mediumtransport\",\"manufacturer\":\"GallofreeYards,Inc.\",\"cost_in_credits\":\"unknown\",\"length\":\"90\",\"max_atmosphering_speed\":\"650\",\"crew\":\"6\",\"passengers\":\"90\",\"cargo_capacity\":\"19000000\",\"consumables\":\"6months\",\"hyperdrive_rating\":\"4.0\",\"MGLT\":\"20\",\"starship_class\":\"Mediumtransport\",\"pilots\":[],\"films\":[\"https://swapi.dev/api/films/2/\",\"https://swapi.dev/api/films/3/\"],\"created\":\"2014-12-15T12:34:52.264000Z\",\"edited\":\"2014-12-20T21:23:49.895000Z\",\"url\":\"https://swapi.dev/api/starships/17/\"}]}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: StarShipsModel?
        var actualError: Error?
        let dataExpectation = expectation(description: "data")
        sut.getStarshipInformation { data in
            print(data, "holding")
            switch data {
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            dataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (_) in
            XCTAssertNil(actualError)
            XCTAssertNotNil(actualData)
        }
    }
    
    func test_get_should_return_data_for_vehicles() {
        let expectedData = "{\"count\":39,\"next\":\"https://swapi.dev/api/vehicles/?page=2\",\"previous\":null,\"results\":[{\"name\":\"Sailbarge\",\"model\":\"ModifiedLuxurySailBarge\",\"manufacturer\":\"UbrikkianIndustriesCustomVehicleDivision\",\"cost_in_credits\":\"285000\",\"length\":\"30\",\"max_atmosphering_speed\":\"100\",\"crew\":\"26\",\"passengers\":\"500\",\"cargo_capacity\":\"2000000\",\"consumables\":\"Livefoodtanks\",\"vehicle_class\":\"sailbarge\",\"pilots\":[],\"films\":[\"https://swapi.dev/api/films/3/\"],\"created\":\"2014-12-18T10:44:14.217000Z\",\"edited\":\"2014-12-20T21:30:21.684000Z\",\"url\":\"https://swapi.dev/api/vehicles/24/\"}]}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: VehiclesModel?
        var actualError: Error?
        let dataExpectation = expectation(description: "data")
        sut.getVehicleInformation { data in
            print(data, "holding")
            switch data {
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            dataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (_) in
            XCTAssertNil(actualError)
            XCTAssertNotNil(actualData)
        }
    }
    
    func test_get_should_return_data_for_films() {
        let expectedData = "{\"count\":39,\"next\":\"https://swapi.dev/api/vehicles/?page=2\",\"previous\":\"\",\"results\":[{\"title\":\"ANewHope\",\"episode_id\":4,\"opening_crawl\":\"Itisaperiodofcivilwar.\\r\\nRebelspaceships,striking\\r\\nfromahiddenbase,havewon\\r\\ntheirfirstvictoryagainst\\r\\ntheevilGalacticEmpire.\\r\\n\\r\\nDuringthebattle,Rebel\\r\\nspiesmanagedtostealsecret\\r\\nplanstotheEmpire's\\r\\nultimateweapon,theDEATH\\r\\nSTAR,anarmoredspace\\r\\nstationwithenoughpower\\r\\ntodestroyanentireplanet.\\r\\n\\r\\nPursuedbytheEmpire's\\r\\nsinisteragents,Princess\\r\\nLeiaraceshomeaboardher\\r\\nstarship,custodianofthe\\r\\nstolenplansthatcansaveher\\r\\npeopleandrestore\\r\\nfreedomtothegalaxy....\",\"director\":\"GeorgeLucas\",\"producer\":\"GaryKurtz,RickMcCallum\",\"release_date\":\"1977-05-25\",\"characters\":[\"https://swapi.dev/api/people/1/\",\"https://swapi.dev/api/people/2/\",\"https://swapi.dev/api/people/3/\",\"https://swapi.dev/api/people/4/\",\"https://swapi.dev/api/people/5/\",\"https://swapi.dev/api/people/6/\",\"https://swapi.dev/api/people/7/\",\"https://swapi.dev/api/people/8/\",\"https://swapi.dev/api/people/9/\",\"https://swapi.dev/api/people/10/\",\"https://swapi.dev/api/people/12/\",\"https://swapi.dev/api/people/13/\",\"https://swapi.dev/api/people/14/\",\"https://swapi.dev/api/people/15/\",\"https://swapi.dev/api/people/16/\",\"https://swapi.dev/api/people/18/\",\"https://swapi.dev/api/people/19/\",\"https://swapi.dev/api/people/81/\"],\"planets\":[\"https://swapi.dev/api/planets/1/\",\"https://swapi.dev/api/planets/2/\",\"https://swapi.dev/api/planets/3/\"],\"starships\":[\"https://swapi.dev/api/starships/2/\",\"https://swapi.dev/api/starships/3/\",\"https://swapi.dev/api/starships/5/\",\"https://swapi.dev/api/starships/9/\",\"https://swapi.dev/api/starships/10/\",\"https://swapi.dev/api/starships/11/\",\"https://swapi.dev/api/starships/12/\",\"https://swapi.dev/api/starships/13/\"],\"vehicles\":[\"https://swapi.dev/api/vehicles/4/\",\"https://swapi.dev/api/vehicles/6/\",\"https://swapi.dev/api/vehicles/7/\",\"https://swapi.dev/api/vehicles/8/\"],\"species\":[\"https://swapi.dev/api/species/1/\",\"https://swapi.dev/api/species/2/\",\"https://swapi.dev/api/species/3/\",\"https://swapi.dev/api/species/4/\",\"https://swapi.dev/api/species/5/\"],\"created\":\"2014-12-10T14:23:31.880000Z\",\"edited\":\"2014-12-20T19:49:45.256000Z\",\"url\":\"https://swapi.dev/api/films/1/\"}]}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: FilmsModel?
        var actualError: Error?
        let dataExpectation = expectation(description: "data")
        sut.getFilmsInformation { data in
            print(data, "holding")
            switch data {
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            dataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (_) in
            XCTAssertNil(actualError)
            XCTAssertNotNil(actualData)
        }
    }
    
    func test_get_should_return_data_for_species() {
        let expectedData = "{\"count\":39,\"next\":\"https://swapi.dev/api/vehicles/?page=2\",\"previous\":\"\",\"results\":[{\"name\":\"Human\",\"classification\":\"mammal\",\"designation\":\"sentient\",\"average_height\":\"180\",\"skin_colors\":\"caucasian,black,asian,hispanic\",\"hair_colors\":\"blonde,brown,black,red\",\"eye_colors\":\"brown,blue,green,hazel,grey,amber\",\"average_lifespan\":\"120\",\"homeworld\":\"https://swapi.dev/api/planets/9/\",\"language\":\"GalacticBasic\",\"people\":[\"https://swapi.dev/api/people/66/\",\"https://swapi.dev/api/people/67/\",\"https://swapi.dev/api/people/68/\",\"https://swapi.dev/api/people/74/\"],\"films\":[\"https://swapi.dev/api/films/1/\",\"https://swapi.dev/api/films/2/\",\"https://swapi.dev/api/films/3/\",\"https://swapi.dev/api/films/4/\",\"https://swapi.dev/api/films/5/\",\"https://swapi.dev/api/films/6/\"],\"created\":\"2014-12-10T13:52:11.567000Z\",\"edited\":\"2014-12-20T21:36:42.136000Z\",\"url\":\"https://swapi.dev/api/species/1/\"}]}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: SpeciesModel?
        var actualError: Error?
        let dataExpectation = expectation(description: "data")
        sut.getSpeciesInformation { data in
            print(data, "holding")
            switch data {
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            dataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (_) in
            XCTAssertNil(actualError)
            XCTAssertNotNil(actualData)
        }
    }
    
    func test_get_should_return_with_error() {
        let expectedError = NSError(domain: "error", code: 1234, userInfo: nil)
        session.nextError = expectedError
        
        var actualError: Error?
        var actualData: PlanetsModel?
        let errorExpectation = expectation(description: "error")
        sut.getPlanetInformation { data in
            switch data{
            case .success(let dataInfo):
                actualData = dataInfo
            case .failure(let errors):
                actualError = errors
            }
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (_) in
            XCTAssertNil(actualData)
            XCTAssertNotNil(actualError)
        }
    }
}
