# 🧱 Etapy techniczne

## 1. Utworzenie sieci VNet i podsieci  
- VNet-Hub z trzema podsieciami  
- VNet-Spoke dla każdego działu z własną adresacją

## 2. Utworzenie maszyn wirtualnych  
- VM w każdej podsieci (hub i spoke)  
- Jump Server w spoke-admin z Public IP

## 3. Konfiguracja NSG  
- NSG dla spoke: dostęp do RDP tylko do IP maszyn w hubie  
- NSG dla hub: dostęp z prywatnego IP jumpservera

## 4. Konfiguracja VNet Peering  
- Dwukierunkowe połączenia: hub-to-admin, admin-to-hub itd.

## 5. Testy połączeń  
- RDP z lokalnego komputera do jumpservera  
- Połączenia prywatne z jumpservera do VM w hubie  
- Ping i tracert między działami
