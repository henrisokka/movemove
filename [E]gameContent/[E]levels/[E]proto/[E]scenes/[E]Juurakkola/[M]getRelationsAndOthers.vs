(source, name) => {
    const incoming = source[Relatable.getIncomingRelations](name);
    const outgoing = source[Relatable.getRelations](name);
    const allRelations = incoming.concat(outgoing);
    
    const othersIn = source[Relatable.getIncomingRelationsSources](name);
    const othersOut = source[Relatable.getRelations](name);
    const allOthers = othersIn.concat(othersOut);
    
    const toReturn = {relations: allRelations, others: allOthers}
    console.log("GET RELATIONS AND OTHERS: ", toReturn);
    return toReturn;
}