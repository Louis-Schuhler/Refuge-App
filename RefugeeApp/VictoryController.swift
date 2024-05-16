import UIKit

class VictoryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(codeMessage)
        view.addSubview(identifierMessage)
        view.addSubview(awaitingValidation)
        //view.addSubview(validated)
        view.addSubview(imageLoading)
        //view.addSubview(imageValidated)
        
        setupCodeMessage()
        setupIdentifierMessage()
        setupAwaitingValidation()
        //setupValidated()
        setupImageLoading()
        //setupImageValidated()
    }
    
    let codeMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your unique identifier is"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        
        return label
    }()

    
    let identifierMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        label.text = String(appDelegate.userGlobal.uniqueNumber)
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    
    func setupCodeMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        codeMessage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        codeMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        codeMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        codeMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
   
    func setupIdentifierMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        identifierMessage.topAnchor.constraint(equalTo: codeMessage.bottomAnchor, constant: 20).isActive = true
        identifierMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        identifierMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        identifierMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
        let awaitingValidation: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Awaiting validation..."
            label.numberOfLines = 0;
            label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.textColor = UIColor(r: 41, g: 199, b: 150)
            label.textAlignment = .center

            return label
        }()

        func setupAwaitingValidation(){
            // need x, y, width, height constraints
            //registerMessage.translatesAutoresizingMaskIntoConstraints = false
            awaitingValidation.topAnchor.constraint(equalTo: identifierMessage.bottomAnchor, constant: 120).isActive = true
            awaitingValidation.heightAnchor.constraint(equalToConstant: 25).isActive = true
            awaitingValidation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
            awaitingValidation.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        }

        lazy var imageLoading: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Loading")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill

            //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))

            return imageView
        }()

        func setupImageLoading(){
            // need x, y, width, height constraints
            imageLoading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageLoading.bottomAnchor.constraint(equalTo: awaitingValidation.bottomAnchor, constant: 200).isActive = true
            imageLoading.widthAnchor.constraint(equalToConstant: 150).isActive = true
            imageLoading.heightAnchor.constraint(equalToConstant: 150).isActive = true

        }
    
//        let validated: UILabel = {
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "Validated!"
//            label.numberOfLines = 0;
//            label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
//            label.font = UIFont.boldSystemFont(ofSize: 25)
//            label.textColor = UIColor(r: 41, g: 199, b: 150)
//            label.textAlignment = .center
//
//            return label
//        }()
//
//        func setupValidated(){
//            // need x, y, width, height constraints
//            //registerMessage.translatesAutoresizingMaskIntoConstraints = false
//            validated.topAnchor.constraint(equalTo: identifierMessage.bottomAnchor, constant: 120).isActive = true
//            validated.heightAnchor.constraint(equalToConstant: 40).isActive = true
//            validated.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
//            validated.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
//        }
//
//        lazy var imageValidated: UIImageView = {
//            let imageView = UIImageView()
//            imageView.image = UIImage(named: "Validated")
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFill
//
//            //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))
//
//            return imageView
//        }()
//
//        func setupImageValidated(){
//            // need x, y, width, height constraints
//            imageValidated.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            imageValidated.bottomAnchor.constraint(equalTo: validated.bottomAnchor, constant: 200).isActive = true
//            imageValidated.widthAnchor.constraint(equalToConstant: 150).isActive = true
//            imageValidated.heightAnchor.constraint(equalToConstant: 150).isActive = true
//
//        }
   
}
