## How to run

### 1. Clone repository
2. Run installation.sh script
    2.1. Give permissions chmod u+x installation.sh
    2.2. Run it: bash installation.sh
3. Allow access to Nginx thourgh firewall using: sudo ufw allow 'Nginx HTTP' 
4. If you want to check NGINX status, run: systemctl status nginx
5. Go to node-app folder and build it: npm run build
5. Run node app as pm2 service in same path: pm2 serve build 3000