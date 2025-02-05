//
//  K.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct K {
    struct Pagination {
        static let defaultLimit = 10
        static let initialPage = 1
    }
    
    struct UIConfig {
        static let cardWidth = UIScreen.main.bounds.width - 50
        static let cardHeight: CGFloat = 200
        static let cardCornerRadius: CGFloat = 15
        static let shadowRadius: CGFloat = 5
        static let tagPadding: CGFloat = 6
        static let tagCornerRadius: CGFloat = 10
    }
    
    struct Strings {
        static let defaultCatName = NSLocalizedString("default_cat_name", comment: "Default name for a cat when missing")
        static let defaultDescription = NSLocalizedString("default_description", comment: "Default description placeholder")
        static let yearsLabel = NSLocalizedString("years_label", comment: "Label for lifespan")//years
        static let energyLabel = NSLocalizedString("energy_label", comment: "Label for energy level")//Energy
        static let adaptabilityLabel = NSLocalizedString("adaptability_label", comment: "Label for adaptability")//Adpt
        static let navigationTitle = NSLocalizedString("cat_breeds_title", comment: "Title for cat breeds list")
        
        static let unknown = NSLocalizedString("unknown", comment: "Placeholder for unknown values")
        static let noDescription = NSLocalizedString("no_description", comment: "Placeholder for missing description")
        static let origin = NSLocalizedString("origin", comment: "Label for cat origin")
        static let lifeSpan = NSLocalizedString("life_span", comment: "Label for cat lifespan")
        static let temperament = NSLocalizedString("temperament", comment: "Label for cat temperament")
        static let detailTitle = NSLocalizedString("detail", comment: "Title for detail view")
        static let years = NSLocalizedString("years", comment: "Label for years in lifespan")
        static let notAvailable = NSLocalizedString("not_Available", comment: "Label for years in lifespan")
        static let colonSeparator = NSLocalizedString("colon_separator", comment: "Separator for title and value")
        
        static let adaptability = NSLocalizedString("adaptability", comment: "Label for adaptability stat")
        static let affectionLevel = NSLocalizedString("affection_level", comment: "Label for affection level stat")
        static let childFriendly = NSLocalizedString("child_friendly", comment: "Label for child-friendly stat")
        static let dogFriendly = NSLocalizedString("dog_friendly", comment: "Label for dog-friendly stat")
        static let intelligence = NSLocalizedString("intelligence", comment: "Label for intelligence stat")
        
        static let moreInfo = NSLocalizedString("more_info", comment: "Title for more info section")
        static let wikipedia = NSLocalizedString("wikipedia", comment: "Label for Wikipedia link")
        static let cfa = NSLocalizedString("cfa", comment: "Label for CFA link")
        static let vetstreet = NSLocalizedString("vetstreet", comment: "Label for Vetstreet link")
        static let vcaHospitals = NSLocalizedString("vca_hospitals", comment: "Label for VCA Hospitals link")
    }
}
