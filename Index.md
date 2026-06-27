# Corda 5 Threat Model

Secure design and threat modelling requires scalability and the overall threat model is composed of sub-parts that are compatible in two ways:
* **Hierarchical** from the highest level of abstraction "Corda 5 Networks" to the specific "P2P key exchange algorithm"in a tree-like structure 
* **Scope of analysis horizontal division**, in line with what specific teams and working group are building and are responsible for

## TM Structure ##


- C5 Root TM
  - [C5 Cluster](threatModels/cluster.yaml)
    - Virtual Node Onboarding
    - CPI Packaging
    - E2E encryption
      - Key exchange algorithm
    - [HTTP gateway](build/HttpGateway.html)
    - Sandboxing
    - MGM
      - MGM onboarding
    - Cluster Infrastructure     


