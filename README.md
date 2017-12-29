# Pre-work - Tipper Helper

Tipper Helper is a tip calculator application for iOS.

Submitted by: Bethany Bin

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [ ✓] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [✓] Settings page to change the default tip percentage.
* [ ] UI animations
* [✓] Remembering the bill amount across app restarts (if <10mins)
* [✓] Using locale-specific currency and currency thousands separators.
* [✓] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [✓] The ability to have customized tip percentages.
- [✓] Reset to default percentages button (18%, 20%, 25%).
- [✓] Split the bill based on number of people



## Video Walkthrough

Here's a walkthrough of implemented user stories:
THIS IS NOT THE GIF WITH THE LATEST UPDATES!

<img src='https://i.imgur.com/5mFXqi8.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The biggest challenge was learning how to use UserDefaults and where to use it in the view controller. It took some time for me to figure how to get the first view to update the tip percentage and amount based on what was set as default in the settings view. Another challenge was figuring out how to access the applicationDidEnterBackground and applicationWillEnterForeground functions in the view controller to measure time elapsed. A bug is the Settings button grays out after it is pressed once and I can't find a way to keep it blue the entire state.
## License

Copyright 2017 Bethany Bin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
