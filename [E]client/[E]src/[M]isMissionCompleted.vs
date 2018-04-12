() => {
    if (this.data.resources.stars >= this.data.activeMission.stars && this.data.resources.moons >= this.data.activeMission.moons && this.data.resources.planets >= this.data.activeMission.planets) {
        
        this.data.resources.stars -= this.data.activeMission.stars;
        this.data.resources.moons -= this.data.activeMission.moons;
        this.data.resources.planets -= this.data.activeMission.planets;
        this.data.resources.missionCounter += 1;
        
        return true;
    }
    
    return false;
}