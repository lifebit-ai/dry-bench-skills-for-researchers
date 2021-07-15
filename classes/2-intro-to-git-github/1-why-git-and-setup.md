# A. Why Git and GitHub? 

Motivation and set up in the JupyterLab workspace


## 1. Why Git? 

<img src="https://git-scm.com/images/logos/downloads/Git-Logo-1788C.png"  width="100">

Git is a [technology or a system used for version control](https://git-scm.com/) of code

- Frees up our code from our local machine (no risk of losing files from your laptop!)
- Ensures that we are tracking the changes of our code as a project progresses
- Allows us to revisit older versions of our code
- Allows us to keep different versions of our code

## 2. Why GitHub?

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGO2P0vFlvhsDbmltsjjIWZMi1dQCduIkuwA&usqp=CAU"  width="50"> 

Git **_Hub_** is a [_"code hosting platform for version control and collaboration"_](https://guides.github.com/activities/hello-world/)

- Large community of open source project to browse
- Enables collaboration of many contributors in the same project
- Serves as a code vault for making our reasearch code findable and our methods transparent


# B. Set up in the terminal


## i) Using the `nano` file editor 

Before we start working with Git in the command line, we will learn one more helpful skill. How to use a code editor. A code editors allows us to edit files in an environment without a graphical user interface. For us, it will be needed in some Git related tasks, so we want to be prepared.

<!-- #region -->
Edit a file using nano in only 5 steps:

### 1. Type **`nano hello.txt`** 

This will create a new file named `hello.txt`. If the file already exists, it will open the file.


### 2. Write inside the open file named `hello.txt` 
As you typically would type in any Document editor eg Google Docs. You can type for example, `Hello Git!`

### 3. When ready to save type the shortcut:

<kbd> **`CTRL`**  </kbd> `+`  <kbd> **`O`** </kbd>

This will declare your willingness to save the file. Click <kbd> **`ENTER`**  </kbd> to verify that you want to save the file.

### 4. Close the file and exit from nano with the the shortcut:
<kbd> **`CTRL`**  </kbd> `+`  <kbd> **`X`** </kbd>

Awesome, your file has just been saved! You can inspect using the `head` command, eg `head hello.txt`

We will probably need soon `nano` in one of our Git tasks.


## ii) Configuring our GitHub user information

To be able to use Git and GitHub from the command line we need to configure the information related to our GitHub user. Let's follow the commands below to set in the workspace the required information.

<!-- #region -->
### 1. Set user _**name**_

Replace ` <my github user name>` with your actual GitHub email.


`git config --global user.name <my github user name>`
<!-- #endregion -->

<!-- #region -->
### 2. Set user _**email**_

Replace `<my email associated with my github user name>` with your actual GitHub email.


`git config --global user.email <my email associated with my github user name>`


<!-- #endregion -->

### 3. Set preferred file editor eg _**nano**_


`git config --global core.editor nano`


## _Next up: Forking repositories, the git workflow to re-use and extend projects available in GitHub_