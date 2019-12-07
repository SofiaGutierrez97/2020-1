//
//  NewToDoTableViewController.swift
//  ToDoList
//
//  Created by Sofìa Gutièrrez on 12/4/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class NewToDoTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //DateFormatter para convertir un date en string, instanciado solo una vez para uso de todas las funciones de la clase
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    //variable para saber el estado del picker
    var isPickerHidden: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButtonState()
        
        
        //ponemos el día del picker antes de actualizar el label
        dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        
        updateDueDateLabel(date: dueDatePickerView.date)
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func updateSaveButtonState(){
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    // MARK: - Table view data source

    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    
    @IBAction func returnPressed(_ sender: Any) {
        titleTextField.resignFirstResponder()
    }
    
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = NewToDoTableViewController.dueDateFormatter.string(from: date)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    //funcion para expandir  el datePicker
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch(indexPath){
        case [1, 0]: return isPickerHidden ? normalCellHeight: largeCellHeight
        case [2, 0]: return largeCellHeight
        default: return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [2, 0]:
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    
    
    
    /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

 /*   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
