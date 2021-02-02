# #####################################
# XCE Singularity container
# #####################################

Get sudo on your system
	Ask your system administrator

Install Singularity
	Go to: https://singularity.lbl.gov/install-linux
	Follow the instructions there

Open the contianer in sandbox mode
	sudo /{path to singularity bin}/singularity shell --writable /{path to XCE container directory}/xce_container
	e.g. sudo /usr/local/bin/singularity shell --writable /playground/sing_scripts/xce_container/xce_container

Mount the diamond file system
	sshfs -o reconnect {your diamond fedid}@nx.diamond.ac.uk:/dls /dls
	And enter your password

Change directory to your visit
	cd /dls/labxchem/{year of your visit}/{visit id}/processing
	e.g. cd /dls/labxchem/data/2017/lb18145-17/processing

Open XChemExplorer
	/XChemExplorer/XChemExplorer_local.sh 
	


# ######################################
# Q&A
# ######################################

Why do I need to be a super-user? Doesn't that defeat the point of having a container?

	This can't be helped. 
	XCE requires that the Diamond Light Source disks be mounted in root, which requires sudo

Why do I need to open the container as a sandbox?

	XCE requires the ability to make changes in the file system, without this it will error.
	The container has its own psuedo-file system, but by default can only make changes to certain parts of it.
	Unfortunately these are not the parts XCE needs. So we need to tell it that everything is ok to write in
	A side effect of this is that any changes you make are PERSISTENT: usually desirable but potentially problomatic. 


# ######################################
# Debugging
# ######################################

I'm getting errors when I try to open XCE explorer
	
	"Read only file system"
		Make sure you've opened the contianer as a writable sandbov

	I rm'd something important
		Download a new container, unless you made lots of changes to the contianer enviroment (which you shouldn't) this will be less painful than trying to fix it

Submiting a PanDDA/refinement to the cluster thorugh XCE failed horribly and possibly crashed XCE
	
	Sorry, until we fix the backend there is not a lot you can do about this
	When you tell XCE to do something on the cluster it tries to use qsub, which A. is not installed in the container and B. even if it were only your computers FILE SYSTEM is linked to the Diamond cluster - for scurity reasons your computer itself isn't so there is no path of communication along which qsub could tell the cluster to run the job  
	In principal this is fixible by caching you user details and then quickly ssh'ing into diamond to run the command when you push the button in XCE, and if you really need this funcitonality let us know or try and implement the above fix (or something smarter if it occurs to you!) yourself

Using PHENIX functionality failed and possibly crashed XCE
	
	We didn't install PHENIX in the contianer, so you'll need to do this yourself, but fortunately this is pretty easy as ccp4 is already in there
	If you entered the container as a writable sandbox you can install this yourself as you normally would on a linux box
	Be warned though that you may need to change the path XCE looks for some PHENIX data along, and this has not been tested by us
	

	
