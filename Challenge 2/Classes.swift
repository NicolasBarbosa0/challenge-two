//
//  Classes.swift
//  Challenge 2
//
//  Created by Nicolas Barbosa on 31/03/22.
//

import Foundation

//Class "User" stores the list of subjects added by the user
class User {
    let name: String?
    var subject: Array<Subject>?
    var busy: Array<Hours>?
    var rest: Array<Hours>?
    
    init(name: String, subject: Array<Subject>, busy: Array<Hours>?, rest: Array<Hours>?){
        self.name = name
        self.subject = subject
        self.busy = busy
        self.rest = rest
    }
}

// Class "Subject" stores the name of a subject it's topic and importance
class Subject {
    var name: String?
    var topic: String?
    var importance: Int
    
    init(name: String?, topic: String?, importance: Int) {
        self.name = name
        self.topic = topic
        self.importance = importance
    }
}


// Class "Hours" stores available and unavailable time of the user
class Hours {
    var available: Array<Double>?
    var unavailable: Array<Double>?
    
    init(available: Array<Double>?, unavailable: Array<Double>?){
        self.available = available
        self.unavailable = unavailable
    }
}
