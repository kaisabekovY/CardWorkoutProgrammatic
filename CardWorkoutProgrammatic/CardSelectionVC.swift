//
//  ViewController.swift
//  CardWorkoutProgrammatic
//
//  Created by Yeldar Kaisabekov on 10.03.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var timer = Timer()
    
    var countDown = Timer()
    var count = 11
    

    let cards : [UIImage] = Cards.allValues
    
    let cardImage = UIImageView()
    
    let stopButton      = CWButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let restartButton   = CWButton(color: .systemGreen, title: "Restart", systemImageName: "arrow.clockwise.circle")
    let rulesButton     = CWButton(color: .systemMint, title: "Rules", systemImageName: "list.bullet")
    let timerTest = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        startTimer()
        startCountDownTimer()
        configureUI()

        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
        countDown.invalidate()
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
    func configureUI(){
        setupCountDown()
        setupCardImage()
        setupStopButton()
        setupRestartButton()
        setupRulesButton()
        
        
    }
    
    func setupCountDown() {
        view.addSubview(timerTest)
        
        timerTest.textAlignment = .center
        timerTest.font = .systemFont(ofSize: 20, weight: .bold)
        
        timerTest.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerTest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerTest.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30 ),
            timerTest.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupStopButton(){
        view.addSubview(stopButton)
        
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
    
    func startCountDownTimer(){
        countDown = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(timerLogic), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImage.image = cards.randomElement() ?? UIImage.init(named: "10C")
    }
    
    @objc func stopTimer(){
        count = 11
        timer.invalidate()
        countDown.invalidate()
    }
    
    @objc func restartTimer(){
        countDown.invalidate()
        timer.invalidate()
        startTimer()
        startCountDownTimer()
    }
    
    @objc func timerLogic(){
        count -= 1
        
        timerTest.text = "\(count)"
        
        if count <= 3{
            timerTest.textColor = .systemRed
        }else {
            timerTest.textColor = .black
        }
        
        if count == 0{
            timerTest.text = "DO IT!"
            stopTimer()
        }
    }
    
    
}
