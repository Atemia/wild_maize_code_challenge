#!/usr/bin/env python

# pip install networkx
# pip install matplotlib
# pip install python-graph-core # visualization of the the py-graph


import networkx as nx           #
import matplotlib.pyplot as plt        #

# Creating an empty graph frame work

Graph = nx.DiGraph() 

# Create the nodes for the graph (building on the graph)
Graph.add_edges_from([("ROOT","A"),("A","B"),("A","C"),("C","B")]) # create the nodes

# Displaying the graph
position = nx.spring_layout(Graph) # postioning the nodes
nx.draw_networkx_edges(Graph, position, edgelist=Graph.edges(), edge_color="black") # Draw the edges
nx.draw_networkx_nodes(Graph, position, node_color="blue") # Draw the nodes
nx.draw_networkx_labels(Graph, position)
plt.savefig("../results/DAG.png", format="PNG")
plt.show() #plotting the graph