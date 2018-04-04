import numpy as np
import matplotlib.pyplot as plt

def bp(data):

    f = data

    # Create a figure instance
    fig = plt.figure(1, figsize=(9, 6))

    # Create an axes instance
    ax = fig.add_subplot(111)

    # Create the boxplot
    bp = ax.boxplot(f, patch_artist=True)


    ax.set_xticklabels(['DSCNN','IDSCNN'])
    ## add patch_artist=True option to ax.boxplot()
    ## to get fill color
    #bp = ax.boxplot(data_to_plotrue)

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
        flier.set(marker='o', color='#e7298a', alpha=0.5)
    ## Custom x-axis labels
    #ax.set_xticklabels(['Sample1', 'Sample2', 'SampleA3', 'Sample4'])
    ## Remove top axes and right axes ticks
    ax.get_xaxis().tick_bottom()
    ax.get_yaxis().tick_left()
    plt.title('DSCNN vs IDSCNN on C→A')
    plt.ylim(0.8,1.005)
    # Save the figure
    fig.savefig('bp.png', bbox_inches='tight',dpi=360)



np.random.seed(10)
data_array = np.random.normal(100, 10, 200)
bp(data_array)
