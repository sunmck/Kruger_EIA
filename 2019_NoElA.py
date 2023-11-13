
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.collections import PatchCollection


def nested_circles(data, labels=None, ax=None, textkw={}):
    ax = ax or plt.gca()
    data = np.array(data)
    R = np.sqrt(data/data.max())
    p = [plt.Rectangle((0, 0), r, r) for r in R[::-1]]

    ax.add_collection(PatchCollection(p, facecolor=colors, edgecolor='none'))

    ax.axis("off")
    ax.set_aspect("equal")
    ax.autoscale()

    if labels is not None:
        kw = dict(color="black", va="center", ha="right")
        kw.update(textkw)
        ax.text(-0.05, R[0]-0.02, labels[0], **kw)
        for i in range(1, len(R)):
            y_offset = (R[i]-R[i-1])/2
            ax.text(-0.05, R[i]-y_offset, labels[i], **kw)

    return p


data = [1.03, 1.98, 3.06, 3.70, 10.19, 79.08] # percentage values
labels = ["Tree Cover (broadleaved, deciduous, open) (1.03%)",
         "Herbaceous Cover / Tree and Shrubs (1.98%)",
         "Tree Cover (broadleved, deciduous, closed to open) (3.06%)",
         "Grassland (3.70%)",
         "Tree and Shrubs / Herbaceous Cover (10.19%)",
         "Shrubland (79.08%)"]
colors = ["#966400", "#8DA000", "#FFB432", "#00A000", "#BE9600",
            "#AAC800"]
patches = nested_circles(data, labels, textkw=dict(fontsize=4))

plt.title("Landcover Classes within the Rest of Kruger [%] in 2019", fontweight='bold')
plt.show()
