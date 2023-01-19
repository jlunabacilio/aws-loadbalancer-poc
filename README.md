## How to run

#### 1. Clone repository
2. Run installation.sh script
    * Give permissions chmod u+x installation.sh
    * 2.2. Run it: bash installation.sh
3. Allow access to Nginx thourgh firewall using: `sudo ufw allow 'Nginx HTTP'` 
4. If you want to check NGINX status, run: `systemctl status nginx`
5. Go to node-app folder and build it: `npm run build`
5. Run node app as pm2 service in same path: `pm2 serve build 3000`
6. If need to keep your service up every time you start your machine, you can run: `pm2 startup`. 
    * After that, you need to paste next command: `sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu`
    * Save your configuration: `pm2 save`
7. Setup your app to nginx through reverse proxy.
    * You can comment "default" file in etc/sites-available/ or remove it.
    * Create a new file using `touch etc/sites-available/reverse-proxy` where you can edit `reverse-proxy` for name of you convenience.
    * Create a symlink between sites-available and sites-enabled folders with: `sudo ln -s /etc/nginx/sites-available/reverse-proxy /etc/nginx/sites-enabled/`. NOTE that you need to add full paths or won't work.
    * There, add next lines to the file and save:
    ```
    server {

	location / {
		proxy_pass http://localhost:3000;
	}

    }
    ```
    * Run next command to verify you edit file correctly: `sudo nginx -t`
    * Restart nginx service: `sudo systemctl restart nginx`

### At this point we have application completly deployed.