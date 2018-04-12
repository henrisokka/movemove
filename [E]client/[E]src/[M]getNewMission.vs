() => {
    Promise.resolve().then(() => {
        console.log("getNewMission.vs");
        console.log("to be owner: ", this.data.stats);
        const newMission = new this.data.serverData.protos.mission({owner: this.data.stats});
        
        console.log("newMission: ", newMission);
        console.log(newMission[Resource.owner][Valaa.name]);
        newMission.stars = Math.round(Math.random() * 5);
        newMission.moons = Math.round(Math.random() * 5);
        newMission.planets = Math.round(Math.random() * 5);
        console.log("getNewMission: ", this.data.stats[Valaa.name]);
        Promise.resolve().then(() => {
            console.log("getNewMission PROMISE PROMISE PROMISE");
            this.data.activeMission = newMission;    
        });
    });
}