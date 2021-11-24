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
