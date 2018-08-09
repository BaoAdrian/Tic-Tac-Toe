# Tic Tac Toe
Tic-Tac-Toe iOS Game developed using Swift 4 and Xcode 9.4.1. Implemented introductory UX operations such as name customizations, allowing choice of which player makes the first move, and keeping score to determine winner of a 'Best-of' series. 
Project made to test various programmatic concepts using Swift such as:

<ul> 
  <li> Passing data between View Controllers </li>
  <li> Custom segues </li>
  <li> UI Placement Tracking </li>
  <li> ... </li>
</ul>
</br>


</br>


<h1>Future Enhancements:</h1>
<ul>
  <li> TBD </li>
</ul>

</br>

<h1>Latest Adjustments:</h1>
<ul>
  <li> TBD </li>
</ul>


</br>


<h1>Notes:</h1>

<h3>Passing Data between View Controllers </h3>

<p> For the purpose of simplification and readablity, the two View Controllers in queston for this section will be named FirstViewController and SecondViewController respectively. </p>

<p>
  For this application, the data that needed to be passed from FirstViewController to SecondViewController originated from user input entered into one or two UITextFields, depending on which game mode the user selected (i.e. name of player one and/or player two).
</p>

<p> 
  The first step was to navigate to Main.storyboard and create an IBOutlet for the UITextFeild(s) within FirstViewController. 
  
```swift
    @IBOutlet weak var playerOneTF: UITextField!
    @IBOutlet weak var playerTwoTF: UITextField! // Optional based on selection (one or two player)
```  

The data the user enters into the following UITextFeild(s) can be accessed using the '.text' property and assigning the value to a variable that will be passed to SecondViewController. In order to complete this process, an action needs to be triggered that will pass the data as well as complete a segue to move to SecondViewController.

</p>

<p>
  We then need to actually create the segue from FirstViewController to SecondViewController. This was acheived by creating a Manual Segue in Main.storyboard from FirstViewController to SecondViewController and set the identifier to 'goToSecondViewController'. 
</p>

<p>
  We then needed an IBAction for a UIButton in FirstViewController named 'startBtn' with the following processes to complete when pressed:  
  
```swift
  // Two-player game setting
  @IBAction func startBtnPressed(_ sender: Any) {
        
        // If empty, defaults to 'Player 1' or 'Player 2' respectively.
        if let name = playerOneTF.text, !name.isEmpty {
            self.playerOneName = name
        } else {
            self.playerOneName = SOME_DEFAULT_STRING_NAME // (i.e. 'Player 1')
        }
        
        if let name = playerTwoTF.text, !name.isEmpty {
            self.playerTwoName = name
        } else {
            self.playerTwoName = SOME_DEFAULT_STRING_NAME // (i.e. 'Player 2')
        }
        
        performSegue(withIdentifier: "goToSecondViewController", sender: self)
        
    }
```

</p>


<p>
  Before the segue is actually completed, we need to prepare to pass the data within FirstViewController (i.e. names entered into UITextField(s)) to SecondViewController and receive it into String variables. 
  Within SecondViewController, we created the following variables to receive the data:
  
  ```swift
  
    var playerOneName : String = ""
    var playerTwoName : String = ""
    
  ```
  
  Within FirstViewController, we can now send the values entered in the UITextField(s) using the following function:
  
  ```swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondViewController" {
            let destinationVC = segue.destination as! SecondViewController
            
            // Access player names within this file and sets the value(s) in destination view controller
            destinationVC.playerOneName = self.playerOneName
            destinationVC.playerTwoName  = self.playerTwoName // Optional based on selectin (one or two players)
        }
    }
  
  ```
  
  
  
</p>
 
<p>
  Next step was to format SecondViewController to assign the received data to labels in the header. Within Main.storyboard, we created two labels linked them to IBOutlets within SecondViewController. 
  
  ```swift
  
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel! // Optional based on selection (one or two players)
    
  ```
 
 Now all that is left is to assign the label(s) text attribute to the name(s) passed from FirstViewController. This can be done within the viewDidLoad() function like so:
 
 ```swift
 
    playerOneLabel.text = "\(playerOneName)"
    playerTwoLabel.text = "\(playerTwoName)"
 
 ```
 
</p>














































