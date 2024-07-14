
# iOSTask Project
A three screen iOS assignment demonstrating autolayouts and coding practices.

# Description
<p>This project is a three screen iOS app focused on using Auto Layout and good coding practices. Since I only had screenshots to work from, the icons, colors, and font sizes might not be exact. The main aim is to show how to use Auto Layout for designing the UI.

The app is made with Swift and UIKit, following the MVVM architecture. I used mock data in the ViewModels to display the information on the screens.</p>

# Getting started
<p>
1. Make sure you have the Xcode version 15.0 or above installed on your computer.<br>
2. Download the iOSTask project files from the repository.<br>
3. Open the project files in Xcode.<br>
4. Review the code and UI<br>
5. Run the active scheme.<br>
You should see the text Home Screen with grid of buttons.<br>


# Screens Detail
 ## Home
  The first screen you see is the Home screen, which includes a sample logo and icons. A collection view is used to display the grid of buttons. Each row has two cells, and the items are square shaped, with the height matching the width, to fit the screen size. When you click on the Dashboard button, you'll navigate to the Dashboard screen. Clicking any other button in the grid will take you to a sample screen.
  I used the MVVM architecture to display the mock data. I created a Category model with image and title properties, and made a list of Category model instances in the ViewModel. This list is then used in the ViewController to display the data retrieved from the ViewModel.
  
  ## Dashboard
I designed the Dashboard screen using Auto Layouts, with a dummy image at the top. Below it, I added two collection views: one for course information and another for calendar information. At the bottom, I used a table view to display courses using mock data.

In the first collection view for course information, I divided the cell size into three equal parts corresponding to the screen width. In the calendar collection view, I displayed the current day as selected and disabled scrolling.

I used the ViewModel for mock data. For course information, I created a model and made a list of that model type in the ViewModel, which is then used in the ViewController. For the calendar view, I generated a list of dates for the current month. I checked the current date and set its `isSelected` property to true to show the current date as selected.

At the bottom, I displayed courses with dummy information. I created this dummy information in the ViewModel and used the list in the ViewController to display it. Clicking on any course opens the Course Detail page.

I also added a side menu option on the Dashboard screen, which includes a list of buttons. Pressing the logout button navigates back to the Dashboard. Since there was no other way to return to the Dashboard, I included this navigation from the logout button.

I avoided using any CocoaPods for the side menu implementation. When the menu button is clicked, the side menu appears with a dimmed view on the remaining section of the screen. Clicking on the dimmed section or any item in the side menu causes the side menu to disappear with animation.

  ## Course Detail
I designed the Course Detail screen using Auto Layout, featuring a dummy image at the top. To accommodate smaller devices, I implemented a scroll view at the bottom of the detail view for scrollability.

The screen displays course-specific details, which were passed from the previous screen where the course was selected.



# Architecture
I followed the MVVM (Model-View-ViewModel) architecture for this project as required. In MVVM, I handled all data operations within the ViewModel, adhering strictly to the principle that ViewModels should not contain any UI-related logic.

Similarly, my ViewControllers were designed purely for displaying data obtained from the ViewModels. They were not involved in handling data; instead, they focused solely on presenting information to the user.

I used a straightforward approach to connect my ViewModel to the ViewController, as demonstrated in this project. Throughout my coding process, I emphasized the importance of separating concerns for each component, ensuring clarity and maintainability.

# Structure 
* "Modules": The source code files for a specific module. Files within a module folder are organized into subfolders, such as "Views" or "Models", "View Models".
* "Extension": Added extensions a little bit that can be used in this project. 
* "Utility": Utility included in this project consist of BaseviewController, storyboard extension and sidmenu manager.
* "Router": Router class have navigation for the whole project.

# Dependencies
No dependencies added.

# Feedback
Happy to get any type of feedback. thanks


