# SpriteCloud
Sprite Cloud's candidate qualification assignment

Welcome to my test automation project, there's two different test files to validate the environments that were given (Web and API). In this readme file you'll find how to run those test files and also how to set Jenkins as the CI/CD tool to run those tests in a pipeline and provide the reports and results. Let's start to play with this!

First Steps

Clone the Github repo into your local machine from the master branch.

Install the following:

Install Python: https://www.python.org/downloads/ - For this project I have installed the latest version (3.10.1) of python. (You can check the documentation to make sure you have installed Python properly for your corresponding OS)

Install or Upgrade your Pip - You can upgrade by using the command: python -m pip install --upgrade pip

Now with Pip installed/upgraded, install the following:

-Robot Framework - command: pip install robotframework

-Selenium Library - command: pip install robotframework-seleniumlibrary

-Requests Library - command: pip install robotframework-requests

-JSON Library - comand: pip install robotframework-jsonlibrary

Now you are all set to run the test cases for the two environments. Let's move to the next thing.

ToolsQA site - 1st Project

Environment: https://demoqa.com/

For the first project we are going to validate a Website and you'll find some tests UI based. Let's see how to run the tests in different ways.

Run the tests Locally

To run the tests into your local machine, make sure you are on the placed in the SpriteCloud folder, if not you can always use the fancy cd SpriteCloud command in your terminal.

Now you can execute the following command: robot -d Results  Tests/DemoQA/DemoQATest.robot

After execution is done and succesfull, you can go to the SpriteCloud/Results folder and you should be able to see the log.html, output.xml and report.html files generated.

Run the tests via Jenkins

First of all, you've to install Jenkins. Follow the instructions to install it depending on your OS: https://www.jenkins.io/doc/book/installing/ (I've installed Jenkins LTS for Mac OS).

After you followed the instructions and you are able to log in into jenkins, you should create the new pipeline where the tests will be run.

Follow this steps:

1. Create a New Item and select Freestyle Project (put a name for your jenkins job)
2. Add the next configurations:
3. In the General section click on "Advanced" and select "Use custom workspace" adding the path into the project in your local machine:
![image](https://user-images.githubusercontent.com/8301952/145071333-dfe56d8d-fcae-4d09-8cfa-54743792963b.png)
4. In the "Build" section select "Add build step" and from the dropdown pick "Execute shell" (or "Windows batch command" if it's your case)
5. In the command field add the command used to run the tests locally: robot -d Results  Tests/DemoQA/DemoQATest.robot
![image](https://user-images.githubusercontent.com/8301952/145071777-cc336925-3424-4ca3-b1bd-0a82fc24cd80.png)
6. Finally in "Post-build actions" section click on "Add post-build action" and select "Publish Robot Framework test results" from the dropdown and add the Directory output with the path to the proper Results forder: (note: make sure the files name are the same as in the repo)
![image](https://user-images.githubusercontent.com/8301952/145072176-c53b0f01-25ad-4973-b9cd-939d7bd52929.png)
7. Apply changes and save. After that you should be able to click on "Build Now" and get your jenkins run with the link to the results report (that will be also updated in your local project):
![image](https://user-images.githubusercontent.com/8301952/145072768-0d479ffe-2721-4704-9650-ff267af436d9.png)


Calliope.pro Test Results:

About the Scenarios

Next Steps

PetStore Swagger API - 2nd Project

Environment: https://petstore.swagger.io/

For this second project we are going to validate an API in swagger, and now same as the UI project, I'll describe the steps to run them locally.

Run the tests Locally

Since everything has been already set up for the first project, in this one you should also be placed in SpriteCloud main folder for the project in your terminal.

You can row the next command:  robot -d Results_API Tests/PetStore/PetStoreAPI.robot

After execution is done and succesfull, you can go to the SpriteCloud/Results_API folder and you should be able to see the log.html, output.xml and report.html files generated.

Run the tests via Jenkins

1. Follow the same steps as in the previous project, create a new Item and Freestyle project
2. Same in the General section make sure you are adding the custom workspace
3. The difference now, when you add the shell command to be executed make sure you add the new command for this specific project, like this:
![image](https://user-images.githubusercontent.com/8301952/145075435-92bb27ad-a42f-487b-b3d6-3ab386341b64.png)
4. Also in the post-build actions make sure you add the proper path to output the results for this suite like this:
![image](https://user-images.githubusercontent.com/8301952/145075582-c6ba8aad-8489-442d-8582-5d65f441097e.png)
5. Apply changes and save. After that you should be able to click on "Build Now" and get your jenkins run with the link to the results report (that will be also updated in your local project):
![image](https://user-images.githubusercontent.com/8301952/145075688-6b923c68-3d12-4b3a-91fd-f6d2a39c8566.png)

Calliope.pro Test Results:

About the Scenarios

Next Steps
