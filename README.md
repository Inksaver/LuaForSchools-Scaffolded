# LuaForSchools-Scaffolded
This repository is designed to support learners, usually at primary or secondary schools to get started with text-based coding.

Why Lua?

Python seems to be the language of choice for schools, but it is not the easiest when coding for the first time.
There is often confusion with the syntax when typing your first lines, especially if using the built in Idle IDE.
As soon as you run it, you are reminded to save it (annoying: it should auto-save), then you get a bunch of incomprehensible error messages because you forgot/did not understand the idea of code blocks being delineated with text you cannot see (whitespace).

Python Example:
```python
if condition == True:

    print("Success!")  # This code has to be 4 spaces or 1 tab from the margin, otherwise it errors
```
Lua Example:
```lua
if condition == true then

    print("Success!") -- This code indented for human readability
    
end                 -- end keyword used to delineate all code blocks, including functions
```
This also works without error:
```lua
if condition == true then print("Success!") end
```
Try that in Python!

The existing repository https://github.com/Inksaver/LuaForSchools has been used for 5 years with great success.
Pre-printed bound paper manuals were handed out to each pupil, with .pdf copies available on the repository for them to read online, or download at home.

Pupils have made a number of comments and observations in the past, which this new repository hopes to overcome:

1. Do I have to type all this lot out?
2. What do I do next?
3. Its not working.

The first issue 'Do I have to type all this lot out?' was overcome once they were shown how to download or copy / paste from Github, but because the code simply worked, nothing new was learned and they moved on without experimentation.
This new repository is designed from the start to be downloaded or copy/pasted.
Syntax and logic errors are built-in, with comments in the code to help resolve them

The second issue 'What do I do next?' was overcome with a response based on a polite version of RTFM. Probably an out-dated way of doing things...
This new repoitory gives precise instructions on what to do next within the code.

the third issue 'Its not working.' demonstrates an inability to look at the output from the debugger and try to find out how to use the information it provides. Direct intervention was usually required.
This new version pastes the typical error message next to the line with the error, in an attempt to guide them what to look for when they create their own errors.

This repository has been specifically written with ZeroBrane Studio and designed to be used with it. Schools have no difficulty installing it and do not have to be concerned with licencing issues. https://studio.zerobrane.com 

The output console built in to Zerobrane can handle a small subset of ANSI codes to allow around 7 colours to be used, which helps with the appearance of text based code when running.

