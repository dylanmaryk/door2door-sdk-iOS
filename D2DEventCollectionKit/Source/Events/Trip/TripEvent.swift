//
//  TripEvent.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 25/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


public enum Action {
    
    case search
    case interest
    case begin
    case pay
    case end
    case cancel
    
    func stringRepresentation() -> String {
        
        switch self {
            case .search:
                return "search"
            case .interest:
                return "interest"
            case .begin:
                return "begin"
            case .pay:
                return "pay"
            case .end:
                return "end"
            case .cancel:
                return "cancel"
        }
    }
}


@objc (D2DTripEvent) public class TripEvent: Event {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var trip: Trip
    public fileprivate(set) var action: Action
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    public init(action: Action, trip: Trip) {
        
        self.trip = trip
        self.action = action
    
        let configuration = EventCollectionKit.sharedInstance.configuration
        
        let client = Client(deviceID: Session.deviceID(),
                            plattform: Session.plattform(),
                            application:configuration?.applicationName ?? "Application name not set.",
                            version: configuration?.applicationVersion)
        
        let actor = Person(client: client)
        
        super.init(actor: actor)
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: Object to JSON Dict Mapping
    // ------------------------------------------------------------------------------------------
    public override func jsonRepresentation() -> Dictionary<String, Any> {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["action"] = self.action.stringRepresentation()
        jsonDictionary["timestamp"] = self.timeStamp
        jsonDictionary["actor"] = self.actor.jsonRepresentation()
        jsonDictionary["trip"] = self.trip.jsonRepresentation()

        return jsonDictionary
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Helper
    // ------------------------------------------------------------------------------------------
    public class func map(modesOfTransportationsNumberRepresentation: [NSNumber]) -> [ModesOfTransportation] {
        
        let result:[ModesOfTransportation] = modesOfTransportationsNumberRepresentation.map {
            
            if let mode = ModesOfTransportation(rawValue: $0.intValue) {
                
                return mode
            }
            else {
                return .other
            }
        }
        
        return result
    }
 }
