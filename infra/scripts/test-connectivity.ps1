# ================================
# TEST CONNECTIVITY
# ================================

Test-NetConnection -ComputerName "10.100.1.4" -Port 3389
Test-NetConnection -ComputerName "10.100.2.4" -Port 3389
Test-NetConnection -ComputerName "10.100.3.4" -Port 3389

ping 10.100.1.4
ping 10.100.2.4
ping 10.100.3.4

tracert 10.100.1.4
