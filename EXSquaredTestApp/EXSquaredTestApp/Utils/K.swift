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
        static let loadingText = NSLocalizedString("loading_text", comment: "Text displayed while loading")
        static let noImageAvailable = NSLocalizedString("no_image_available", comment: "Text displayed when there is no image available")
    }
    
    struct API {
        static let baseURL = EnvManager.shared.get("BASE_URL") ?? "https://api.default.com"
        static let apiKey = EnvManager.shared.get("API_KEY") ?? "default-api-key"
        static let imageBaseURL = EnvManager.shared.get("IMAGE_BASE_URL") ?? "https://cdn2.thecatapi.com/images/"
    }
    
    struct Test {
        static let testingArgument = "--uitesting"
        static let errorLoadingCats = "Failed to load cats"
        static let loadingIndicator = "loadingIndicator"
        static let catListView = "catListView"
        static let firstCatItemError = "The first cat item should load within 5 seconds"
        static let multipleItemsError = "The first cat item should exist"
        static let secondItemError = "The second cat item should also be displayed"
        static let newItemError = "Newly fetched items should appear after scrolling"
        static let detailViewError = "Detail view should be displayed after tapping a cat"
        static let firstItemNotFound = "The first cat item should exist"
        static let detailViewNotDisplayed = "Detail view should be displayed after tapping a cat"
        static let descriptionNotFound = "The cat description should be displayed"
        static let originNotFound = "Origin should be displayed"
        static let lifeSpanNotFound = "Life Span should be displayed"
        static let temperamentNotFound = "Temperament should be displayed"
        static let catImageNotFound = "The cat image should be displayed"
        static let navigationVisibleTitle = "The navigation title should be visible"
        static let catListTitle = "Cat Breeds"
        static let detailViewTitle = "detailViewTitle"
        static let detailViewDescription = "detailViewDescription"
        static let detailViewOrigin = "Origin"
        static let detailViewLifeSpan = "Life Span"
        static let detailViewTemperament = "Temperament"
        static let catImageView = "catImageView"
        static let cacheRetrieveError = "The image should be retrieved from the cache"
        static let cacheImageMismatch = "The retrieved image should be the same as the stored one"
        static let invalidURLError = "Should return nil for an invalid URL"
        static let testImageURL = "https://example.com/test-image.jpg"
        static let invalidImageURL = "invalid-url"
    }
    
    struct AccessibilityIdentifiers {
        static let detailView = "detailView"
        static let catImageView = "catImageView"
        static let detailViewTitle = "detailViewTitle"
        static let detailViewDescription = "detailViewDescription"
        static let detailViewOrigin = "Origin"
        static let detailViewLifeSpan = "Life Span"
        static let detailViewTemperament = "Temperament"
        
        static let catListView = "catListView"
        static let loadingIndicator = "loadingIndicator"
        static let errorViewMessage = "errorViewMessage"
        static let catNamePrefix = "catName_"
    }
}
