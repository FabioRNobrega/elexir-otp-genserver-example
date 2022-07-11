# ElhexDelivery | Farno

One code example is a study about elixir OTP applications using GenServe and Supervisors. Following a YouTube class made by [omgneering](https://www.youtube.com/c/omgneering). For more info see the official [GenServer DOC](https://hexdocs.pm/elixir/1.12/GenServer.html) and [Supervisor DOC](https://hexdocs.pm/elixir/1.12/Supervisor.html).

> OBS: 
> The original tutorial has some deprecated implementation, so i refactor the new way of using supervisors. You can find the old way at
> `example/deprecated-supervisor-implementation` branch and the new way at the master branch. 


I use:
- Erlang/OTP 24
- IEx 1.13.4 (compiled with Erlang/OTP 22)

The ZipCode was found on [Census.org](https://www.census.gov/geographies/reference-files/time-series/geo/gazetteer-files.html)

Table of contents
=================

  * [Install](#install)
  * [Usage](#usage)
  * [Tests](#tests)
  * [Git Guideline](#git-guideline)

## Install
For run this application you need to have erlang and Elixir installed. You can follow the [ElixirSchool](https://elixirschool.com/en/lessons/basics/basics#installing-elixir-1) tutorial to help you with that.  

## Usage
Clone this repo and cd into and run

```bash 
iex -S mix
```

After compile with the command above you will be able to access ao functions to calculate position base in two zipCodes from USA. 
For example the distance between Minneapolis, MN ZipCode 55401 to Austin, TX ZipCode78703 run. 

```bash
ElhexDelivery.PostalCode.Navigator.get_distance(55401, 78703)
```
## Tests

The tests are made using [ExUnit](https://hexdocs.pm/ex_unit/main/ExUnit.html) and can be found on the test folder. To run use

```bash
mix test
```

## Git Guideline
Create your branches and commits using the English language and following this guideline.

#### Branches
- Feature:  `feat/branch-name`
- Hotfix: `hotfix/branch-name`
- POC: `poc/branch-name`
- Example `example/branch-name`

#### Commits prefix
- Chore: `chore(context): message`
- Feat: `feat(context): message`
- Fix: `fix(context): message`
- Refactor: `refactor(context): message`
- Tests: `tests(context): message`
- Docs: `docs(context): message`


