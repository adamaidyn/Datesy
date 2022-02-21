//
//  Constants.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/24/21.
//

import UIKit

struct K {
    static let descriptions = ["Get to know each other with simple & cool questions, perfect for beginners! 🎉",
                               "The funniest ice-breakers you can get 😂",
                               "These questions will spice up any boring conversation 😏",
                               "Simply anything and everything ✨"
    ]
    
    static let cellName = "categoryCell"
    static let categoryScreenTitle = "Categories"
    static let gameplayErrorMessage = "Error occured while fetching the question"
    static let invalidTextMessage = "Invalid text"
    static let invalidSectionMessage = "Invalid section"
    static let alertMessage = "Questions ended, back to the first question"
    static let emptyString = ""
    static let skipButtonTitle = "Skip"
    static let doneButtonTitle = "Done"
    static let tutorialWelcomeMessage = "Welcome to Datesy. Here’s how to use it"
    static let getYourPartnerMessage = "Get your partner, friend or anyone you want."
    static let chooseCatMessage = "Choose category in the app"
    static let directionsMessage = "Ask each other questions that appear on the screen. Have fun 😉"
    struct AssetsNames {
        static let visbyRound = "VisbyRoundCF-Bold"
        static let varelaRound = "VarelaRound-Regular"
        static let boldyFont = "MPLUSRounded1c-Bold"
        
        static let goButton = "GoButton"
        static let goButtonPurple = "PurpleGoButton"
        static let pinkBackground = "PinkBackground"
        static let blueBlackground = "BlueGradientBackground"
        static let settingsButton = "SettingsButton"
        static let playButton = "PlayButton"
        static let playButtonPurple = "PlayButtonPurple"
        static let appLogo = "iLoveYouLogo"
        static let shareButton = "ShareButton"
        static let nextButton = "NextButtonArrow"
        static let exitButton = "ExitButton"
        static let backgrounds = ["RichPinkColor", "BlueGradientBackground"]
        static let loveAppImage = "LoveApp"
        static let haveFunImage = "HaveFun"
        static let askQuestionsImage = "AskQuestions"
        static let getFriedImage = "getFriend"
        static let chooseCategoryImage = "ChooseCat"
        static let haveFun2Image = "280"
        
    }
    struct Colours {
        static let pinkColor = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        static let whitePastelColor = UIColor(red: 0.96, green: 0.98, blue: 0.98, alpha: 1.00)
        static let pureBlack = UIColor.black
        static let specialPurple = UIColor(red: 0.33, green: 0.31, blue: 0.67, alpha: 1.00)
        static let lightPurple = UIColor(red: 1.00, green: 0.78, blue: 0.78, alpha: 1.00)
    }
    struct Calculations {
        static let uiScreenPlus = UIScreen.main.bounds.height / 3.5
        static let uiScreenMinus = UIScreen.main.bounds.height / -3.5
    }
    struct SymbolNames {
        static let shareSymbol = "square.and.arrow.up"
        static let nextSymbol = "arrow.forward.circle"
        static let xmarkCircle = "xmark.circle"
        static let sliderHorizontal = "slider.horizontal.3"
        static let infoCircle = "info.circle"
    }
    struct settingConsts {
        static let navigationTitle = "Settings"
        static let restorePurchaseExplanation = "If you made an app-purchase on this app and lost access to it, please tap 'Restore Purchases' to regain access"
        static let settingsCellName = "settingsCell"
    }
    struct userDefaultsKeys {
        static let newUserID = "newUserID"
    }
    

}
