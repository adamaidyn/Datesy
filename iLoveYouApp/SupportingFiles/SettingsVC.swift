//
//  SettingsVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 11/16/21.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Properties and objects
    private let sectionsArray = ["Policies", "Purchases"]
    private let miscInfo = ["Terms of service", "Privacy policy"]
    private let restorePurchase = ["Restore purchases"]
    
    var tableView = UIElements().settingsTableView
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.settingConsts.settingsCellName)
        
        tableView.frame = view.bounds
    
        configureNavBar()
    }
    
    func configureNavBar() {
        
        title = K.settingConsts.navigationTitle
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(dismissSelf)
        )
        navigationItem.leftBarButtonItem?.tintColor = .systemPink
    }
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extension
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsArray[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return miscInfo.count
        case 1:
            return restorePurchase.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return nil
        default:
            return K.invalidTextMessage
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.settingConsts.settingsCellName, for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = miscInfo[indexPath.row]
        case 1:
            cell.textLabel?.text = restorePurchase[indexPath.row]
        default:
            cell.textLabel?.text = K.invalidSectionMessage
        }
        return cell
    }
    
    // MARK: - Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                guard let url = URL(string: "https://stackoverflow.com") else { return }
                UIApplication.shared.open(url)
            case 1:
                guard let url = URL(string: "https://apple.com") else { return }
                UIApplication.shared.open(url)
            default:
                print("Nothing happened")
            }
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                print("Restore purchase is pressed")
            default:
                print("Nothing happened")
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
