//
//  SessionCollectionViewCell.swift
//  A4
//
//  Created by Samarth Chitgopekar on 12/1/23.
//

import Foundation
import UIKit
import SDWebImage

class SessionCollectionViewCell : UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let title_ = UILabel()
    private let population = UILabel()
    private let class_ = UILabel()
    private let date = UILabel()
    private let location = UILabel()
    private let classImage = UIImageView()
    private let dateImage = UIImageView()
    private let locationImage = UIImageView()

    static let reuse = "SessionCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.a4.gray
        contentView.layer.cornerRadius = 8
        
        setupTitle()
        setupPopulation()
        setupClass()
        setupDate()
        setupLocation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    
    func configure(sesh: Sesh) {
        title_.text = sesh.title
        population.text = String(sesh.population) + " going"
        class_.text = sesh.course
        date.text = "\(SessionCollectionViewCell.formatDateString(sesh.startTime)!) (\(SessionCollectionViewCell.getDuration(dateString1: sesh.startTime, dateString2: sesh.endTime)!))"
        location.text = sesh.location
        
    }
    
    // MARK: - Set Up Views
    
    private func setupTitle() {
        contentView.addSubview(title_)
        
        title_.translatesAutoresizingMaskIntoConstraints = false
        title_.textColor = UIColor.a4.white
        title_.font = .monospacedSystemFont(ofSize: 22, weight: .semibold)
        
        NSLayoutConstraint.activate([
            title_.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            title_.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        ])

    }
    
    private func setupPopulation() {
        contentView.addSubview(population)
        
        population.translatesAutoresizingMaskIntoConstraints = false
        population.textColor = UIColor.a4.white
        population.font = .monospacedDigitSystemFont(ofSize: 18, weight: .regular)
        
        NSLayoutConstraint.activate([
            population.centerYAnchor.constraint(equalTo: title_.centerYAnchor),
            population.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

    }
    
    private func setupClass() {
        classImage.image = UIImage(named: "Class")
        
        class_.textColor = UIColor.a4.white
        class_.font = .systemFont(ofSize: 16)
        
        classImage.translatesAutoresizingMaskIntoConstraints = false
        class_.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(classImage)
        contentView.addSubview(class_)
        
        NSLayoutConstraint.activate([
            classImage.topAnchor.constraint(equalTo: title_.bottomAnchor, constant: 20),
            classImage.leftAnchor.constraint(equalTo: title_.leftAnchor),
            class_.leftAnchor.constraint(equalTo: classImage.rightAnchor, constant: 12),
            class_.centerYAnchor.constraint(equalTo: classImage.centerYAnchor)
        ])
        
    }
    
    private func setupDate() {
        dateImage.image = UIImage(named: "Calendar")
        
        date.textColor = UIColor.a4.white
        date.font = .systemFont(ofSize: 16)
        
        dateImage.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(dateImage)
        contentView.addSubview(date)
        
        NSLayoutConstraint.activate([
            dateImage.topAnchor.constraint(equalTo: classImage.bottomAnchor, constant: 16),
            dateImage.leftAnchor.constraint(equalTo: classImage.leftAnchor),
            date.leftAnchor.constraint(equalTo: dateImage.rightAnchor, constant: 16),
            date.centerYAnchor.constraint(equalTo: dateImage.centerYAnchor)
        ])
    }
    
    private func setupLocation() {
        locationImage.image = UIImage(named: "Location")
        
        location.textColor = UIColor.a4.white
        location.font = .systemFont(ofSize: 16)
        
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        location.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(locationImage)
        contentView.addSubview(location)
        
        NSLayoutConstraint.activate([
            locationImage.topAnchor.constraint(equalTo: dateImage.bottomAnchor, constant: 16),
            locationImage.leftAnchor.constraint(equalTo: dateImage.leftAnchor),
            location.leftAnchor.constraint(equalTo: locationImage.rightAnchor, constant: 16),
            location.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor)
        ])
    }
    
    // MARK: - Helpers
    static func formatDateString(_ dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM"

        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    static func getDuration(dateString1: String, dateString2: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let date1 = formatter.date(from: dateString1),
              let date2 = formatter.date(from: dateString2) else {
            return nil
        }

        let timeInterval = date2.timeIntervalSince(date1)
        let hours = Int(timeInterval) / 3600
        let minutes = Int(timeInterval) % 3600 / 60

        return String(format: "%d:%02d", abs(hours), abs(minutes))
    }
    
}

    
