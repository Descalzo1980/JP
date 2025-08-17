//
//  Predators.swift
//  JurassicPark
//
//  Created by Станислав Леонов on 16.08.2025.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredaterData()
    }
    
    func decodeApexPredaterData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decode = JSONDecoder()
                decode.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decode.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decode JSON data: \(error)")
            }
        }
    }
    
    func search(for searchText: String) -> [ApexPredator] {
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter {
                predators in predators.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
}
