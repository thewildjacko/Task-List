## Part 1 - Short answer questions

a) The **FileManager**_ class allows you to interact with the file system and its contents.

b) Apps on iOS are **sandboxed** from each other.

c) True or False: 

FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] will give the document directories for all Apps the user has on their device.

**False, it will give the document directory for the app in which you're working in Xcode**

d)The **Sources** folder is a good place to put re-usable code when using Playgrounds.

e) What URL property allows you to view the URL’s path? **the `path` property**

**`URL(fileURLWithPath: String, relativeTo: URL)`** allows you to add a file name to a directory.

f) Name at least three Swift Data Types you have used up to this point in the bootcamp.
- **String**
- **Int**
- **Double**
- **Bool**
- **Float**
- **Char**

g) How can you find the number of bytes a Data Type uses?</br>
**with `MemoryLayout.size(ofValue:)`, or for arrays, by multiplying the `MemoryLayout.size` by the array's `count`**

h) Using Playgrounds, how can you tell that the Data.write operation succeeded?</br>
**The result will appear as a readout in the sidebar, and a file will appear in the document directory.**

i) You can mostly treat Data objects like **arrays** of bytes.

j) The write and read methods of Data require a **try**.

k) What JavaScript calls an object is the same concept as a heterogenous **dictionary** in Swift with **strings** for keys.

l) How do you resolve the error: Use of unresolved identifier ‘Bundle’?</br>
**`import Foundation`**

m) Give an example of Snake Case. **json_is_difficult_but_i_kind_of_understand_it_now**

n) A struct that will be used in the reading and writing of data must conform to the **Codable** Protocol

o) Show the line of code used to access the user’s document directory for the running app. **`print(FileManager.documentsDirectoryURL)`**

p) Files added to the project that will be used by the app can be found in the **app bundle** when the app is running.
