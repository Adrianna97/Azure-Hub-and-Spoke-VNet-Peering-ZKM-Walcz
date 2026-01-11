# ⚙️ Realizacja projektu

- Utworzono centralną sieć VNet-Hub (10.100.0.0/16) z trzema podsieciami:
  - subnet-app (hub-appserver)
  - subnet-dc (hub-dc)
  - subnet-backup (hub-backup)

- Utworzono odrębne VNet-Spoke dla działów:
  - spoke-admin (10.101.0.0/16)
  - spoke-transport (10.102.0.0/16)
  - spoke-finanse (10.103.0.0/16)

- Skonfigurowano dwukierunkowy VNet Peering między hubem a każdym spoke  
- Wprowadzono NSG z regułami ograniczającymi ruch do wybranych portów  
- Skonfigurowano centralny DNS w hubie

