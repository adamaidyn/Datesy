//
//  GameplayVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/26/21.
//

import UIKit

class GameplayVC: UIViewController {
    
    
    // MARK: - Objectas and properties
    
    private var uiElements = UIElements()
    
    private var questions = Questions()
    
    var currentCategory: String = ""
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        configureNavBar()
        configureBarButtons()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        
        uiElements.nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        
        pullUpQuestions()
        
        configureQuestionText()
        
    }
    
    // MARK: - Bar Buttons
    @objc private func shareButtonPressed() {
        
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Buttons
    @objc private func nextButtonPressed() {
        
        pullUpQuestions()
    }
    
    // MARK: - Display info methods
    func pullUpQuestions() {
        let randomCategories = questions.funny + questions.sexyDirty + questions.warmUp
        
        if currentCategory == questions.categories[0] {
            showRandomQuestion(questions: questions.warmUp)
        } else if currentCategory == questions.categories[1] {
            showRandomQuestion(questions: questions.funny)
        } else if currentCategory == questions.categories[2] {
            showRandomQuestion(questions: questions.sexyDirty)
        } else if currentCategory == questions.categories[3] {
            showRandomQuestion(questions: randomCategories)
        } else {
            uiElements.questionText.text = K.gameplayErrorMessage
        }
    }
}
// MARK: - Extensions

//Constraints
extension GameplayVC {
    private func setConstraints() {
        view.addSubview(uiElements.backgroundImageview)
        view.addSubview(uiElements.questionWindow)
        view.addSubview(uiElements.nextButton)
        
        uiElements.questionWindow.addSubview(uiElements.questionText)
        
        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        
        let questionViewLayout = uiElements.questionWindow.layoutMarginsGuide
        
        // Background image
        constraints.append(uiElements.backgroundImageview.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(uiElements.backgroundImageview.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(uiElements.backgroundImageview.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(uiElements.backgroundImageview.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        // question window
        constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
        constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: K.Calculations.uiScreenPlus))
        constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: K.Calculations.uiScreenMinus))
        
        // Next button
        constraints.append(uiElements.nextButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: UIScreen.main.bounds.height / -42.2))
        constraints.append(uiElements.nextButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        
        // Question text
        constraints.append(uiElements.questionText.centerXAnchor.constraint(equalTo: questionViewLayout.centerXAnchor))
        constraints.append(uiElements.questionText.centerYAnchor.constraint(equalTo: questionViewLayout.centerYAnchor))
        constraints.append(uiElements.questionText.topAnchor.constraint(equalTo: questionViewLayout.topAnchor))
        constraints.append(uiElements.questionText.bottomAnchor.constraint(equalTo: questionViewLayout.bottomAnchor))
        constraints.append(uiElements.questionText.leadingAnchor.constraint(equalTo: questionViewLayout.leadingAnchor))
        constraints.append(uiElements.questionText.trailingAnchor.constraint(equalTo: questionViewLayout.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    

}
// MARK: - UI Configurations
extension GameplayVC {
    private func configureBarButtons() {
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .default)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: K.SymbolNames.xmarkCircle, withConfiguration: config),
            style: .done,
            target: self,
            action: #selector(dismissSelf)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: K.SymbolNames.shareSymbol, withConfiguration: config),
            style: .done,
            target: self,
            action: #selector(shareButtonPressed)
        )
    }
    private func configureNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureQuestionText() {
        let deviceType = UIDevice.current.deviceType

        switch deviceType {
        
        case .iPhone4_4S:
            uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)

        case .iPhones_5_5s_5c_SE:
            uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)

        case .iPhones_6_6s_7_8:
            uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)

        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: 28)

        case .iPhoneX:
            uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: 28)

        default:
            uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: 28)
        }
    }
}
// MARK: - Display random text method
extension GameplayVC {
    private func showRandomQuestion(questions: [String]) {
        if questions.count > 0 {
    
            var quest = questions
    
            // random key from array
            let arrayKey = Int(arc4random_uniform(UInt32(quest.count)))
    
            // your random number
            let randQuestion = quest[arrayKey]
    
            // make sure the number isnt repeated
            quest.swapAt(arrayKey, quest.count-1)
            quest.removeLast()
    
            uiElements.questionText.text = randQuestion
        }
    }
}
