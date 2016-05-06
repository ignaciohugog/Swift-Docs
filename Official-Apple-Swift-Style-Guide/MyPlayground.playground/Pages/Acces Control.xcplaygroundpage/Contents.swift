//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/* Acces control */
//restricts acces to parts of your code from code in other source files and modules
//we can sepcefic acces to individula types (classes, structures, enunerations), properies, functions, protocol

/* Acces level */

//Public access: enables entities to be used within any source file from their defining module, 
//and also in a source file from another module that imports the defining module. 
//You typically use public access when specifying the public interface to a framework.

//Internal access: enables entities to be used within any source file from their defining module,
//but not in any source file outside of that module. 
//You typically use internal access when defining an app’s or a framework’s internal structure.

//Private access: restricts the use of an entity to its own defining source file. 
//Use private access to hide the implementation details of a specific piece of functionality

//Fuiding principle: No entity can be defined in terms of another entity that has a lower (more restrictive) access level.

//Default Access levels: internal

//The access control level of a type also affects the default access level of that type’s members

/* Access Levels for Single-Target Apps */
//When you write a simple single-target app, the code in your app is typically self-contained within the app and does not need
//to be made available outside of the app’s module. The default access level of internal already matches this requirement.
//Therefore, you do not need to specify a custom access level. You may, however, want to mark some parts of your code as private
//in order to hide their implementation details from other code within the app’s module.

/* Access Levels for Frameworks */
//When you develop a framework, mark the public-facing interface to that framework as public so that it can be viewed and accessed
//by other modules, such as an app that imports the framework. This public-facing interface is the application programming interface (or API) for the framework.

/* Access Levels for Unit Test Targets */
//When you write an app with a unit test target, the code in your app needs to be made available to that module in order to be tested.
//By default, only entities marked as public are accessible to other modules. However, a unit test target can access any internal entity, 
//if you mark the import declaration for a product module with the @testable attribute and compile that product module with testing enabled.”

