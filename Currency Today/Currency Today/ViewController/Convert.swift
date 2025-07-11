//
//  Convert.swift
//  Currency Today
//
//  Created by Student on 02.07.25.
//

import UIKit

class ConvertOption {
    var name: String
    var BgI: UIImage
    var BgC: UIColor
    var api: String
    
    init(name: String, BgI: UIImage, BgC: UIColor, api: String) {
        self.name = name
        self.BgI = BgI
        self.BgC = BgC
        self.api = api
    }
}

class Convert: UIViewController {
    
    var models = [ConvertOption]()
    @IBOutlet weak var ConvertViewTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ConvertViewTable.delegate = self
        ConvertViewTable.dataSource = self
        ConvertViewTable.register(ConvertViewCell.self, forCellReuseIdentifier: ConvertViewCell.id)
        configure()
    }
    
    func configure(){
        models.append(contentsOf: [
            ConvertOption(name: "AMD", BgI: UIImage(named: "arm")!, BgC: .cyan, api: "https://open.er-api.com/v6/latest/AMD"),
            ConvertOption(name: "RUB", BgI: UIImage(named: "rus")!, BgC: .cyan, api: "https://open.er-api.com/v6/latest/RUB"),
            ConvertOption(name: "USD", BgI: UIImage(named: "usa")!, BgC: .cyan, api: "https://open.er-api.com/v6/latest/USD"),
            ConvertOption(name: "EUR",  BgI: UIImage(named:"euro")!, BgC: .cyan, api: "https://open.er-api.com/v6/latest/EUR"),
            ConvertOption(name: "BRL",  BgI: UIImage(named:"Brazil")!, BgC: .cyan, api: "https://open.er-api.com/v6/latest/BRL"),
            ConvertOption(name: "CAD",  BgI: UIImage(named:"canada")!, BgC: .cyan, api: "https://open.er-api.com/v6/latest/CAD")
        ])
    }
    

    
    @IBAction func ChangeButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Change") as? Change
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
        
    }
    
   
        @IBAction func SettingsButton(_ sender: Any) {
            
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings") as? Settings
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
            
    }

}

extension Convert: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConvertViewCell.id, for: indexPath) as? ConvertViewCell
        else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ConvertViewTable.deselectRow(at: indexPath, animated: true)
        
        if models[indexPath.item].name != "" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ComvertViewController") as!
            ComvertViewController
            vc.ap = models[indexPath.item].api
            vc.text = models[indexPath.item].name
            self.present(vc, animated: true)
        }
    }
}
