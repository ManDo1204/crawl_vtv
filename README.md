"# Interview assignment" 

This project includes:
1. vtvscrapy server: Crawl data from vtv news and save to database mongodb.
2. mongodb server: database to save data from vtvscrapy server.
3. vtvcrawlapi server: API to get data from database.
4. vtv_new: Mobile app that call to vtvcrawlapi to fetch data and show them.

Environment:
- Docker.

Demo:
- ./demo/demo.mkv

Test instruction:
1. Need:
    - Docker desktop
    - Android studio
    - flutter (make sure all needed environment are installed)
2. Steps:
    - Create network: docker network create manhdo-network
    - Change value of SOURCEROOT in .evn file (the directory must be the point to this project).
    - Open terminal, cd to this project and run: docker compose up -d
    - Open this project in vscode, open terminal, cd to "app/vtv_new". Open android device emulator. Run: flutter run
    - Launch app. 
