//
//  DestinationDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

struct DestinationDto: Decodable {
    let id: Int
    let title: String
    let city: String
    let country: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case city
        case country
        case poster = "posterPath"
    }
}
