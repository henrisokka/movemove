(providedTemplate) => {
	if (!providedTemplate) {
    	console.error("LocalPartition instancer did not receive the template entity to instance");
    	return null;
	}
 
    const randomId = Math.floor(Math.random() * 20000);
	const localUserPartitionId = this[Resource.createDerivedId](randomId);
	const partitionURI = Valaa.Partition.createPartitionURI("valaa-local:", localUserPartitionId);
	const alreadyActive = Valaa.Partition.tryPartitionConnection(partitionURI);
	if (alreadyActive) {
  	const localPartitionResource = Valaa.Resource.getActiveResource(localUserPartitionId);
  	return localPartitionResource;
	}
 
	const initializationProcess = Valaa.Partition.acquirePartitionConnection(partitionURI);
	return initializationProcess.then(connection => {
  	let localProject = Valaa.Resource.getActiveResource(localUserPartitionId);
  	if (!localProject) {
    	const ProjectTemplate = providedTemplate;
    	localProject = new ProjectTemplate({
      	id: localUserPartitionId,
      	owner: null,
      	partitionAuthorityURI: "valaa-local:",
      	name: ProjectTemplate[Valaa.name] + " [local instance]",
    	});
  	}
  	return localProject;
	});
};
