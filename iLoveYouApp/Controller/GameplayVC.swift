//
//  GameplayVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/26/21.
//

import UIKit

class GameplayVC: UIViewController {
    
    private var uiElements = UIElements()
    
    private var questions = Questions()
    
    private let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .default)
    
    var currentCategory: String = ""
    
    var categoryNumber: Int?
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        configureNavBar()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        
        uiElements.nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        
        pullUpQuestions()
        
        //        print(questions.funny.count)
        //        print(questions.warmUp.count)
        //        print(questions.sexyDirty.count)
        
        configureBarButtons()
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
    
    // MARK: - Data manipulation methods
    func pullUpQuestions() {
        let randomCategories = questions.funny + questions.sexyDirty + questions.warmUp
        
        switch currentCategory {
        case "Warm up":
            uiElements.questionText.text = questions.warmUp.randomElement()
        case "Funny":
            uiElements.questionText.text = questions.funny.randomElement()
        case "Sexy & dirty":
            uiElements.questionText.text = questions.sexyDirty.randomElement()
        case "Random":
            uiElements.questionText.text = randomCategories.randomElement()
        default:
            uiElements.questionText.text = "Error occured while fetching the question"
        }
    }
}



// MARK: - Constraints
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

// MARK: - Configuration methods
extension GameplayVC {
    func configureBarButtons() {
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
    func configureNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
extension Int {
    static func randomizer(in range: ClosedRange<Int>, excluding x: Int) -> Int {
        if range.contains(x) {
            let r = Int.random(in: Range(uncheckedBounds: (range.lowerBound, range.upperBound)))
            return r == x ? range.upperBound : r
        } else {
            return Int.random(in: range)
        }
    }
}

