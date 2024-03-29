# UniversalWeatherPowershell

Powershell package to return current weather in a wished city or/and in a wished country identified by its country code.

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

- The main module [UniversalWeatherPowershell.psm1](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/blob/master/UniversalWeatherPowershell.psm1) which contains the Universal Weather Powershell class allowing to initialize, manipulate and manage the weather in a given city;
- The [usedModules](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/usedModules) directory containing all the classes used in the main class and allowing to initialize, manipulate and manage a particular characteristic (temperature, atmospheric pressure ...) in one module each;
- The [samples](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/samples) directory which contains examples of uses this module and package;

The [usedModules](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/usedModules) contains 11 files corresponding each one to a class: 

- __coordinates.psm1__: defining the coordinates Powershell class to encapsulate coordinates datas (latitude and longitude);
- __dateandtime.psm1__: defining the dateAndTime Powershell class to manage dates and times together;
- __geographicLocation.psm1__: defining the geographicLocation Powershell class to encapsulate country and city names;
- __humidity.psm1__: defining the humidity Powershell class to encapsulate all datas relatives to humidity;
- __language.psm1__: defining the language Powershell class to manage current language datas;
- __pressure.psm1__: defining the pressure Powershell class to manage pressure datas;
- __temperature.psm1__: defining the temperature Powershell class to encapsulate and manage temperature datas;
- __ultraviolet.psm1__: defining the ultraviolet Powershell class to encapsulate uv datas;
- __weatherDescription.psm1__: defining the weatherDescription Powershell class to encapsulate and manage weather datas;
- __weatherError.psm1__: defining the weatherError Powershell class to manage possible occured HTTP/HTTPS errors;
- __wind.psm1__: defining the wind Powershell class to encapsulate and manage wind parameters.

The [samples](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/samples) contains 2 other directories:

- The [integratedSamples](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/samples/integratedSamples) which contains the samples, to run inside this folder because it calls the Powershell module in relative path from this directory.
- The [simpleSamples](https://github.com/Vicken-Ghoubiguian/UniversalWeatherPowershell/tree/master/samples/simpleSamples) which contains the samples, to run with the current Powershell module installed on the Windows system.

Further explanations will be provided by browsing the GitHub repository.

<a name="how_use"/></a>
## How use it ?

There are 2 ways to use this module: by [cloning the current GitHub repository](#how_use_github) or by [installing the package from Powershell Gallery](#how_use_powershell_gallery).

<a name="how_use_prerequisites"></a>
### Prerequisites

To make this project work or integrate it into yours, whether as a module to import from [Powershell Gallery](#how_use_powershell_gallery) or a clone of the [GitHub repository](#how_use_github), you must have a machine running Windows 10 or higher (home, professional or educational version) or Windows Server 2016 or higher.

<a name="how_use_github"></a>
### From the GitHub repository

To use this PowerShell package from its GitHub repository, you must first install the Git utility on Windows. 
You have a plethora of Git clients that you can use on Windows ([GitKraken](https://www.gitkraken.com/), [GitHub Desktop](https://desktop.github.com/) ...), then install the one that suits you best.
The best choice is to install the client [Git for Windows](https://gitforwindows.org/). Download the exe file from the official website, then run it.

### Manually install the cloned module on your system

You can install this Powershell module on your windows system, so that you will just need to import this module with the command bellow when opening Powershell :

```powershell
Import-Module UniversalWeatherPowershell
```
Let's see how to do this.

Firstable, you must execute this following command in Powershell :

```powershell
$ENV:PSModulePath
```
It will display you all install paths for Powershell modules.

Secondly, you must move the Powershell module to one of the directory displayed by the previous command.
About the first step command there will be 2 main paths in results :

```powershell 
C:\Users\<User Name>\Documents\WindowsPowerShell\modules
```
```powershell 
C:\program files\WindowsPowerShell\Modules\<Module Folder>\<Module Files>
```
	
If you want the module to be available for a specific user, move the Powershell module to the directory indicated by the first path.
Or if you want the module to be available for all users, move the Powershell module to the directory indicated by the second path.

That's all. 
Now is the time for you to have some fun...

<a name="how_use_powershell_gallery"></a>
### From the Powershell Gallery repository

<a name="what_used"/></a>
## What is used in this project ?

Nothing very specific is used in this project. All classes used were developed by the author of this API. The only element used from the .Net framework, [`System.Windows.Forms`](https://docs.microsoft.com/fr-fr/dotnet/api/system.windows.forms?view=net-5.0) and [`PresentationFramework`](https://referencesource.microsoft.com/#PresentationFramework) is used to develop and then use forms and MessagesBoxes respectively.

<a name="conclusion"/></a>
## Conclusion

It has been an exciting project, easily usable by anyone in any other project written in PowerShell regardless of its size (large or small) and which has broadened my knowledge in PowerShell language development as potentially every other beginner or confirmed developer.
