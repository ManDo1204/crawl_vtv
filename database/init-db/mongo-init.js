db.createUser(
    {
        user: "manhdo",
        pwd: "manhdo",
        roles: [
            {
                role: "readWrite",
                db: "manhdodb"
            }
        ]
    }
);
