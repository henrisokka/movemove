(source, name) => {
    const outgoing = source[Relatable.getRelationsTargets](name);
    const incoming = source[Relatable.getIncomingRelationsSources](name);
    const objects = outgoing.concat(incoming);
    
    return objects;
}