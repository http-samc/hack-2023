//
//  FilterView.swift
//  A4
//
//  Created by Ryan Park on 11/12/23.
//

import Foundation
import UIKit

class FilterView: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let category = UIButton()
    
    static let reuse = "FilerViewReuse"
    
    // MARK: - Properties (data)
    private var difficulty: String = ""
    private var only_Active: Bool = false
    private var tracker: Int = 0
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.a4.white
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    
    func configure(filter: String ) {
        difficulty = filter
        setupCategory()
    }
    
    // MARK: - Set Up Views
    private func setupCategory() {
        category.setTitle(difficulty, for: .normal)
        
        if (only_Active) {
            category.setTitleColor(UIColor.a4.white, for: .normal)
            category.backgroundColor = UIColor.a4.yellowOrange
        }
        else {
            category.setTitleColor(UIColor.a4.black, for: .normal)
            category.backgroundColor = UIColor.a4.offWhite
        }
        category.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold).rounded
        category.addTarget(self, action: #selector(filterButtonClicked), for: .touchUpInside)
        category.layer.cornerRadius = 15
        
        
        contentView.addSubview(category)
        category.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            category.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            category.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            category.topAnchor.constraint(equalTo: contentView.topAnchor),
            category.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        

    }
    // MARK: - Button Helpers
    @objc private func filterButtonClicked() {
        if only_Active {
            only_Active = false
            setupCategory()
        }
        else {
            only_Active = true
            setupCategory()
        }
    
    }

}
