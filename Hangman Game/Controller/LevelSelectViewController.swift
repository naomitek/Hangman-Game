//
//  LevelSelectViewController.swift
//  Hangman Game
//
//  Created by usr on 2025-04-13.
//  Copyright © 2025 Ben Clarke. All rights reserved.
//

import Foundation
import UIKit

class LevelSelectViewController: UIViewController {

    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        // You can customize the appearance of your buttons here
        easyButton.setTitle("Easy", for: .normal)
        normalButton.setTitle("Normal", for: .normal)
        hardButton.setTitle("Hard", for: .normal)

        // Example styling (customize as needed)
        let buttons = [easyButton, normalButton, hardButton]
        for button in buttons {
            button?.backgroundColor = UIColor.systemBlue
            button?.setTitleColor(.white, for: .normal)
            button?.layer.cornerRadius = 10
            button?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            // Add more styling as desired
        }

        // You can also set a background image or color for the view
        view.backgroundColor = UIColor.systemGray6
        // If you have a background image view, configure it here as well
    }

    @IBAction func easyButtonTapped(_ sender: UIButton) {
        startGame(difficulty: "Easy")
    }

    @IBAction func normalButtonTapped(_ sender: UIButton) {
        startGame(difficulty: "Normal")
    }

    @IBAction func hardButtonTapped(_ sender: UIButton) {
        startGame(difficulty: "Hard")
    }

    func startGame(difficulty: String) {
        performSegue(withIdentifier: K.gameSeugue, sender: difficulty)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.gameSeugue, let gameVC = segue.destination as? GameViewController, let difficulty = sender as? String {
            gameVC.selectedDifficulty = difficulty
            gameVC.currentLevel = 1
            gameVC.wordsGuessedInCurrentLevel = 0
            gameVC.totalWordsPerLevel = self.totalWordsForDifficulty(difficulty: difficulty)
        }
    }

    func totalWordsForDifficulty(difficulty: String) -> Int {
        switch difficulty {
        case "Easy": return 3
        case "Normal": return 5
        case "Hard": return 7
        default: return 5
        }
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

   
}
