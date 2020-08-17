# parameterparTutorial
This Learnr tutorial was made for the `parameterpar`package made by @sofloud 

To bundle a tutorial into an R package:

1. Create a tutorials directory within the `inst` sub-directory of your package and then create a directory for your tutorial there (e.g. inst/tutorials/parameterparTutorial).
2. Add the .Rmd associated with your tutorial in that directory. (You may see a ..._files/_ directory or a .html file that periodically get generated adjacent to your .Rmd tutorial. You can safely ignore, delete, or exclude these from your package and from version control. They are temporary artifacts produced while rendering the tutorial on your specific system and aren’t likely to be portable to other environments.)
3. Add the `css` folder with the css file for the personalized styles for you package.
