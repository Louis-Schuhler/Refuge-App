import UIKit
import Firebase
import FirebaseAuth

class RegisterController: UIViewController, UITextFieldDelegate {
    
    let datePicker = UIDatePicker()
    var position:CGFloat = 50
    var isEmployee = false
    var switchEmployee:UISwitch!
    var user:User!
    var employeeVerification = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        view.backgroundColor = UIColor.white//Setting the background color for the view
        self.view.addSubview(scrollView)
        
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        let titleRegistration = UILabel(frame: CGRect(x: 0, y: 0, width: screen.width, height: 100))
        titleRegistration.textAlignment = .center
        titleRegistration.text = "Registration"
        titleRegistration.font = UIFont(name: titleRegistration.font.fontName, size: 40)
        
        scrollView.addSubview(titleRegistration)
        position += 60
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.genderTextField.delegate = self
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.ageTextField.delegate = self
        self.countryOfOriginTextField.delegate = self
        self.professionTextField.delegate = self
        
        
        if (user == nil && !employeeVerification){
            placeView(view: emailTextField)
            placeView(view: passwordTextField)
        }
        placeView(view: genderTextField)
        placeView(view: firstNameTextField)
        placeView(view: lastNameTextField)
        placeView(view: ageTextField)
        placeView(view: countryOfOriginTextField)
        placeView(view: professionTextField)
        
        let viewx = UIView(frame: CGRect(x: 0, y: position, width: 200, height: 40))
        let labelEmployee = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        labelEmployee.text = "Helper?"
        viewx.addSubview(labelEmployee)
        switchEmployee = UISwitch(frame: CGRect(x: 120, y: 0, width: 40, height: 40))
        viewx.addSubview(switchEmployee)
        viewx.center = CGPoint(x: screen.width/2, y: position)
        position += 60
        scrollView.addSubview(viewx)
        
        loginRegisterButton.frame = CGRect(x: 0, y: 0, width: 300, height: 55)
        loginRegisterButton.center = CGPoint(x: screen.width/2, y: position)
        scrollView.addSubview(loginRegisterButton)
        
       // createDatePicker()
        createDatePicker2 ()
        
        if (employeeVerification){
            fillAllTextViews2()
            return
        }
        
        if (user != nil){
            fillInAllTextViews()
        }
        

    }
    
    func placeView(view:UIView){
        let screen = UIScreen.main.bounds
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        view.center = CGPoint(x: screen.width/2, y: position)
        scrollView.addSubview(view)
        position += 60
        
    }
    
    func fillInAllTextViews(){
        emailTextField.text = user.email
        genderTextField.text = user.gender
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        ageTextField.text = user.dateOfBirth
        countryOfOriginTextField.text = user.countryOfOrigin
        professionTextField.text = user.profession
    }
    
    func fillAllTextViews2(){
        emailTextField.text = "Bob@bob.com"
        passwordTextField.text = "dsadss"
        genderTextField.text = "Andres"
        firstNameTextField.text = "Dead"
        lastNameTextField.text = "Sad"
        ageTextField.text = "November 26, 2017"
        countryOfOriginTextField.text = "Das"
        professionTextField.text = "Sad"
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 2000)
//    }
    
    let scrollView: UIScrollView = {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        var scrollView: UIScrollView!
        
        let v = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        v.contentSize = CGSize(width: screenWidth, height: 900)
        v.isScrollEnabled = true
        v.contentInsetAdjustmentBehavior = .never
        //v.translatesAutoresizingMaskIntoConstraints = false
        //v.backgroundColor = UIColor.white
        return v
    }()
    
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let genderTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Gender"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First Name"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last Name"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Date Of Birth"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let countryOfOriginTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Country of Origin"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let professionTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Profession"
        tf.borderStyle = UITextBorderStyle.roundedRect
        //tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Register", for: .normal)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    
    func createDatePicker (){
        // format for picker
        datePicker.datePickerMode = .date
        datePicker.backgroundColor =  UIColor(r: 41, g: 199, b: 150)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor(r: 41, g: 199, b: 150)
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        genderTextField.inputAccessoryView = toolbar
        
        genderTextField.inputView = datePicker
    }
    
    func createDatePicker2 (){
        // format for picker
        datePicker.datePickerMode = .date
        datePicker.backgroundColor =  UIColor(r: 41, g: 199, b: 150)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor(r: 41, g: 199, b: 150)
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar.setItems([doneButton], animated: false)
        
        ageTextField.inputAccessoryView = toolbar
        
        ageTextField.inputView = datePicker
    }
    
    @objc func donePressed (){

        self.view.endEditing(true)
    }
    
   @objc func donePressed2 (){
        
        // format date
        let userDateFormatter = DateFormatter()
        userDateFormatter.dateStyle = .long
        userDateFormatter.timeStyle = .none
        
        ageTextField.text = userDateFormatter.string(from: datePicker.date)

        self.view.endEditing(true)
        
    }
    
    
    func setupEmailTextField(){

        // need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
    }
    
    func setupPasswordTextField(){

        // need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25).isActive = true
    }
    
    func setupGenderTextField(){
        

        // need x, y, width, height constraints
        genderTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        genderTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        genderTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100).isActive = true
        
    }
    
    func setupFirstNameTextField(){
    
        // need x, y, width, height constraints
        firstNameTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        firstNameTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        firstNameTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 100).isActive = true
    }

    func setupLastNameTextField(){
        
        // need x, y, width, height constraints
        lastNameTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        lastNameTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 100).isActive = true
    }
        
    func setupAgeNameTextField(){

        // need x, y, width, height constraints
        ageTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        ageTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        ageTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 25).isActive = true
    }
    
    func setupCountryOfOriginTextField(){
        
        // need x, y, width, height constraints
        countryOfOriginTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        countryOfOriginTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        countryOfOriginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        countryOfOriginTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 25).isActive = true
    }
        
    func setupProfessionTextField(){
        // need x, y, width, height constraints
        professionTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        professionTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
        professionTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        professionTextField.topAnchor.constraint(equalTo: countryOfOriginTextField.bottomAnchor, constant: 25).isActive = true
    }
    
    func setupRegisterButton(){
        
        // need x, y, width, height constraints
        loginRegisterButton.topAnchor.constraint(equalTo: professionTextField.bottomAnchor, constant: 25).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginRegisterButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50).isActive = true
        loginRegisterButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50).isActive = true
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
   @objc  func handleLoginRegister(){

    let email = emailTextField.text!
    let password = passwordTextField.text!
    let gender = genderTextField.text!
    let firstName = firstNameTextField.text!
    let lastName = lastNameTextField.text!
    let dateOfBirth = ageTextField.text!
    let countryOfOrigin = countryOfOriginTextField.text!
    let profession = professionTextField.text!
    
    if (email == "" || password == "" || gender == "" || firstName == "" || lastName == "" || dateOfBirth == "" || countryOfOrigin == "" || profession == ""){
        let alert = UIAlertController(title: "Missing fields", message: "Please fill in missing registration fields.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return;
    }
    
    if (password.count < 6){
        let alert = UIAlertController(title: "Password too short", message: "The password must be 6 characters long or more", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return;
    }
    
    if(isValidEmail(testStr: email) == false){
        let alert = UIAlertController(title: "Email invalid", message: "Please enter a valid email address", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return;
    }
    
    if (employeeVerification){
        let alert = UIAlertController(title: "Success!", message: "Refugee information updated and verified!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return
    }
    
    if (user == nil){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if (error != nil || user?.uid == nil){
                print("cannot register")
                print(error)
                return
            }
            
            let verify = self.isEmployee
            let employee = self.switchEmployee.isOn
            let uniqueNumber:Int = Int(arc4random_uniform(899999)+100000)
            let dictionary = ["email":email, "gender":gender, "firstName":firstName, "lastName":lastName, "dateOfBirth":dateOfBirth, "countryOfOrigin":countryOfOrigin, "profession":profession, "employee":employee, "verify":verify, "uniqueNumber":uniqueNumber] as [String : Any]
            
            Database.database().reference().child("users").child((user?.uid)!).setValue(dictionary)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.userGlobal = User(user: user!, dictionary: dictionary)
            
            if (verify){
                let alert = UIAlertController(title: "Success!", message: "The refugee's data has been saved!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (alert) in
                    self.navigationController?.pushViewController(HomeController(), animated: true)
                }))
            } else {
                self.navigationController?.pushViewController(VerifyController(), animated: true)
            }
        }
    }
    
    }

    //MARK: Hide Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    

}
