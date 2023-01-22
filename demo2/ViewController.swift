//
//  ViewController.swift
//  demo2
//
//  Created by STC on 22/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pincodetextfield: UITextField!
    var tableview = UITableView()
    var array = [12222,22222,22622,23422,233332,3333]
    override func viewDidLoad() {
        super.viewDidLoad()
        pincodetextfield.delegate = self
    }


}
extension ViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == pincodetextfield{
          tableviewsetup()
            tableview.delegate = self
            tableview.dataSource = self
            tableview.tag = 18
            tableview.rowHeight = 80
            view.addSubview(tableview)
            tableviewanimated(load: true)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == pincodetextfield{
            view.endEditing(true)
        }
        return true
    }
    func tableviewsetup()
    {
        tableview.frame = CGRect(x: 20, y: view.frame.height, width: view.frame.width - 40, height: view.frame.height - 170)
        tableview.layer.shadowColor = UIColor.blue.cgColor
        tableview.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        tableview.layer.shadowOpacity = 1.0
        tableview.layer.cornerRadius = 10
        tableview.layer.shadowRadius = 2
        tableview.layer.masksToBounds = true
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "selectedpincode")
    }
    func tableviewanimated(load : Bool){
        if load{
            UIView.animate(withDuration: 0.2){
                self.tableview.frame = CGRect(x: 20, y: 170, width: self.view.frame.width - 40, height: self.view.frame.height - 170)
            }
        }
            else
            {
                UIView.animate(withDuration: 0.2, animations: {
                    self.tableview.frame = CGRect(x: 20, y: self.view.frame.height, width: self.view.frame.width - 40, height: self.view.frame.height - 170)
                }){(done) in
                    for subvew in self.view.subviews{
                        if subvew.tag == 18{
                            subvew.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "selectedpincode")
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableviewanimated(load: false)
        pincodetextfield.text = String(array[indexPath.row])
        
    }
    
}
