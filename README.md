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

<p>
  For this application, the data that needed to be passed originated from user input entered into one or two UITextFields, depending on which game mode the user selected (i.e. name of player one and/or player two). In order to pass user-entered text from a UITextField to the following ViewController, it was necessary to have the correct structure to store, access, update, and pass the data. 
</p>

<p> The first step was to navigate to Main.storyboard and focus on the one/two UITextFields in question. Opening the assistant editor, I created an IBOutlet for both UITextFeilds within their corresponding ViewController.swift file. </p>

<p> ... </p>
