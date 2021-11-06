//
//  Constants.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/24/21.
//

import UIKit

struct K {
    static let categories = ["Warm up", "Funny", "Sexy & dirty", "Random"]
    static let descriptions = ["Get to know each other with simple & cool questions, perfect for beginners! 🎉",
                               "The funniest ice-breakers you can get 😂",
                               "These questions will spice up any boring conversation 😏",
                               "Simply anything and everything ✨"]
    
    static let cellName = "categoryCell"
    static let categoryScreenTitle = "Choose Category"
    
    struct AssetsNames {
        static let visbyRound = "VisbyRoundCF-Bold"
        static let goButton = "GoButton"
        static let pinkBackground = "PinkBackground"
        static let settingsButton = "SettingsButton"
        static let playButton = "PlayButton"
        static let appLogo = "iLoveYouLogo"
        static let shareButton = "ShareButton"
        static let nextButton = "NextButtonArrow"
        static let exitButton = "ExitButton"
    }
    struct Colours {
        static let pinkColor = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        static let whitePastelColor = UIColor(red: 0.96, green: 0.98, blue: 0.98, alpha: 1.00)
        static let pureBlack = UIColor.black
    }
    struct Calculations {
        static let uiScreenPlus = UIScreen.main.bounds.height / 4
        static let uiScreenMinus = UIScreen.main.bounds.height / -4
    }
    struct SymbolNames {
        static let shareSymbol = "square.and.arrow.up"
        static let nextSymbol = "arrow.forward.circle.fill"
        static let xmarkCircle = "xmark.circle"
    }
}
