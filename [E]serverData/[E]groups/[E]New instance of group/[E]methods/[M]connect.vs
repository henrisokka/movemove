(client, nick) => {
    console.log("connect.vs");
    console.log("client: ", client[Valaa.name]);
    const group = this[Resource.owner];
    const statContainer = new Entity({owner: this.stats, name: nick});
    
    Promise.resolve(client, group).then((client, group) => {
        const rel = new Relation({owner: client, target: this[Resource.owner], name: "session"});
        rel.nick = nick;
        client.data.group = this[Resource.owner];
        client.data.stats = statContainer;
        console.log("client.data.stats: ", client.data.stats[Valaa.name]);
        client.src.getNewMission();
    });
}