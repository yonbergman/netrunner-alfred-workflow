# Netrunner Alfred Workflow

A basic workflow to query the available Android Netrunner cards

## Installing
Download the [Netrunner Alfred.workflow](https://github.com/yonbergman/netrunner-alfred-workflow/raw/master/Netrunner%20Finder.alfredworkflow) and import it to Alfred 2 (requires the Alfred Powerpack)


## Usage
To run the query use either `netrunner {query}` or the shorthand `nr {query}`

![](https://raw.github.com/yonbergman/netrunner-alfred-workflow/master/screenshots/screenshot-a.png)

![](https://raw.github.com/yonbergman/netrunner-alfred-workflow/master/screenshots/screenshot-b.png)

## Built Using

* [alfred2-ruby-template]( https://github.com/zhaocai/alfred2-ruby-template )
* [ono-sendai]( https://github.com/shyndman/ono-sendai )

## Development

* Make sure to switch to system ruby (if using rvm `rvm use system`)
* Install the plist gem `gem install plist`
* Update the card.db by running `rake cards:update`
* Compile and test the new workflow by running `rake dbxinstall`

## LICENSE:

Copyright (c) 2014 Yonatan Bergman @yonbergman

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.


[gembundler]: http://gembundler.com/

All code is offered under a permissive license, but the card info and text are copyrighted by Fantasy Flight Publishing, Inc. This Alfred Workflow is not affiliated with or approved by Fantasy Flight.
