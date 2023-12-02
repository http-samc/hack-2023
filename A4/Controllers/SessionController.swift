//
//  RecipeController.swift
//  A4
//
//  Created by Ryan Park on 11/12/23.
//

import Foundation
import UIKit
import SDWebImage

class SessionController: UIViewController {
    
    // MARK: - Properties (view)
    private let titleLabel = UILabel()
    private let whenHeading = UILabel()
    private let whenVal = UILabel()
    private let whatHeading = UILabel()
    private let whatVal = UILabel()
    private let whereHeading = UILabel()
    private let whereVal = UILabel()
    private let whoHeading = UILabel()
    private let whoVal = UILabel()
    private let joinBtn = UIButton()

    // MARK: - Properties (data)
    private var title_: String
    private var date: String
    private var duration: String
    private var desc: String
    private var location: String
    private var class_: String
    private var users: [User]
    
    
    
    // MARK: - viewDidLoad and init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.a4.black
        
        setupTitle()
        setupWhat()
        setupWho()
        setupWhen()
        setupWhere()
        setupJoin()
    }
    
    init (title: String, date: String, duration: String, desc: String, location: String, class_: String, users: [User]) {
        self.title_ = title
        self.date = date
        self.duration = duration
        self.desc = desc
        self.location = location
        self.class_ = class_
        self.users = users
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views
    private func setupTitle() {
        titleLabel.text = title_
        titleLabel.textColor = UIColor.a4.white
        titleLabel.font = .monospacedSystemFont(ofSize: 32, weight: .heavy)

        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }
    
    private func setupWhat() {
        whatHeading.text = "What?"
        whatVal.text = self.desc
        
        whatHeading.font = .monospacedDigitSystemFont(ofSize: 22, weight: .bold)
        whatHeading.textColor = UIColor.a4.white
        
        whatVal.textColor = UIColor.a4.white
        
        whatHeading.translatesAutoresizingMaskIntoConstraints = false
        whatVal.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(whatHeading)
        view.addSubview(whatVal)
        
        NSLayoutConstraint.activate([
            whatHeading.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            whatHeading.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whatVal.topAnchor.constraint(equalTo: whatHeading.bottomAnchor, constant: 12),
            whatVal.leftAnchor.constraint(equalTo: titleLabel.leftAnchor)
        ])
    }
    
    private func setupWho() {
        whoHeading.text = "Who?"
        whoVal.text = self.users.map { $0.email }.joined(separator: ", ")
        whoVal.numberOfLines = 0
        
        whoHeading.font = .monospacedDigitSystemFont(ofSize: 22, weight: .bold)
        whoHeading.textColor = UIColor.a4.white
        
        whoVal.textColor = UIColor.a4.white
        
        whoHeading.translatesAutoresizingMaskIntoConstraints = false
        whoVal.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(whoHeading)
        view.addSubview(whoVal)
        
        NSLayoutConstraint.activate([
            whoHeading.topAnchor.constraint(equalTo: whatVal.bottomAnchor, constant: 20),
            whoHeading.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whoVal.topAnchor.constraint(equalTo: whoHeading.bottomAnchor, constant: 12),
            whoVal.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whoVal.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func setupWhen() {
        whenHeading.text = "When?"
        whenVal.text = "\(self.date) (\(self.duration))"
        
        whenHeading.font = .monospacedDigitSystemFont(ofSize: 22, weight: .bold)
        whenHeading.textColor = UIColor.a4.white
        
        whenVal.textColor = UIColor.a4.white
        
        whenHeading.translatesAutoresizingMaskIntoConstraints = false
        whenVal.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(whenHeading)
        view.addSubview(whenVal)
        
        NSLayoutConstraint.activate([
            whenHeading.topAnchor.constraint(equalTo: whoVal.bottomAnchor, constant: 20),
            whenHeading.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whenVal.topAnchor.constraint(equalTo: whenHeading.bottomAnchor, constant: 12),
            whenVal.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whenVal.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupWhere() {
        whereHeading.text = "Where?"
        whereVal.text = self.location
        
        whereHeading.font = .monospacedDigitSystemFont(ofSize: 22, weight: .bold)
        whereHeading.textColor = UIColor.a4.white
        
        whereVal.textColor = UIColor.a4.white
        
        whereHeading.translatesAutoresizingMaskIntoConstraints = false
        whereVal.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(whereHeading)
        view.addSubview(whereVal)
        
        NSLayoutConstraint.activate([
            whereHeading.topAnchor.constraint(equalTo: whenVal.bottomAnchor, constant: 20),
            whereHeading.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whereVal.topAnchor.constraint(equalTo: whereHeading.bottomAnchor, constant: 12),
            whereVal.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            whereVal.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupJoin() {
        joinBtn.setTitle("Join session", for: .normal)
        joinBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        joinBtn.titleLabel?.textColor = UIColor.a4.white
        joinBtn.backgroundColor = UIColor.a4.green
        joinBtn.layer.cornerRadius = 8
        
        joinBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(joinBtn)
        
        NSLayoutConstraint.activate([
            joinBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0),
            joinBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            joinBtn.heightAnchor.constraint(equalToConstant: 65),
            joinBtn.widthAnchor.constraint(equalToConstant: 172)
        ])
    }

}

