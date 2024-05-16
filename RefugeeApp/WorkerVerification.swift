import UIKit
import Firebase

class WorkerVerfication: UIViewController {
    
    //MARK: Button and Textfield
    
    let topImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let uniqueNumber: UITextField = {
    let number = UITextField()
        number.placeholder = "Enter Unique Number"
        number.borderStyle = UITextBorderStyle.roundedRect
        number.translatesAutoresizingMaskIntoConstraints = false
        number.borderStyle = UITextBorderStyle.roundedRect
        return number
    }()
    
    let verifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Verify", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(verifyAction), for: .touchUpInside)

        return button
    }()
    
    @objc func verifyAction(){
        Database.database().reference().child("users").queryOrdered(byChild: "uniqueNumber").queryEqual(toValue: Int(uniqueNumber.text!)).observeSingleEvent(of: .value) { (snapshot) in
            if (!snapshot.exists()){
                let alert = UIAlertController(title: "Alert", message: "No refugee found for this number.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                let register = RegisterController()
                register.employeeVerification = true
                self.navigationController?.pushViewController(register, animated: true)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(uniqueNumber)
        view.addSubview(verifyButton)
        view.addSubview(topImage)
        setupImage()
        setupTextField()
        setupVerifyButton()
    }
    
    //MARK: Constraints

    func setupImage() {
        
        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        topImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupTextField() {
        uniqueNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        uniqueNumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        uniqueNumber.heightAnchor.constraint(equalToConstant: 55).isActive = true
        uniqueNumber.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 125).isActive = true
    }
    
    func setupVerifyButton() {
        verifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        verifyButton.topAnchor.constraint(equalTo: uniqueNumber.bottomAnchor, constant: 110).isActive = true
        verifyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        verifyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        verifyButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        verifyButton.layer.cornerRadius = 10
    }
    
//    func createAlert(titleText: String, messageText: String) {
//        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (ACTION) in alert.dismiss(animated: true, completion: nil)}))
//    }
    
//    if "Wrong or Verified" {
//    let alert = UIAlertController(title: "Alert", message: "This pin does not need any verification", preferredStyle: .alert)
//        }
//    else {
//    let goodAlert = UIAlertController(title: "Success!", message: "This pin has been verified and updated with the later info.", preferredStyle: .alert)
//}
    
    //If Successful, it brings you back to the HomeController
    
    
    

}
