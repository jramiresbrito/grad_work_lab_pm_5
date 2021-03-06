# HR APP

## This is an exercise of Modular Programming Course from BS Software Engineering at Pontifical Catholic University of Minas Gerais. It consinsts in a small hr management system using pure **ruby with zero dependencies**.
```
Disclaimer: This project uses "non standard" Ruby conventions in order to "achieve the academic purpose". Follow the project exactly is an requirement of this exercise so - instead of express the set of constraints that define the behavior of an object (the semantics of interfaces), which should be checked before the application is run using tests to achieve this goal - I'll use modules to emulate "the shape" of JAVA interfaces.
```
### The requirements can be seen in `requirements/requirements.pdf`
<hr>

### The following patterns were implemented

* MVC Pattern
* Repository Pattern
<hr>

### DOCS
You can find the docs under <code>doc</code> folder.  
The best way to visualize it is to serve using a server like [VsCode Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)

<hr>

### How to use this app
* Download the project and run through `ruby app.rb`
* Login using the credentials
  * login: `joao`
  * pwd: `123456`

<hr>

### Features
* Employees Management
* Session
* Basic Password encryptation
* Data persistance using CSV files
<hr>
Ruby version: 2.6.6
