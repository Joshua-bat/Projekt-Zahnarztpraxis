<h1>Firewall Configuration</h1>

<h2>IPFire Configuration</h2>

<h3>Step 1 — Network Configuration Menu</h3>

<p>After booting IPFire you will see the <strong>Network Configuration Menu</strong>. The current configuration is shown at the top (<code>GREEN + RED</code>). Work through the menu from top to bottom:</p>

<img src="https://github.com/Joshua-bat/IHK-FISI-2026/blob/c7b3dbf9a7c59965819b73be4c42a707837a5c87/doc/images/IPFire_configuration.png" width="700" />

<h3>Step 2 — Type of Network Configuration</h3>

<p>Select <strong>Type of Network Configuration</strong> and confirm with <strong>OK</strong>.<br />
Choose the network topology that matches your setup. For a basic firewall setup, select <strong>GREEN + RED</strong>:</p>

<ul>
  <li><strong>GREEN</strong> — the internal (trusted) network. This is your LAN interface. All clients in your local network connect through this NIC.</li>
  <li><strong>RED</strong> — the external (untrusted) network. This is your WAN interface, connected to the internet or upstream router.</li>
</ul>

<h3>Step 3 — Network Card Assignment</h3>

<p>Select <strong>Network Card Assignment</strong> and confirm with <strong>OK</strong>.<br />
Here you assign which physical NIC gets which role:</p>

<ul>
  <li><strong>GREEN NIC</strong> — assign the network card that is connected to your internal switch / LAN clients</li>
  <li><strong>RED NIC</strong> — assign the network card that is connected to the internet / upstream router</li>
</ul>

<blockquote>
<strong>⚠️ Note:</strong> Make sure you assign the correct NIC to each zone. A wrong assignment means your firewall rules will not work as intended.
</blockquote>

<h3>Step 4 — Address Settings</h3>

<p>Select <strong>Address Settings</strong> and confirm with <strong>OK</strong>.<br />
Configure the IP addresses for each interface:</p>

<ul>
  <li><strong>GREEN (LAN)</strong> — set a static IP address for the internal interface, e.g. <code>192.168.1.254</code> with subnet mask <code>255.255.255.0</code>. This will be the default gateway for all your local clients.</li>
  <li><strong>RED (WAN)</strong> — depending on your ISP, choose either:
    <ul>
      <li><strong>DHCP</strong> — if your router or ISP assigns an IP automatically</li>
      <li><strong>Static</strong> — if you have a fixed external IP address</li>
    </ul>
  </li>
</ul>

<h3>Step 5 — Finish</h3>

<p>Once all three settings are configured, select <strong>Done</strong> to apply the network configuration.<br />
IPFire will save the settings and restart the network interfaces.</p>

<blockquote>
<strong>⚠️ Note:</strong> After finishing, make sure your client PC is in the same subnet as the GREEN interface (e.g. <code>192.168.1.x</code>) to reach the IPFire web interface at <code>https://192.168.1.254:444</code>.
</blockquote>


<h2>Firewall Rules</h2>
<p>Open the IPFire web interface and navigate to <strong>Firewall &gt; Firewall Rules</strong>. To create a new rule, fill in the following sections:</p>

<ul>
  <li><strong>Source</strong> — select the origin of the traffic, e.g. <code>GREEN (192.168.1.0/24)</code> for all internal LAN clients</li>
  <li><strong>NAT</strong> — enable <strong>Network Address Translation (NAT)</strong> if the source IP should be masqueraded when leaving the firewall</li>
  <li><strong>Destination</strong> — select where the traffic should go, e.g. <code>RED</code> for outbound internet traffic</li>
  <li><strong>Protocol</strong> — choose the protocol to match, e.g. <code>All</code>, <code>TCP</code>, <code>UDP</code> or <code>ICMP</code></li>
  <li><strong>Action</strong> — choose what the firewall does with matching traffic:
    <ul>
      <li><strong>ACCEPT</strong> — allow the traffic through</li>
      <li><strong>DROP</strong> — silently discard the traffic</li>
      <li><strong>REJECT</strong> — discard the traffic and send an error back to the sender</li>
    </ul>
  </li>
</ul>

<img src="https://github.com/Joshua-bat/IHK-FISI-2026/blob/c7b3dbf9a7c59965819b73be4c42a707837a5c87/doc/images/Firewall_rules.png" width="700" />

<p>My rules are Pretty simple, we block everything under the Firewalloption/Forward then we allow HTTP.HTTPS,NTP,ICMP</p>

<img src="https://github.com/Joshua-bat/IHK-FISI-2026/blob/c7b3dbf9a7c59965819b73be4c42a707837a5c87/doc/images/Firewall_rules.png" width="700" />



