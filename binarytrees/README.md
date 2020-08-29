# 🌳 Binary Search Trees
## 🔎 Inorder Search
### In order search algorithm:
#### Step 1. If the node we are on has a left child node we push it onto the stack.
 #### Step 2. Get the child node
 #### Step 3. If the node we are on is a leaf node print it.
 #### Step 4. If the stack is not empty pop the stack.
 #### Step 5. If the node we are on has a right node push it onto the stack.
 #### Step 6. Repeat at step 1.

######      10
######     /    \
######   9      2
######   / \    / \
###### 1   3  4   6
###### Result: 1 9 3 10 4 2 6

---

### Post order search algorithm:
#### Step 1. If the node we are on has a left child node the recurrsive call pushes it onto the stack and
 #### Step 2. reads the child node
 #### Step 3. If the node we are on is a leaf node print it.
 #### Step 4. If the stack is not empty pop the stack
 #### Step 5. If the node just popped have a right child node the recurrsive call pushes it onto the stack and
 #### Step 6. Repeat at step 1.

######      10
######     /    \
######   9      2
######   / \    / \
###### 1   3  4   6
###### Result: 1 3 9 10 4 6 2

---

###  Pre order search algorithm:
#### Step 1. Visit the node
 #### Step 2. If the node we are on has a left child print it
 #### Step 3. If the node we are on has a right child print it
 #### Step 4. Repeat at step 1.

######      10
######     /    \
######   9      2
######   / \    / \
###### 1   3  4   6
###### Result: 10 9 1 3 2 4 6

