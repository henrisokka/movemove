(target, name) => {
    if (target === this) {
        return;
    }
    
    console.log(1);
    
    const relations = this[Relatable.getRelations](name);
    const connection = relations.find((r) => {
       return r[Relation.target] === target;
    });
    
    console.log("connection: ", connection);
    if (connection === undefined || connection === null) {
        console.log(3);
        const newConnection = new Relation({
           name: name,
           owner: this,
           target: target,
        });
        if (name === "door") {
            newConnection.sourceX = 0;
            newConnection.sourceY = 0;
            newConnection.targetX = 0;
            newConnection.targetY = 0;
        } else if (name === "in") {
            newConnection.x = 0;
            newConnection.y = 0;
        }
        
    } else {
        Valaa.Resource.destroy(connection);
    }
    
    this.update += 1;
}