(source, name) => {
    const outgoing = source[Relatable.getRelations](name);
    const incoming = source[Relatable.getIncomingRelations](name);
    const relations = outgoing.concat(incoming);
    
    return relations;
}