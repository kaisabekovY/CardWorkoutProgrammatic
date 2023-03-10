//
//  ViewController.swift
//  CardWorkoutProgrammatic
//
//  Created by Yeldar Kaisabekov on 10.03.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var timer = Timer()
    
    let cards : [UIImage] = Cards.allValues
    
    let cardImage = UIImageView()
    
    let stopButton = UIButton()
    
    @objc let restartButton = UIButton()
    
    let rulesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        startTimer()
        setupCardImage()
        setupStopButton()
        setupRestartButton()
        setupRulesButton()
        

        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func setupCardImage(){
        view.addSubview(cardImage)
        
        cardImage.image = UIImage.init(named: "10C")
        
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([cardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     cardImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
                                     cardImage.widthAnchor.constraint(equalToConstant: 250),
                                     cardImage.heightAnchor.constraint(equalToConstant: 350)])
        
        
    }
    
    func setupStopButton(){
        view.addSubview(stopButton)
        
        stopButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)

        stopButton.configuration = .gray()
        stopButton.configuration?.baseBackgroundColor = .systemRed
        stopButton.configuration?.baseForegroundColor = .white
        stopButton.configuration?.title = "Stop!"
        stopButton.configuration?.cornerStyle = .medium
        
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stopButton.centerYAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 50),
            stopButton.centerXAnchor.constraint(equalTo: cardImage.centerXAnchor),
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    func setupRestartButton(){
        view.addSubview(restartButton)
        

        restartButton.configuration = .gray()
        restartButton.configuration?.baseBackgroundColor = .systemGreen
        restartButton.configuration?.baseForegroundColor = .white
        restartButton.configuration?.title = "Restart"
        restartButton.configuration?.cornerStyle = .medium
        restartButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)


        restartButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50)

        ])
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
    }
    
    func setupRulesButton(){
        view.addSubview(rulesButton)

        rulesButton.configuration = .gray()
        rulesButton.configuration?.baseBackgroundColor = .systemMint
        rulesButton.configuration?.baseForegroundColor = .white
        rulesButton.configuration?.title = "Rules"
        rulesButton.configuration?.cornerStyle = .medium
        rulesButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        rulesButton.addTarget(self, action: #selector(toRulesVC), for: .touchUpInside)
        
        
    }
    
    @objc func toRulesVC(){
        present(RulesVC(), animated: true)
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImage.image = cards.randomElement() ?? UIImage.init(named: "10C")
    }
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func restartTimer(){
        timer.invalidate()
        startTimer()
    }
    
    
}
