//
//  SecondScreen.swift
//  CardWorkoutProgrammatic
//
//  Created by Yeldar Kaisabekov on 10.03.2023.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel     = UILabel()
    let rulesLabel     = UILabel()
    let excerciseLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTitleLabel()
        setupRulesLabel()
        setupExcerciseLabel()

    }
    
    func setupTitleLabel(){
        view.addSubview(titleLabel)
        
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60 ),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func setupRulesLabel(){
        view.addSubview(rulesLabel)
        
        rulesLabel.text = "The value of each card represents the number of exercise you do.\n\n  J = 11, Q = 12, K = 13, A = 14"
        rulesLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        
        ])
    }
    
    func setupExcerciseLabel(){
        view.addSubview(excerciseLabel)
        
        excerciseLabel.text = "♤ = Push-up\n\n♡ = Sit-up\n\n♧ = Burpees\n\n♢ = Jumping Jacks"
        excerciseLabel.font = .systemFont(ofSize: 21, weight: .semibold)
        excerciseLabel.textAlignment = .left
        excerciseLabel.lineBreakMode = .byWordWrapping
        excerciseLabel.numberOfLines = 0
        
        excerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            excerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            excerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            excerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 75)
        ])
    }
    


}
