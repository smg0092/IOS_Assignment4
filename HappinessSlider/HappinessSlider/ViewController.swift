//
//  ViewController.swift
//  HappinessSlider
//
//  Created by Selom Gadzey on 6/15/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var InsertDateLabel: UILabel!
    @IBOutlet weak var SaveDateaButton: UIButton!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var MoodDisplay_Label: UILabel!
    @IBOutlet weak var MoodDisplay_Emoji: UILabel!
    
    var dateDictionary: [Date: String] = [:]

    //0–20 → Very Sad 😢
    //21–40 → Sad 🙁
    //41–60 → Neutral 😐
    //61–80 → Happy 🙂
    //81–100 → Very Happy 😄
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DateChosen(DatePicker)
        sliderChanged(Slider)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider)
    {
        let sendval = sender.value
        
        switch sendval {
        case 0..<20:
            MoodDisplay_Label.text = "Very Sad 😢"
        case 21..<40:
            MoodDisplay_Label.text = "Sad 🙁"
        case 41..<60:
            MoodDisplay_Label.text = "Neutral 😐"
        case 61..<80:
            MoodDisplay_Label.text = "Happy 🙂"
        case 81..<100:
            MoodDisplay_Label.text = "Very Happy 😄"
        default:
            break
        }
    }
    
    @IBAction func DateChosen(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateString = formatter.string(from: sender.date)
        InsertDateLabel.text = "Your Mood on \(dateString):"

        
        let curr_date = takeDateFromCalander(from: sender.date)

        if let moodInDict = dateDictionary[curr_date] {
            MoodDisplay_Emoji.text = moodInDict
        } else {
            MoodDisplay_Emoji.text = "No Mood Saved Yet"
        }
    }
    
    @IBAction func saveDateButtonClicked(_ sender: UIButton) {
        let date = takeDateFromCalander(from: DatePicker.date)
        let curr_mood = MoodDisplay_Label.text
        dateDictionary[date] = curr_mood
        MoodDisplay_Emoji.text = curr_mood
    }
    
    func takeDateFromCalander(from date: Date) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return calendar.date(from: components)!
    }

}

