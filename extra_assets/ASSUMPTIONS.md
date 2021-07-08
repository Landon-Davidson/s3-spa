# List of assumptions I made based off of my interpretation of the excercise doc, this will change over time
* Based off of the description, this excercise is based more on the module than the config itself, therefore, I will be creating the module in the root directory, and the config in the `example` directory. In a normal use case, the config and module would live in separate repos.  
* The error.html and index.html are purely to test against. The content that these represent would typically live in a source repo
* We _could_ use the same bucket with different origin paths per environment, but I prefer separating this infra to be able to safely test changes to the infra.