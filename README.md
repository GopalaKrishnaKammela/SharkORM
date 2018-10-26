# SharkORM


Sample example for SharkORM.

Please find the PPT for SharkORM in the below link.

https://docs.google.com/presentation/d/1RWq-hrwRhVagD8WPHkJefDHj3T-akAHo-N9HEwjTuoc/edit?usp=sharing

Please find the below link for installation and commands.

https://github.com/sharksync/sharkorm

Requirements
XCode 9+, iOS8+


To install it, simply add the following line to your Podfile:
 pod “SharkORM”

First we need to import the shark ORM

import SharkORM

Once you have added the framework into the application you need to set SRKDelegate to your application delegate.


SharkORM.setDelegate(self)
SharkORM.openDatabaseNamed(“MyDatabase”)
