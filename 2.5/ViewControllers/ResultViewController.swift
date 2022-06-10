//
//  ResultViewController.swift
//  2.5
//
//  Created by Александр on 07.06.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResultUI()
    }
    
    private func updateResultUI() {
        var dictionaryOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
//        var animals: [Animal] = []
//        for answer in answers {
//            animals.append(answer.animal)
//        }
        for animal in animals {
            if let animalTypeCount = dictionaryOfAnimals[animal] {
                dictionaryOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                dictionaryOfAnimals[animal] = 0
            }
        }
        
        guard let maxCountAnimal = dictionaryOfAnimals.sorted(by: { $0.value > $1.value }).first?.key else { return }
        updateUI(with: maxCountAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        animalLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.description ?? ""
    }
}
