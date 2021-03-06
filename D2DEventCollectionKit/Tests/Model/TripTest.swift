//
//  TripTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 03/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class TripTest: XCTestCase {
    
    func testValidateJSONOnlyWithRequiredParameterSet() {
        
        let origin = Place(latitude: 52.5300641,
                            longitude: 13.4008385,
                            name: "Door2Door HQ",
                            street: "Torstrasse 109",
                            city: "Berlin",
                            postalCode:"10119",
                            country: "Germany")
        
        guard let originJSONRepresentation = origin.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(originJSONRepresentation.count == 7)
        
        let destination = Place(latitude: 52.5230554,
                                longitude: 13.4122575,
                                name: "Alexanderplatz",
                                street: "Alexanderplatz",
                                city: "Berlin",
                                postalCode:"10178",
                                country: "Germany")
        
        guard let destinationJSONRepresentation = destination.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(destinationJSONRepresentation.count == 7)
        
        
        let departure = PlaceAtTime(place: origin, timestamp: nil)
        
        guard let departurejsonRepresentation = departure.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(departurejsonRepresentation.count == 2)
        
        
        let arrival = PlaceAtTime(place: destination, timestamp: nil)

        guard let arrivaljsonRepresentation = arrival.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(arrivaljsonRepresentation.count == 2)
        
        
        let trip = Trip(departure: departure, arrival: arrival, modesOfTransportation: [ModesOfTransportation.taxi])
        
        guard let tripJSONRepresentation = trip.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(tripJSONRepresentation.count == 3)
    }
    
    
    
}

