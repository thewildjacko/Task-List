## Part 1 - Short answer questions.

a) **Modifiers** are used to customize the appearance and behavior of a View.

b) The basic building block of a SwiftUI interface is a **View**.

c) Each View in SwiftUI is a **value** type.

d) List two ways you can find the modifiers of a View.
- **Dot syntax: type a `.` after the view and let autocomplete show you the options**
- **The modifiers tab in the Library (lists modifiers by category)**

e) True or False: A modifier changes a View.</br>
**False, each modifier returns a new view.**

f) Modifiers are performed and returned in **top-to-bottom order** from the **view** they are applied to. 

g) When the data driving a View changes, that View has to be **re-rendered** to reflect the change.

h) True or False: The @Binding establishes a two-way communication between Views.</br>
**False, `@Binding` establishes a two-way connection between a view and its *data*.**

i) @State works with **value** types and @StateObject works with **reference** types.

j) True or False: A @State property can be defined as let (constant).</br>
**False `@State` properties have to be defined as`var`**

k) A List is a specialized version of a **vertical** stack.

l) The default alignment of a VStack is **`.center`**, and the default alignment of the HStack is **`.center`**.

n) A stack always gets one  **alignment guide** from each of its children.

o) The alignment guide for an HStack is **vertical**. And the alignment guide for a VStack is **horizontal**.

p) Grids only come in **lazy** variants.

q) The Grid Item Array defines the **size, spacing and number of the rows or columns** of the Grid.
