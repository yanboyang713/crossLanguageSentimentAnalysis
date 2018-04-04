## numpy is used for creating fake data
import numpy as np
import matplotlib as mpl

## agg backend is used to create plot as a .png file
mpl.use('agg')

import matplotlib.pyplot as plt

def drawBoxPlots(title, data_to_plot, ax):

    # Create the boxplot
    bp = ax.boxplot(data_to_plot, patch_artist=True, showmeans=True)
    ## change outline color, fill color and linewidth of the boxes
    for box in bp['boxes']:
        # change outline color
        box.set( color='#7570b3', linewidth=2)
        # change fill color
        box.set( facecolor = '#1b9e77' )

    ## change color and linewidth of the whiskers
    for whisker in bp['whiskers']:
        whisker.set(color='#7570b3', linewidth=2)

    ## change color and linewidth of the caps
    for cap in bp['caps']:
        cap.set(color='#7570b3', linewidth=2)

    ## change color and linewidth of the medians
    for median in bp['medians']:
        median.set(color='#b2df8a', linewidth=2)

    ## change the style of fliers and their fill
    for flier in bp['fliers']:
        flier.set(marker='o', markerfacecolor='red', markersize=5, markeredgewidth=0.0, alpha=0.5)

    for mean in bp['means']:
        mean.set(marker = 's', markerfacecolor='red')

    ## Custom x-axis labels
    ax.set_xticklabels(['Ranking10', 'Ranking20', 'Ranking30', 'Ranking40', 'Ranking50'])
    ax.set_title(title)


## Create data
np.random.seed(10)
collectn_1 = np.random.normal(100, 10, 200)
collectn_2 = np.random.normal(80, 30, 200)
collectn_3 = np.random.normal(90, 20, 200)
collectn_4 = np.random.normal(70, 25, 200)
collectn_5 = np.random.normal(70, 25, 200)
## combine these different collections into a list
data_to_plot = [collectn_1, collectn_2, collectn_3, collectn_4, collectn_5]


#fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(9, 4))
# Create a figure instance
fig = plt.figure(1, figsize=(9, 6))
# Create an axes instance
ax = fig.add_subplot(111)
## add patch_artist=True option to ax.boxplot()
## to get fill color


drawBoxPlots("google", data_to_plot, ax)
# Save the figure
fig.savefig("output.png", bbox_inches='tight')
