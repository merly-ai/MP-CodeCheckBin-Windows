Thank you for visiting Merly's MP-CodeCheck (BETA) GitHub repository! We are happy you are here! If you enjoy using MP-CodeCheck and find it useful, we would greatly appreciate your feedback. 

Please email us with any questions, comments, issues, or anything related to MP-CodeCheck to support@merly.ai or debugging@merly.ai. We would love to hear from you!

![merlydog_favicon](https://user-images.githubusercontent.com/92695077/163842195-66aabaa5-9db3-4499-8593-ae40fbef6e97.png)


# What is MP-CodeCheck?
MPCC is an AI-based code anomaly detection system. More specifically, MPCC uses self-supervision, iterative learning, and programmatic-guided evolution to detect anomalous code patterns. MPCC was designed to learn good and bad code syntax, patterns, and semantics from a large corpora of existing code. Once trained, MPCC’s model can be used for a variety of tasks such as: (i) detecting potential anomalies in existing code,
(ii) grading the quality of an existing repository, and (iii) guiding programmers through the important aspects of an unfamiliar or updated code
repository, to name a few.

![System Diagram](https://user-images.githubusercontent.com/92695077/163854383-fadec958-7958-4f27-95be-3f4dcd689f5f.jpg)

At its core, MPCC is a machine programming (MP) system that autonomously identifies anomalous logical expressions directly
in source code. These anomalous expressions, also known as anomalies, are often latent defects in the existing code that
programmers have failed to identify or correct. MPCC helps programmers find these anomalies and correct them, thereby
improving the overall quality of the existing software. For this limited release version of MPCC, we only include MPCC the
ability to perform inference (i.e., detect good or bad patterns) on code. In subsequent releases of MPCC, we may also include
the ability to train new models on other code bases, including users’ own proprietary ones.


## Setup Instructions
Prior to running inference and reviewing the results, let’s set up the environment. To run MPCC, you’ll need the following three
things (at a minimum):
1. A model trained on code (provided by Merly).
2. The MPCC executable (provided by Merly).
3. A code base to run inference against (provided by you, the user).

Please ensure you place both the MPCC model and the executable files in the same folder. Then, to simplify inference, we
recommend you place the code repository folder in the same directory as MPCC. Your setup is now complete!


## Launching MP-CodeCheck
Now that setup is complete, let’s launch MPCC to perform inference analysis. From the command line interface (CLI), type the
following (where ”[code base folder]” is a directory that contains the code you want to analyze):

*MPCC.exe infer -D [code base folder]*

When run successfully, MPCC will display information that looks similar to the following screen. This shows the progress of MPCC extracting the code DNA from the training data.

![TrainingScreen](https://user-images.githubusercontent.com/92695077/163841808-0721b703-4883-455d-8323-91759bc10c1e.png)

When MPCC has loaded its trained model and processed the code DNA, it begins inference analysis on all source code that
it finds in the files of the directory (or subdirectories) you have supplied when launching it. The image below shows an example of
MPCC’s inference progress in analyzing a code repository, how much work it has completed, and how much work is remaining.

![Inference](https://user-images.githubusercontent.com/92695077/163842630-a1778d96-12e5-4294-8639-40482fc8b0ea.png)

When inference analysis has completed, the Code View screen will appear (see image below), which will allow a user to
analyze the inference results as discussed in the next section.

<img width="705" alt="CodeView" src="https://user-images.githubusercontent.com/92695077/163842762-71dd7e1f-4f25-4be2-a59c-b51bec239480.png">


## Exploring MPCC's Inference Results

After inference analysis is performed, MPCC will show a user interface that includes source code, with an expression highlighted.
We call this screen the *Code View*, which will be described in more detail in Views section of this manual. The image below provides an
example of an anomalous code example found by MPCC.

![CodeView with identifiers](https://user-images.githubusercontent.com/92695077/163843319-26c465c0-c735-49fa-92a4-392f28923a92.png)

Here's a description of what you'll see on this screen:

**Sort Criteria:** This refers to how MPCC is sorting the list of expressions it has found. This can be via score (a numeric value
assigned by anomaly identification and complexity), or location (sequential code order).

**Class Filter:** This refers to which class of complexity is being filtered in the current view. This can be set from a minimum
value of trivial to a high value of Max complexity.

**Cost Filter:** This refers to a “mental cost” of an expression. This filter can be set from a minimum value of 0 to a maximum
value of 2,000.

**Displayed Items:** This refers to which items MPCC is displaying. It can be set to all expressions, or only anomalous
expressions.

**Hide/Show Known Good:** This refers to whether or not MPCC displays expressions that have been marked by the user as
Known Good.

**Anomaly Identification:** This displays whether or not MPCC has identified the current expression as an anomaly. Non-
anomalous expressions will be classified as “known pattern detected” and highlighted in green. Anomalous expressions will be
classified as “unfamiliar pattern(s) detected” and will be highlighted in green.

**Cost:** This displays the “mental cost” of the current expression.

**Complexity:** This displays the class of complexity of the current expression.

**Source Code Location:** This displays the file location of the source code under review.

**Anomaly/Expression Count:** This displays the count of the highlighted expression, as well as the total expressions found in
this file. If the user toggles the filter to show only anomalies, this will display the count of highlighted anomaly, and the total
anomalies found in the current file.

**Walking Through Code:** You can move forwards and backwards through the expressions by using the left and right arrow
keys, and can page up and page down through the code (by location) using the Page Up and Page Down keys. You can also
scroll up and down through the code by hold the Control key while pressing the up or the down arrow, respectively.

## Basic Commands and Views

In MPCC, there are a number of supported keyboard and mouse commands. In this section we describe those keystrokes and
explain mouse behavior. Perhaps the most important initial command to remember is the *help* command which can be launched
by pressing the character ’h’ on your keyboard. The help command lists all of the keyboard commands, so if you ever find
yourself not remembering a keyboard command, just press ’h’ and MPCC will launch the keyboard shortcut commands. A
screenshot of the help dialogue box is shown below.

![helpscreen](https://user-images.githubusercontent.com/92695077/163854769-94c37a71-74a4-40de-bc42-8ea852083aea.JPG)

In addition to commands, there are several screens users can utilize to help them gain deeper insights into specific anomalies,
general anomaly information, anomalies by file, anomalies per file, and so forth.

**Code View:** This is the view of all of the code, with the expressions found highlighted. This view is the default view when
MPCC is initially run.

<img width="705" alt="CodeView" src="https://user-images.githubusercontent.com/92695077/163855031-ea4db9ed-1ee5-4ac5-a5f5-a0d517ba449a.png">

**Anomalies View:** Press ‘a’ to switch to the Anomalies view. This view shows all of the expressions in the code (across all
files) that MPCC has determined to be an anomaly, sorted by score. You can move up and down the list using the up and down
arrows, or the Page Up and Page Down keys. Press Enter with an anomaly highlighted to switch back to the Code View of that
specific anomaly.

<img width="705" alt="AnomaliesView" src="https://user-images.githubusercontent.com/92695077/163855188-f5023c56-bbc2-4071-ba67-0651d6cbfdeb.png">

**Files View:** Press ‘f’ to switch to the Files view. This view shows all of the source code files, with the total number of
expressions MPCC found in each file. You can move up and down the list using the up and down arrows, or the Page Up and
Page Down keys. Press Enter with a file highlighted to switch back to the Code View of the expressions within that specific file.

<img width="705" alt="FilesView" src="https://user-images.githubusercontent.com/92695077/163855836-3a8ac307-5518-4796-ac55-8af3bcc9ec16.png">

**Expressions View:** Press ‘e’ to switch to the Expressions view. This view shows all of the expressions in the current file,
sorted by score. You can move up and down the list using the up and down arrows, or the Page Up and Page Down keys. Also
note that you can toggle the sort between code location and score by pressing the ‘s’ key. Press Enter with an expression
highlighted to switch back to the Code View with that specific expression highlighted.

<img width="705" alt="ExpressionsView" src="https://user-images.githubusercontent.com/92695077/163855949-501e65c3-93bc-4636-8a03-66769259c753.png">

**Details View:** Press ‘d’ to switch to the Details view. This view shows the detail of the currently selected expression. The
detail lets you know how many anomalies MPCC identified within the expression, the cost, and the total score. Press ‘d’ to
return to Code View.

<img width="705" alt="DetailsView" src="https://user-images.githubusercontent.com/92695077/163856242-1b2c3abe-c710-49e6-b4a0-b39df1eba9de.png">

**Help Pop-up:** In addition to the above views, you can press the ‘h’ key in any view to bring up the help screen which will
show you all of the hot keys and their functions.

![helpscreen](https://user-images.githubusercontent.com/92695077/163856546-bf918cdf-19b6-45d7-a5b3-0dc286ff9833.JPG)

## Sorting/Filtering Inference Results

The following lists the ways MPCC’s inference results on source code data can be sorted and/or filtered.

***Sort Criteria:***

**Options:**
* Score (numeric value assigned by anomaly identification and complexity)
* Location (sequential code order)

**Default:** Score

**Toggle:** ‘s’ key

***Class filter***

**Options:**
* Trivial (minimum)
* Basic
* Complex 1
* Complex 2
* Max

**Default:** Trivial

**Adjust:** '1', '2', '3', '4', '5' keys


