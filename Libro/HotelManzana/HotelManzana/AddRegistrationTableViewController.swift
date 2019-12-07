//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Sofìa Gutièrrez on 11/20/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTAbleViewControllerDelegate {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    //variable para el tipo de cuarto seleccionado en la otra tabla
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    //VARIABLES PARA DESPLEGAR O NO LOS DATE PICKERS
    let checkInDatePickerCellIndexpath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexpath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false{
        didSet{
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false{
        didSet{
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    //propiedad para guaradar la habitacion seleccionada
    var roomType: RoomType?
    
    //variable computada para guardar el registro de un cliente
    var registration: Registration? {
          
        guard let roomType = roomType else { return nil }
          
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        return Registration(firstName: firstName,
                               lastName: lastName,
                               emailAdress: email,
                               checkInDate: checkInDate,
                               checkOutDate: checkOutDate,
                               numberOfAdults: numberOfAdults,
                               numberOfChildren: numberOfChildren,
                               roomType: roomType,
                               wifi: hasWifi)
    }
    
/*    var registration = Registration?{
        
        guard let roomType = roomType else { return nil }
        
            let firstName = firstNameTextField.text ?? ""
            let lastName = lastNameTextField.text ?? ""
            let email = emailTextField.text ?? ""
            let checkInDate = checkInDatePicker.date
            let checkOutDate = checkOutDatePicker.date
            let numberOfAdults = Int(numberOfAdultsStepper.value)
            let numberOfChildren = Int(numberOfChildrenStepper.value)
            let hasWifi = wifiSwitch.isOn
            
            return Registration(firstName: firstName, lastName: lastName, emailAdress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
        
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkOutDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func doneBarButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        let roomChoice = roomType?.name ?? "Not set"
        
        print("Done tapped")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("email: \(email)")
        print("Check In Date: \(checkInDate)")
        print("Check Out Date: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("WIFi: \(hasWifi)")
        print("RoomType: \(roomChoice)")
    }
    
    
    func updateDateViews(){
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker){
        updateDateViews()
    }
    
    //FUNCION PARA VER SI SE DESPLIEGA EL DATE PICKER
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexpath.section, checkInDatePickerCellIndexpath.row):
            if isCheckInDatePickerShown{
                return 216.0
            } else {
                return 0.0
            }
        case (checkOutDatePickerCellIndexpath.section, checkOutDatePickerCellIndexpath.row):
            if isCheckOutDatePickerShown{
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexpath.section, checkInDatePickerCellIndexpath.row - 1 ):
            if isCheckInDatePickerShown{
                isCheckInDatePickerShown = false
            }else if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }else{
                isCheckInDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        case (checkOutDatePickerCellIndexpath.section, checkOutDatePickerCellIndexpath.row - 1 ):
            if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
            }else if isCheckInDatePickerShown{
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }else {
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    
    func updateNumberOfGuests(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
    }
    
    //funcion para actualizar la etiqueta del tipo de cuarto escogido
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        }else{
            roomTypeLabel.text = "Not set"
        }
    }
 
    //funcion para conformar el protocolo de delegado
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

 /*   override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
 */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType"{
            let destinationViewController = segue.destination as? SelectedRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
        

        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
