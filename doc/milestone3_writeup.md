Milestone 3 Writeup
================

### Reflections on Feedback Session

##### Sliders

Our reviewers were able to navigate our app fairly well, but there were a few points of confusion. Most notably, both pairs of reviewers commented on the use of the sliders to enter dates. While our reviewers found the slider for selecting the range of years for the line chart intuitive, they found the slider for selecting a single year for the bar chart confusing. They felt the slider made it seem like they were selecting another range of years rather than a single year. We found these comments to be valid and very helpful. We have changed the slider for the bar chart to a drop down menu, which should make it much clear that only one year is to be selected.

##### Colour Schemes

There were also some comments regarding the colour schemes. In particular, one pair of reviewers commented that the same colours were used in the line chart and the bar chart, but the colours represented different things in each chart. We agree that this could be confusing, so we have used different colour schemes for the line and bar charts.

------------------------------------------------------------------------

Some other feedback we received but didn't implement because we found it less helpful:

1.  One group commented that it was hard to view cities one at a time using our app. Since the purpose of our app was to show differences across multiple cities, we did not feel that this was a serious problem.
2.  The other group commented that it was hard to distinguish the colours on the bar chart when "Homicide" or "Rape" was selected since the bars for those categories were relatively short. Here, we disagreed with our reviewers; we found the delineation of the categories to be clear. Moreover, we thought the plot highlighted the insight that rape and homicide generally make up a small proportion of total violent crime.

### Project Update and Design Improvements

Overall, the ojective for our app has not changed. We continue to work towards building an app that illustrates the differences in violent crime patterns accross cities. We have, however, made some changes to the design and to the user interface in addition to the changes we made addressing reviewer comments.

##### Cluttered Line Chart

Firstly, we noticed that when too many cities were added, the line chart became cluttered and hard to read. To address this, we decided to limit the number of cities users can select to six.

##### Overlapping Labels

Secondly, the city labels on the bar chart sometimes overlapped and became illegible. Limiting the number of cities did help address this problem as well, but when cities with long names were selected, the labels still overlapped. We decided to rotate the bar chart so that the bars run horizontally; doing so allowed the city names to each be displayed on a separate line.

##### Other Issues

This week, we also attempted to add a linked view feature, so that the year for the bar chart could be chosen by clicking a point on the line chart. However, this turned out to be more work than we expected and required major revisions to the server function that we were unable to complete. At this point, the app appears to be fully functional, so we consider the omission of this feature immaterial.
