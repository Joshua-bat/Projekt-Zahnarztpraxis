<h1>Linux Backup Server Configuration</h1>
<p>
  This repository documents the configuration of my Linux backup server.
  I use <strong>Debian with a GUI</strong> (Graphical User Interface) for easier navigation,
  but all configuration is done via the shell/terminal.
</p>

<hr>

<h2>Folder Structure</h2>
<p>
  I created a specific folder structure to keep everything organized.
  You can see it in the image below.
</p>
<img src="https://github.com/Joshua-bat/IHK-FISI-2026/blob/c82c870324ce135d13024f563e7ae68b92d6643f/doc/images/Folder_Structure.png" alt="Folder Structure">
<p>
  To recreate the folder structure, I wrote a shell script that contains one command per folder:
  <br>
  📄 <a href="https://github.com/Joshua-bat/fisi-projekt-321-backup/blob/e6352937831545a2166c6d0e846d138d0a516ca4/Linux/create_folder.sh">create_folder.sh</a>
</p>

<hr>

<h2>Docker Files</h2>
<p>
  For every application I want to run, I create a <code>docker-compose.yaml</code> file.
</p>
<p>
  In the main folder <code>./Server</code> there is a <code>docker-compose.yaml</code> that starts all services at once.
  Each individual service also has its own <code>compose.yaml</code> inside its respective folder.
</p>
<p><strong>Steps to set it up:</strong></p>
<ol>
  <li>Right-click the <code>./Server</code> folder and select <strong>Open in Terminal</strong></li>
  <li>Create the main compose file: <code>nano docker-compose.yaml</code></li>
  <li>This opens a text editor in the terminal — write your configuration, save with <code>CTRL+O</code>, then exit with <code>CTRL+X</code></li>
  <li>Navigate into each service folder and repeat the process to create an individual <code>compose.yaml</code> for that service</li>
</ol>
<p>
  All compose files are stored in the <code>Docker</code> folder of this repository:
  <br>
  📁 <a href="https://github.com/Joshua-bat/fisi-projekt-321-backup/tree/aa6d2c0e792807f19745598b2baf8c5661b6eaa3/Docker">Docker Compose Files</a>
</p>
