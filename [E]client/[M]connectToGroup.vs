(e) => {
    e.preventDefault();
    const groups = this.data.serverData.groups[Resource.unnamedOwnlings];
    console.log("Groups: ");
    console.log(groups);
    
    const group = groups.find((g) => {
        console.log("Login string of group: ", g.loginString);
        return g.loginString === Number(this.loginString);
    });
    
    console.log(group);
    
    if (group !== undefined) {
        console.log("inside if");
        Promise.resolve(group).then((group) => {
            console.log("Inside promise: ", this[Valaa.name]);
            group.methods.connect(this, this.nick); 
        });
        this.login = true;
    }
}