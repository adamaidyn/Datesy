//
//  CommentedOutCode.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/20/21.
//

//import Foundation


//    func animateMovement() {
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width / 2),
//                                      y: layer.frame.origin.y + (layer.frame.size.height / 2))
//        animation.toValue = CGPoint(x: 300, y: 400)
//        animation.duration = 1
////        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunction)
//        animation.fillMode = .forwards
//        animation.isRemovedOnCompletion = false
//        animation.beginTime = CACurrentMediaTime()
//        layer.add(animation, forKey: nil)
//    }


//        layer.backgroundColor = UIColor.systemIndigo.cgColor
//        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
//        view.layer.addSublayer(layer)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.animateMovement()
//        }

//override func awakeFromNib() {
//    super.awakeFromNib()
//    // Initialization code
//}
//
//override func setSelected(_ selected: Bool, animated: Bool) {
//    super.setSelected(selected, animated: animated)
//
//    // Configure the view for the selected state
//}


//    let pinkCircle: UIView = {
//        let pinkColor = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
//        let whitePastelColor = UIColor(red: 0.96, green: 0.98, blue: 0.98, alpha: 1.00)
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 20
//        view.backgroundColor = pinkColor
//        return view
//    }()

//        constraints.append(descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10))

//        constraints.append(uiElements.questionWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor))
//        constraints.append(uiElements.questionWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor))


//        switch deviceType {
//        case .iPhones_5_5s_5c_SE:
//            constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//            constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//            constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 4))
//            constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: UIScreen.main.bounds.height / -4))
//
//        case .iPhones_6_6s_7_8:
//            constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//            constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//            constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: 150))
//            constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150))
//
//        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
//            constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//            constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//            constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: 200))
//            constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200))
//
//        case .iPhoneX:
//            constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//            constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//            constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: 250))
//            constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250))
//
//        default:
//            print("iPad or Unkown device")
//            constraints.append(uiElements.questionWindow.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//            constraints.append(uiElements.questionWindow.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//            constraints.append(uiElements.questionWindow.topAnchor.constraint(equalTo: view.topAnchor, constant: 250))
//            constraints.append(uiElements.questionWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250))
//        }

//let deviceType = UIDevice.current.deviceType


//extension UIDevice {
//
//    enum DeviceType: String {
//        case iPhone4_4S = "iPhone 4 or iPhone 4S"
//        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
//        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
//        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
//        case iPhoneX = "iPhone X"
//        case unknown = "iPadOrUnknown"
//    }
//
//    var deviceType: DeviceType {
//        switch UIScreen.main.nativeBounds.height {
//        case 960:
//            return .iPhone4_4S
//        case 1136:
//            return .iPhones_5_5s_5c_SE
//        case 1334:
//            return .iPhones_6_6s_7_8
//        case 1920, 2208:
//            return .iPhones_6Plus_6sPlus_7Plus_8Plus
//        case 2436:
//            return .iPhoneX
//        default:
//            return .unknown
//        }
//    }
//}


//        if currentCategory == "Warm up" {
//            uiElements.questionText.text = questions.warmUp.randomElement()
//        } else if currentCategory == "Funny" {
//            uiElements.questionText.text = questions.funny.randomElement()
//        } else if currentCategory == "Sexy & dirty" {
//            uiElements.questionText.text = questions.sexyDirty.randomElement()
//        } else if currentCategory == "Random" {
//            uiElements.questionText.text = randomCategories.randomElement()
//        } else {
//            uiElements.questionText.text = "Error occured while fetching the question"
//        }
        


//switch currentCategory {
//case "Warm up":
//    uiElements.questionText.text = questions.warmUp.randomElement()
//case "Funny":
//    uiElements.questionText.text = questions.funny.randomElement()
//case "Sexy & dirty":
//    uiElements.questionText.text = questions.sexyDirty.randomElement()
//case "Random":
//    uiElements.questionText.text = randomCategories.randomElement()
//default:
//    uiElements.questionText.text = "Error occured while fetching the question"
//}


//func randomizer(questions: [String]) {
//    while questions.count > 0 {
//        
//        var quest = questions
//        
//        // random key from array
//        let arrayKey = Int(arc4random_uniform(UInt32(quest.count)))
//        
//        // your random number
//        let randNum = questions[arrayKey]
//        
//        // make sure the number isnt repeated
//        quest.swapAt(arrayKey, quest.count-1)
//        quest.removeLast()
//        
//        
//        uiElements.questionText.text = randNum
//    }
//}


//let exitButton: UIButton = {
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setImage(UIImage(named: K.AssetsNames.exitButton), for: .normal)
//    return button
//}()

//let shareButton: UIButton = {
//    let largeConfig = UIImage.SymbolConfiguration(pointSize: UIScreen.main.bounds.height / 19, weight: .bold, scale: .large)
//    let largeBoldDoc = UIImage(systemName: K.SymbolNames.shareSymbol, withConfiguration: largeConfig)
//
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setImage(largeBoldDoc, for: .normal)
//    button.tintColor = K.Colours.whitePastelColor
//    return button
//}()

//        print(UIScreen.main.bounds.height / 33.7)
//        print(UIScreen.main.bounds.height / 48)

//navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(
//    title: "Close",
//    style: .done,
//    target: self,
//    action: #selector(dismissSelf))

//struct deviceTypeProperties {
//    static let iphone3_5 = "iPhone 4 or iPhone 4S"
//    static let iphone4_0 = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
//    static let iphone4_7 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
//    static let iphone5_5 = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
//    static let iphone5_8 = "iPhone X"
//    static let unknownIphoneOrIpad = "iPadOrUnknown"
//}

//categoryCell.backgroundView?.alpha = 0.5

//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            //Bring's sender's opacity back up to fully opaque.
//            categoryCell.backgroundView?.alpha = 1
//        }

// Logo image:
//constraints.append(animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
//constraints.append(animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
//constraints.append(animationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200))
//constraints.append(animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200))

//func setupAnimation() {
//    animationView.layer.shadowPath = UIBezierPath(rect: animationView.bounds).cgPath
//    animationView.layer.shadowColor = UIColor.black.cgColor
//    animationView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//    animationView.layer.shadowOpacity = 0.3
//    animationView.layer.shadowRadius = 5
//    
//    animationView.play()
//}

//        print(array[counter % array.count])
        
        
//        print(questions.warmUp[counter % questions.warmUp.count])

//    func pullUpQuestions() {
//        let randomCategories = questions.funny + questions.sexyDirty + questions.warmUp
//
//        if currentCategory == questions.categories[0] {
//            showRandomQuestion(questions: questions.warmUp)
//        } else if currentCategory == questions.categories[1] {
//            showRandomQuestion(questions: questions.funny)
//        } else if currentCategory == questions.categories[2] {
//            showRandomQuestion(questions: questions.sexyDirty)
//        } else if currentCategory == questions.categories[3] {
//            showRandomQuestion(questions: randomCategories)
//        } else {
//            uiElements.questionText.text = K.gameplayErrorMessage
//        }
//    }

//    private func showRandomQuestion(questions: [String]) {
//        if questions.count > 0 {
//
//            var quest = questions
//
//            // random key from array
//            let arrayKey = Int(arc4random_uniform(UInt32(quest.count)))
//
//            // your random number
//            let randQuestion = quest[arrayKey]
//
//            // make sure the number isnt repeated
//            quest.swapAt(arrayKey, quest.count-1)
//            quest.removeLast()
//
//            uiElements.questionText.text = randQuestion
//        }
//    }

//switch uiElements.questionText.text {
//case shuffledWarmUp.first:
//    showAlert()
//case shuffledFunny.first:
//    showAlert()
//case shuffledSexyDirty.first:
//    showAlert()
//case randomCategories.first:
//    showAlert()
//default:
//    print("hz")
//}

//let imageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.image = UIImage(named: "PlayButton")
//    imageView.contentMode = .scaleAspectFill
//    return imageView
//}()

//navigationItem.rightBarButtonItem = UIBarButtonItem(
//    image: UIImage(systemName: K.SymbolNames.shareSymbol, withConfiguration: config),
//    style: .done,
//    target: self,
//    action: #selector(shareButtonPressed)
//)


//    private func configureBarButtons() {
//        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "slider.horizontal.3", withConfiguration: config),
//            style: .done,
//            target: self,
//            action: #selector(settingButtonPressed)
//        )
//    }


//extension UIView {
//    func fadeTo(_ alpha: CGFloat, duration: TimeInterval = 1.0) {
//    DispatchQueue.main.async {
//      UIView.animate(withDuration: duration) {
//        self.alpha = alpha
//      }
//    }
//  }
//
//  func fadeIn(_ duration: TimeInterval = 0.3) {
//    fadeTo(1.0, duration: duration)
//  }
//
//  func fadeOut(_ duration: TimeInterval = 0.3) {
//    fadeTo(0.0, duration: duration)
//  }
//}

//@objc private func shareButtonPressed() {
//    
//}


// Welcome label
//        constraints.append(uiElements.welcomeLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//        constraints.append(uiElements.welcomeLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//        constraints.append(uiElements.welcomeLabel.centerXAnchor.constraint(equalTo: layout.centerXAnchor))
//        constraints.append(uiElements.welcomeLabel.topAnchor.constraint(equalTo: uiElements.editButton.bottomAnchor, constant: 20))
//        constraints.append(uiElements.welcomeLabel.topAnchor.constraint(equalTo: layout.topAnchor))

// Edit Button:
//        constraints.append(uiElements.editButton.topAnchor.constraint(equalTo: layout.topAnchor))
//        constraints.append(uiElements.editButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor))

// Logo image
//        constraints.append(uiElements.logoImage.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//        constraints.append(uiElements.logoImage.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//        constraints.append(uiElements.logoImage.topAnchor.constraint(equalTo: uiElements.welcomeLabel.bottomAnchor))
//        constraints.append(uiElements.logoImage.bottomAnchor.constraint(equalTo: uiElements.playButton.topAnchor))

//        view.addSubview(uiElements.welcomeLabel)
//        view.addSubview(uiElements.editButton)

//navigationItem.leftBarButtonItem = UIBarButtonItem(
//    image: UIImage(systemName: "line.3.horizontal.circle", withConfiguration: config),
//    style: .done,
//    target: self,
//    action: #selector(settingButtonPressed)
//)


//navigationItem.rightBarButtonItem = UIBarButtonItem(
//    title: "Done",
//    style: .done,
//    target: self,
//    action: #selector(dismissSelf)
//)
//navigationItem.rightBarButtonItem?.tintColor = .black


//Tutorial2VC(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)


//class ViewController2: UIViewController {
//    
//    private var uiElements = UIElements()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = K.Colours.whitePastelColor
//        
//        autoLayout()
//        configureUI()
//    }
//    
//    func autoLayout() {
//        var constraints = [NSLayoutConstraint]()
//        
//        let layout = view.layoutMarginsGuide
//        
//        view.addSubview(uiElements.illustImageView)
//        view.addSubview(uiElements.tutorialLabel)
//        
//        // Illustration ImageView
//        constraints.append(uiElements.illustImageView.topAnchor.constraint(equalTo: layout.topAnchor))
//        constraints.append(uiElements.illustImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
//        constraints.append(uiElements.illustImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
//        constraints.append(uiElements.illustImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
//
//        // Description Label
//        constraints.append(uiElements.tutorialLabel.topAnchor.constraint(equalTo: uiElements.illustImageView.bottomAnchor))
//        constraints.append(uiElements.tutorialLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//        constraints.append(uiElements.tutorialLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//        constraints.append(uiElements.tutorialLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor))
//        
//
//        NSLayoutConstraint.activate(constraints)
//        
//    }
//    
//    func configureUI() {
//        uiElements.illustImageView.image = UIImage(named: "GetYourFriend")
//        
//        uiElements.tutorialLabel.text = "Get your partner, friend or anyone you want."
//    }
//    
//}
//
//class ViewController3: UIViewController {
//    
//    private var uiElements = UIElements()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = K.Colours.whitePastelColor
//        
//        autoLayout()
//        configureUI()
//    }
//    
//    func autoLayout() {
//        var constraints = [NSLayoutConstraint]()
//        
//        let layout = view.layoutMarginsGuide
//        
//        view.addSubview(uiElements.illustImageView)
//        view.addSubview(uiElements.tutorialLabel)
//        
//        // Illustration ImageView
//        constraints.append(uiElements.illustImageView.topAnchor.constraint(equalTo: layout.topAnchor))
//        constraints.append(uiElements.illustImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
//        constraints.append(uiElements.illustImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
//        constraints.append(uiElements.illustImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
//
//        // Description Label
//        constraints.append(uiElements.tutorialLabel.topAnchor.constraint(equalTo: uiElements.illustImageView.bottomAnchor))
//        constraints.append(uiElements.tutorialLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//        constraints.append(uiElements.tutorialLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//        constraints.append(uiElements.tutorialLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor))
//
//        NSLayoutConstraint.activate(constraints)
//    }
//    
//    func configureUI() {
//        uiElements.illustImageView.image = UIImage(named: "ChooseCategory")
//        
//        uiElements.tutorialLabel.text = "Choose category in the app"
//    }
//}
//
//class ViewController4: UIViewController {
//    
//    private var uiElements = UIElements()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = K.Colours.whitePastelColor
//        
//        autoLayout()
//        configureUI()
//    }
//    
//    func autoLayout() {
//        var constraints = [NSLayoutConstraint]()
//        
//        let layout = view.layoutMarginsGuide
//        
//        view.addSubview(uiElements.illustImageView)
//        view.addSubview(uiElements.tutorialLabel)
//        
//        // Illustration ImageView
//        constraints.append(uiElements.illustImageView.topAnchor.constraint(equalTo: layout.topAnchor))
//        constraints.append(uiElements.illustImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
//        constraints.append(uiElements.illustImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
//        constraints.append(uiElements.illustImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
//
//        // Description Label
//        constraints.append(uiElements.tutorialLabel.topAnchor.constraint(equalTo: uiElements.illustImageView.bottomAnchor))
//        constraints.append(uiElements.tutorialLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//        constraints.append(uiElements.tutorialLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//        constraints.append(uiElements.tutorialLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor))
//
//        NSLayoutConstraint.activate(constraints)
//    }
//    
//    func configureUI() {
//        uiElements.illustImageView.image = UIImage(named: "AskQuestions")
//        
//        uiElements.tutorialLabel.text = "Ask each other questions that appear on the screen. Have fun 😉"
//    }
//}

//constraints.append(uiElements.tutorialLabel.topAnchor.constraint(equalTo: uiElements.illustImageView.bottomAnchor, constant: 20))
//constraints.append(uiElements.tutorialLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//constraints.append(uiElements.tutorialLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
//constraints.append(uiElements.tutorialLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -40))
//        constraints.append(uiElements.tutorialLabel.centerYAnchor.constraint(equalTo: uiElements.illustImageView.bottomAnchor))

//let testBackgroundImage: UIImageView = {
//    let imageView = UIImageView()
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.contentMode = .scaleAspectFill
//    imageView.image = UIImage(named: "BackImage2")
//    return imageView
//}()


//        constraints.append(testBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor))
//        constraints.append(testBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor))
//        constraints.append(testBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor))
//        constraints.append(testBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor))


//switch deviceType {
//case .iPhone4_4S:
//    uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)
//case .iPhones_5_5s_5c_SE:
//    uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)
//case .iPhones_6_6s_7_8:
//    uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)
//case .iPhones_6Plus_6sPlus_7Plus_8Plus:
//    uiElements.questionText.font = UIFont(name: K.AssetsNames.visbyRound, size: 28)
//case .iPhoneX:
//    uiElements.questionText.font = UIFont(name: K.AssetsNames.varelaRound, size: 28)
//default:
//    uiElements.questionText.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
//}
//}

//label.font = UIFont(name: "FredokaOne-Regular", size: 25)

/// To remove:
//uiElements.questionText.text = "You have your own late night talk show, who do you invite as your first guest?"


//let testBackgroundImage: UIImageView = {
//    let imageView = UIImageView()
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.contentMode = .scaleAspectFill
//    imageView.image = UIImage(named: "BackgroundForScreenshot")
//    return imageView
//}()

//constraints.append(testBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor))
//constraints.append(testBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor))
//constraints.append(testBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor))
//constraints.append(testBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor))

//        view.addSubview(testBackgroundImage)

//func configureUIForSpecificDevice(_ imageView: UIImageView) {
//    let deviceType = UIDevice.current.deviceType
//    
//    switch deviceType {
//    case .iPhones_5_5s_5c_SE:
//        imageView.image = UIImage(named: K.AssetsNames.haveFunImage)
//    case .iPhones_6_6s_7_8:
//        imageView.image = UIImage(named: K.AssetsNames.haveFunImage)
//    case .iPhones_6Plus_6sPlus_7Plus_8Plus:
//        imageView.image = UIImage(named: K.AssetsNames.askQuestionsImage)
//    case .iPhoneX:
//        imageView.image = UIImage(named: K.AssetsNames.askQuestionsImage)
//    default:
//        imageView.image = UIImage(named: K.AssetsNames.askQuestionsImage)
//    }
//}
