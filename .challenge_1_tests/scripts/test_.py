#pip install scipy
import networkx as nx
import random

G=nx.gnp_random_graph(10,0.5,directed=True)

DAG = nx.DiGraph([(u,v,{'weight':random.randint(-10,10)}) for (u,v) in G.edges() if u<v])

nx.is_directed_acyclic_graph(DAG)


# G = nx.gnp_random_graph(n, 0.5, directed=True)
# DAG = nx.DiGraph([(u, v,) for (u, v) in G.edges() if u < v])
# print(nx.is_directed_acyclic_graph(DAG)) # to check if the graph is DAG (though it will be a DAG)
A = nx.adjacency_matrix(DAG)
AM = A.toarray().tolist()  # 1 for outgoing edges
while(len(AM)!=n):
    AM = create_random_dag(n)

# to display the DAG in matplotlib uncomment these 2 line
nx.draw(DAG,with_labels = True)
plt.show()

return AM
