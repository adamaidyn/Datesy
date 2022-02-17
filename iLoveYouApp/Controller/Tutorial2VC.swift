//
//  Tutorial2VC.swift
//  iLoveYouApp
//
//  Credits to jrasmusson on 2021-01-08.
//

import UIKit

class Tutorial2VC: UIPageViewController {
    
    var uiElements = UIElements()
    
    let generator = UIImpactFeedbackGenerator(style: .medium)
    let generators = UINotificationFeedbackGenerator()
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl() // external - not part of underlying pages
    let initialPage = 0
    
    var pageViewController = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = K.Colours.whitePastelColor
        
        configureNavBar()
        
        setup()
        style()
        layout()
        configureUI()
        
        self.uiElements.skipDoneButton.isHidden = true
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
        generator.impactOccurred(intensity: 1)
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func configureUI() {
        uiElements.skipDoneButton.setTitle(K.skipButtonTitle, for: .normal)
        uiElements.skipDoneButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }
    
}

extension Tutorial2VC {
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        // create an array of viewController
        let page1 = ViewController1()
        let page2 = ViewController2()
        let page3 = ViewController3()
        let page4 = ViewController4()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        // set initial viewController to be displayed
        // Note: We are not passing in all the viewControllers here. Only the one to be displayed.
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = K.Colours.pureBlack
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        view.addSubview(pageControl)
        view.addSubview(uiElements.skipDoneButton)
        
        let layout = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            //            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 3),
            uiElements.skipDoneButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            uiElements.skipDoneButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor)
        ])
    }
    
}

// MARK: - Actions
extension Tutorial2VC {
    
    // How we change page when pageControl tapped.
    // Note - Can only skip ahead on page at a time.
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - DataSources
extension Tutorial2VC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            //            return pages.last               // wrap to last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else if currentIndex == 3 {
            DispatchQueue.main.async {
                self.uiElements.skipDoneButton.isHidden = false
                self.uiElements.skipDoneButton.setTitle(K.doneButtonTitle, for: .normal)
                self.uiElements.skipDoneButton.setTitleColor(.black, for: .normal)
            }
        }
        return nil
    }
}

// MARK: - Delegates

extension Tutorial2VC: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

// MARK: - ViewControllers for pages

class ViewController1: UIViewController {
    
    let middleView: UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .systemIndigo
        return view
    }()
    
    var uiElements = UIElements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.Colours.whitePastelColor
        
        autoLayout()
        configureUI()
    }
    
    // MARK: - AutoLayout
    func autoLayout() {
        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        let middleViewLayout = middleView.layoutMarginsGuide
        
        view.addSubview(uiElements.illustImageView)
        view.addSubview(middleView)
        view.addSubview(uiElements.tutorialLabel)
        
        // Illustration ImageView
        constraints.append(uiElements.illustImageView.topAnchor.constraint(equalTo: layout.topAnchor))
        constraints.append(uiElements.illustImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(uiElements.illustImageView.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
        constraints.append(uiElements.illustImageView.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        
        // Invisible View for description label
        constraints.append(middleView.topAnchor.constraint(equalTo: uiElements.illustImageView.bottomAnchor))
        constraints.append(middleView.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -25))
        constraints.append(middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        // Description Label
        constraints.append(uiElements.tutorialLabel.centerYAnchor.constraint(equalTo: middleView.centerYAnchor))
        constraints.append(uiElements.tutorialLabel.centerXAnchor.constraint(equalTo: middleView.centerXAnchor))
        constraints.append(uiElements.tutorialLabel.leadingAnchor.constraint(equalTo: middleViewLayout.leadingAnchor))
        constraints.append(uiElements.tutorialLabel.trailingAnchor.constraint(equalTo: middleViewLayout.trailingAnchor))
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureUI() {
        uiElements.illustImageView.image = UIImage(named: K.AssetsNames.loveAppImage)
        uiElements.tutorialLabel.text = K.tutorialWelcomeMessage
    }
}
class ViewController2: ViewController1 {
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
    }
    override func configureUI() {
        uiElements.illustImageView.image = UIImage(named: K.AssetsNames.getFriedImage)
        uiElements.tutorialLabel.text = K.getYourPartnerMessage
    }
}
class ViewController3: ViewController1 {
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
        configureUI()
    }
    override func configureUI() {
        uiElements.illustImageView.image = UIImage(named: K.AssetsNames.chooseCategoryImage)
        uiElements.tutorialLabel.text = K.chooseCatMessage
    }
}
class ViewController4: ViewController1 {
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
        configureUI()
    }
    override func configureUI() {
        uiElements.illustImageView.image = UIImage(named: K.AssetsNames.haveFun2Image)
        uiElements.tutorialLabel.text = K.directionsMessage
    }
}
