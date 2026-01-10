flowchart LR

    %% HUB
    subgraph HUB["HUB VNet (10.100.0.0/16)"]
        A1["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/virtual-machines.svg' width='40'/> <br/> hub-appserver"]
        A2["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/active-directory-domain-services.svg' width='40'/> <br/> hub-dc"]
        A3["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/storage-accounts.svg' width='40'/> <br/> hub-backup"]
    end

    %% SPOKE ADMIN
    subgraph ADMIN["Spoke Admin (10.101.0.0/16)"]
        B1["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/virtual-machines.svg' width='40'/> <br/> admin-vm"]
        B2["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/virtual-machines.svg' width='40'/> <br/> jumpserver<br/>(Public IP)"]
    end

    %% SPOKE TRANSPORT
    subgraph TRANSPORT["Spoke Transport (10.102.0.0/16)"]
        C1["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/virtual-machines.svg' width='40'/> <br/> transport-vm"]
    end

    %% SPOKE FINANSE
    subgraph FINANSE["Spoke Finanse (10.103.0.0/16)"]
        D1["<img src='https://learn.microsoft.com/en-us/azure/architecture/icons/virtual-machines.svg' width='40'/> <br/> finanse-vm"]
    end

    %% PEERING
    HUB <--> ADMIN
    HUB <--> TRANSPORT
    HUB <--> FINANSE

    %% ACCESS FLOW
    B2 --> B1
    B1 --> A1
    B1 --> A2
    B1 --> A3

