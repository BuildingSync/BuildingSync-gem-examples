# BuildingSync Gem Examples

This repository contains examples using the BuildingSync Gem to convert from BuildingSync to OpenStudio. There are
several examples in the unit tests for the BuildingSync Gem; however, those examples are used as part of the project's
integration tests and in many cases don't exemplify the best practices for using the BuildingSync Gem.

## Workflow

The ideal workflow is to create a new Ruby-based project and add the BuildingSync-gem to the Gemfile. It is also
recommended to use the [BuildingSync selection tool](https://selectiontool.buildingsync.net/validator) to validate 
that the BuildingSync instance will work with the proposed use case.

## Installation

The BuildingSync Gem requires installation of OpenStudio, specifically [OpenStudio v3.0.1](https://openstudio-builds.s3.amazonaws.com/index.html?prefix=3.0.1/).
The newer versions of OpenStudio have minor breaking changes that have not been addressed in this repository yet. After OpenStudio is
installed, then export the path of the folder that contains the openstudio.rb file to RUBYLIB environment variable
(e.g., `export RUBYLIB=/Applications/OpenStudio-3.0.1/Ruby`)

Required dependencies:

* OpenStudio 3.0.1
* Ruby 2.5.x

```bash
gem install bundler
bundle install
```

## Example Files

The example files below are taken from [BuildingSync's TestSuite](https://github.com/BuildingSync/TestSuite). In the future
we should move these examples to the TestSuite as part of the broader integration tests.

* L000 
  
  * Very high level model articulation for Willis Tower in Chicago. The model does not represent geometric reality.

    ```bash
    bundle exec ruby run_L000.rb
    ```

* L100 - OpenStudio Pre Simulation 
  
  * Still in testing. Does not currently work with the HVAC system that is defined.
  
* L100 - Audit

  * Still in testing. Does not currently work with the HVAC system that is defined.