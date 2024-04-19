console.log('INIT DB')
db.createUser(
    {
        user: "manhdo",
        pwd: "manhdo",
        roles: [
            {
                role: "readWrite",
                db: "vtv_news_db_dev"
            }
        ]
    }
);
db = new Mongo().getDB("vtv_news_db_dev");
db.createCollection('thegioi_news', {capped:false});
