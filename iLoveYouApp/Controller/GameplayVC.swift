//
//  GameplayVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/26/21.
//
//  Credits to Sergey Kargopolov for CopyableLabel
//

import UIKit
import Pastel

class GameplayVC: UIViewController {
    
    // MARK: - Objects and properties
    private var uiElements = UIElements()
    private var questions = Questions()
    
    private var counter = 0
    
    private var shuffledWarmUp: [String] = []
    private var shuffledFunny: [String] = []
    private var shuffledSexyDirty: [String] = []
    
    private var randomCategories: [String] = []
    
    private let pastelView: PastelView = {
        let view = PastelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        // Custom Direction
        view.startPastelPoint = .bottom
        view.endPastelPoint = .topLeft
        
        // Custom Duration
        view.animationDuration = 4.0
        
        // Custom Color
        view.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                        UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                        UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                        UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                        UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                        UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                        UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        return view
    }()
    
    var currentCategory: String = ""
    
    let generator = UIImpactFeedbackGenerator(style: .medium)
    let generators = UINotificationFeedbackGenerator()
    
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
        
        configureQuestionText()
        
        configurePastelView()
        
        shuffledWarmUp = questions.warmUp.shuffled()
        shuffledFunny = questions.funny.shuffled()
        shuffledSexyDirty = questions.sexyDirty.shuffled()
        
        randomCategories = questions.funny.shuffled() + questions.sexyDirty.shuffled() + questions.warmUp.shuffled()
        
        showQuestions()
        
        print(randomCategories.count)
        
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked))
        uiElements.questionText.addGestureRecognizer(guestureRecognizer)
    }
    
    // MARK: - Bar Buttons
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Buttons
    @objc private func nextButtonPressed() {
        
        showQuestions()
        
        if uiElements.questionText.text == shuffledWarmUp.first || uiElements.questionText.text == shuffledFunny.first || uiElements.questionText.text == shuffledSexyDirty.first || uiElements.questionText.text == randomCategories.first{
            showAlert()
            
        }
        generator.impactOccurred()
    }
    
    @objc private func labelClicked() {
        print("label clicked")
    }
    
    // MARK: - Display info methods
    private func showQuestions() {
        if currentCategory == questions.categories[0] {
            uiElements.questionText.text = returnRandomQuestion(category: shuffledWarmUp)
        } else if currentCategory == questions.categories[1] {
            uiElements.questionText.text = returnRandomQuestion(category: shuffledFunny)
        } else if currentCategory == questions.categories[2] {
            uiElements.questionText.text = returnRandomQuestion(category: shuffledSexyDirty)
        } else if currentCategory == questions.categories[3] {
            uiElements.questionText.text = returnRandomQuestion(category: randomCategories.shuffled())
        } else {
            uiElements.questionText.text = K.gameplayErrorMessage
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: K.alertMessage,
            message: K.emptyString,
            preferredStyle: .alert)
        
        self.present(alert, animated: true, completion: nil)
        generators.notificationOccurred(.warning)
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)})
    }
}
// MARK: - Extensions

//Constraints
extension GameplayVC {
    private func setConstraints() {
        view.addSubview(pastelView)
        view.addSubview(uiElements.questionWindow)
        view.addSubview(uiElements.nextButton)
        
        uiElements.questionWindow.addSubview(uiElements.questionText)
        
        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        
        let questionViewLayout = uiElements.questionWindow.layoutMarginsGuide
        
        // Background image
        constraints.append(pastelView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(pastelView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(pastelView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(pastelView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
    
        // question window
        constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
        constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(uiElements.questionWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: K.Calculations.uiScreenPlus))
        constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: K.Calculations.uiScreenMinus))
        
        
        // Question text
        constraints.append(uiElements.questionText.centerXAnchor.constraint(equalTo: questionViewLayout.centerXAnchor))
        constraints.append(uiElements.questionText.centerYAnchor.constraint(equalTo: questionViewLayout.centerYAnchor))
//        constraints.append(uiElements.questionText.topAnchor.constraint(equalTo: questionViewLayout.topAnchor))
//        constraints.append(uiElements.questionText.bottomAnchor.constraint(equalTo: questionViewLayout.bottomAnchor))
        constraints.append(uiElements.questionText.leadingAnchor.constraint(equalTo: questionViewLayout.leadingAnchor))
        constraints.append(uiElements.questionText.trailingAnchor.constraint(equalTo: questionViewLayout.trailingAnchor))
        
        // Next button
        constraints.append(uiElements.nextButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: UIScreen.main.bounds.height / -42.2))
        constraints.append(uiElements.nextButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}
// MARK: - UI Configurations
extension GameplayVC {
    private func configureBarButtons() {
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: K.SymbolNames.xmarkCircle, withConfiguration: config),
            style: .done,
            target: self,
            action: #selector(dismissSelf)
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
            uiElements.questionText.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height / 28, weight: .semibold)
        case .iPhones_5_5s_5c_SE:
            uiElements.questionText.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height / 28, weight: .semibold)
        case .iPhones_6_6s_7_8:
            uiElements.questionText.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height / 28, weight: .semibold)
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            uiElements.questionText.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        case .iPhoneX:
            uiElements.questionText.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        default:
            uiElements.questionText.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        }
    }
    
    private func configurePastelView() {
        let randomColors = [UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                            UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                            UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                            UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                            UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                            UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                            UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)]
        
        pastelView.setColors(randomColors.shuffled())
        
        pastelView.startAnimation()
    }
}
// MARK: - Display random text method
extension GameplayVC {
    private func returnRandomQuestion(category: [String]) -> String {
        
        let randomQuestion = category[counter % category.count]
        
        counter += 1
        
        return randomQuestion
    }
}

// MARK: - CopyableLabel class
class CopyableLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sharedInit()
    }
    
    func sharedInit() {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.showMenu)))
    }
    
    @objc func showMenu(sender: AnyObject?) {
        self.becomeFirstResponder()
        
        let menu = UIMenuController.shared
        
        if !menu.isMenuVisible {
            menu.showMenu(from: self, rect: bounds)
        }
    }
    
    override func copy(_ sender: Any?) {
        let board = UIPasteboard.general
        
        board.string = text
        
        let menu = UIMenuController.shared
        
        menu.hideMenu()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy)
    }
}
