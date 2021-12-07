# SpriteCloud
## Introduction

Welcome to my test automation project, there're two different test files to validate the environments that were given (Web and API). In this readme file you'll find how to run those test files and also how to set Jenkins as the CI/CD tool to run those tests in a pipeline and provide the reports and results. Let's start to play with this!

### First Steps

Clone the Github repo into your local machine from the `master` branch.

*Install the following:*

**Install Python:** https://www.python.org/downloads/ - For this project I have installed the latest version (3.10.1) of python. (You can check the documentation to make sure you have installed Python properly for your corresponding OS)

**Install or Upgrade your Pip** - You can upgrade by using the command: `python -m pip install --upgrade pip`

*Now with Pip installed/upgraded, install the following:*

**Robot Framework** - command: `pip install robotframework`

**Selenium Library**- command: `pip install robotframework-seleniumlibrary`

**Requests Library** - command: `pip install robotframework-requests`

**JSON Library** - comand: `pip install robotframework-jsonlibrary`

Now you are all set to run the test cases for the two environments. Let's move to the next thing.

## ToolsQA site - 1st Project

**Environment:** https://demoqa.com/

For the first project we are going to validate a Website and you'll find some tests UI based. Let's see how to run the tests in different ways.

### Run the tests Locally

To run the tests into your local machine, make sure you are on the placed in the SpriteCloud folder, if not you can always use the fancy `cd SpriteCloud` command in your terminal.

Now you can execute the following command: `robot -d Results  Tests/DemoQA/DemoQATest.robot`

After execution is done and succesfull, you can go to the `SpriteCloud/Results` folder and you should be able to see the `log.html`, `output.xml` and `report.html` files generated.

### Run the tests via Jenkins

First of all, you've to install Jenkins. Follow the instructions to install it depending on your OS: https://www.jenkins.io/doc/book/installing/ (I've installed Jenkins LTS for Mac OS).

After you followed the instructions and you are able to log in into jenkins, you should create the new pipeline where the tests will be run.

**Follow this steps:**

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


### Calliope.pro Test Results: https://app.calliope.pro/reports/109853/public/865882d0-e3b6-4563-850b-3ecc7e9b1677

![image](https://user-images.githubusercontent.com/8301952/145090544-9d775691-6cf5-43f9-b83d-1d5e2522bf51.png)

### About the Scenarios

I've selected this scenarios by reviewing main functionality of the website and with the end user's point of view of what should I be expecting when using this site. This site's goal is to test different web elements and interact with them and also a big important thing is the basic navigation of the site, by displaying the landing page properly and user able to navigate to the different menus and elements, selecting them and making sure that user will be redirected to the expected section. That's why I think these are the most important, first of all, mainly I need to make sure that the actual site is visible and navigation works properly before a user can start interacting with the elements in the specific sections and at the end I want to make sure that the interactions are working, so I've selected some of the web elements randomly to validate they are working as expected.

### Next Steps

The next steps for this project will be to continue generating the Resources files for all the site sections, as you see I have created some as an example of how they are going to look, using the Page Object model and adding the keywords that will add interaction with the site sections, that way creating and adding new test cases for other parts of the site will be easier and reusable, making faster the development of a complete framework and an automation suite for this site. Also adding files to configure keywords to set up the browser and sessions that can be added as Test Setups and Test Teardowns into the test cases.

## PetStore Swagger API - 2nd Project

**Environment:** https://petstore.swagger.io/

For this second project we are going to validate an API in swagger, and now same as the UI project, I'll describe the steps to run them locally.

### Run the tests Locally

Since everything has been already set up for the first project, in this one you should also be placed in SpriteCloud main folder for the project in your terminal.

You can row the next command:  `robot -d Results_API Tests/PetStore/PetStoreAPI.robot`

After execution is done and succesfull, you can go to the `SpriteCloud/Results_API` folder and you should be able to see the `log.html`, `output.xml` and `report.html` files generated.

### Run the tests via Jenkins

1. Follow the same steps as in the previous project, create a new Item and Freestyle project
2. Same in the General section make sure you are adding the custom workspace
3. The difference now, when you add the shell command to be executed make sure you add the new command for this specific project, like this:
![image](https://user-images.githubusercontent.com/8301952/145075435-92bb27ad-a42f-487b-b3d6-3ab386341b64.png)
4. Also in the post-build actions make sure you add the proper path to output the results for this suite like this:
![image](https://user-images.githubusercontent.com/8301952/145075582-c6ba8aad-8489-442d-8582-5d65f441097e.png)
5. Apply changes and save. After that you should be able to click on "Build Now" and get your jenkins run with the link to the results report (that will be also updated in your local project):
![image](https://user-images.githubusercontent.com/8301952/145075688-6b923c68-3d12-4b3a-91fd-f6d2a39c8566.png)

### Calliope.pro Test Results: https://app.calliope.pro/reports/109852/public/242c1b01-0995-472d-82cb-183603c1ea73

![image](https://user-images.githubusercontent.com/8301952/145091857-6eb9fae1-d524-48e6-918f-23e1aa8b2130.png)

### About the Scenarios

As a CRUD API it's important to make sure that data basic functionalities are covered, so based on that and the fact that is a pet store I've selected 3 of the Pet endpoints to add a Pet, after it's added, then I can update the Pet info and at the end reviewing the Pet again and make sure the Pet was updated, cause this is a Pet store and first of all we want to make sure we are able to add the records for the Pets, before doing anything else with this information.

### Next Steps

The next steps for this project will be quite fun and involve reporing some bugs, YES! I know I wasn't asked to report bugs, but I found several issues when tested this API. So yes, when you review the test results you will notice that the test case for updating pet's information is failing. Before I continue explaining next steps I would love to say that next steps also will include a Dev team to fix this bugs in the API.

**These are the issues I've found:**

1. When creating a new Pet, after is supposed to be created if you go to the get pet endpoint by Id you will notice that sometimes it doesn't come up
2. As per the first issue, you'll see on my test results report that the seconds test fails because of that, it will try to update the pet but it doesn't able to, cause the API doesn't find it.
3. The las test case is passing because the first time the tests were executed all passed, meaning that the data was updated so in the validation that jsons shouldn't be the same, this is actually right cause they were updated first time.
4. There are more endpoints having the same issue, sometimes the new record you've added comes up and sometimes not, so a lot of work can be done here.

At the same time issues are resolved, this project can follow the same approach as the UI one, adding resources files for the API and with reusable keywords, that will improve test cases creation and more readable and cleaner. Adding some scripts that can create for example random Id's that can be used in any different test runs, and also creating a resource file to configure the proper sessions and have Test Setup and Teardown, to clean data added into the API after tests are run.

### So this is all for this automation project, hope you enjoy it and I'm really looking forward to collaborate with you, let's see if I nailed it! (:
