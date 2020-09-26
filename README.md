# UniversalWeatherPowershell

Powershell package to return current weather in a wished city.

## Contents

1. [What is this project ?](#presentation)

2. [How is it structured ?](#structure)

3. [How use it ?](#how_use)
	- [prerequisites](#how_use_prerequisites)
	- [From the GitHub repository](#how_use_github)
	- [From the Powershell Gallery repository](#how_use_powershell_gallery)

4. [What is used in this project ?](#what_used)

5. [Conclusion](#conclusion)

<a name="presentation"/></a>
## What is this project ?

This project consists of the development of an API as a package which catch and manage the chosen city weather. 
This API is written in Powershell and can be used or included in any powershell code, software or project.

To access the GitHub repository, click [here](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell).<br/>
To access the Powershell Gallery repository, click [here](#truc).
  
<a name="structure"/></a>
## How is it structured ?

This project is structured in several elements:

- The main module [UniversalWeatherPowershell.psm1](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/blob/master/UniversalWeatherPowershell.psm1) qui contient la classe Universal Weather Powershell permettant d'initialiser, de manipuler et de gérer la météo dans une ville donnée;
- The [usedModules](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/usedModules) directory containing all the classes used in the main class and allowing to initialize, manipulate and manage a particular characteristic (temperature, atmospheric pressure ...) in one module each;
- The [samples](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/samples/integratedSamples) directory which contains examples of uses this module and package;
- The [Dockerfiles](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/Dockerfiles) directory which contains all Dockerfiles to containerize their respective examples.

Further explanations will be provided by browsing the GitHub repository.

<a name="how_use"/></a>
## How use it ?

There are 2 ways to use this module: by [cloning the current GitHub repository](#how_use_github) or by [installing the package from Powershell Gallery](#how_use_powershell_gallery).

<a name="how_use_prerequisites"></a>
### Prerequisites

To make this project work or integrate it into yours, whether as a module to import from [Powershell Gallery](#how_use_powershell_gallery) or a clone of the [GitHub repository](#how_use_github), you must have a machine running Windows 10 or higher (home, professional or educational version) or Windows Server 2016 or higher.

<a name="how_use_github"></a>
### From the GitHub repository



<a name="how_use_powershell_gallery"></a>
### From the Powershell Gallery repository

<a name="what_used"/></a>
## What is used in this project ?

<a name="conclusion"/></a>
## Conclusion
