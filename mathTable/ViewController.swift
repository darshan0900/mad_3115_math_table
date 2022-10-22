//
//  ViewController.swift
//  mathTable
//
//  Created by Darshan Jain on 2022-10-21.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var insertLabel: UILabel!
	
	@IBOutlet weak var userInput: UITextField!
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.onInsertPress))
		insertLabel.isUserInteractionEnabled = true
		insertLabel.addGestureRecognizer(tap)
	}
	
	@IBAction func onInsertPress(sender: UITapGestureRecognizer) {
		if(isValid()){
			tableView.reloadData()
		}else{
			let alert = UIAlertController(title: "Oops", message: isEmpty() ? "Please enter a number" : "Please enter a valid Number", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Try Again", style: .destructive))
			present(alert, animated: true)
		}
	}
	
	func isEmpty() -> Bool {
		return userInput.text!.isEmpty
	}
	
	func isValid() -> Bool {
		return Int(userInput.text!) != nil
	}

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if(isEmpty()) {
			return 0
		} else if (!isValid()){
			return 1
		}else{
			return 20
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		var content = cell.defaultContentConfiguration()
		if(isEmpty() || !isValid() ){
			tableView.separatorStyle = .none
			content.text = isEmpty() ? "Enter a number" : "Invalid number"
		}else{
			let number = Int(userInput.text!) ?? 0
			let multiple = indexPath.row + 1
			let value = number * multiple
			content.text="\(number) x \(multiple) = \(value)"
		}
		cell.contentConfiguration = content
		return cell
	}
	
	
}

