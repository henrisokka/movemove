(source, target, name) => {
    let areConnected = false;
    const outgoing = source[Relatable.getRelations](name);
    const incoming = source[Relatable.getIncomingRelations](name);
    const relations = incoming.concat(outgoing);
    relations.forEach((r) => {
        if (r[Relation.target] === target) {
            areConnected = true;
        }
    })
    
    return areConnected;
}