# stim_TMR_MSL
Motor sequence learning (MSL) task adopted from the "stim" repo to conduct target memory reactivation (TMR) experiment using sound.
The starting point for the current repo is the branch "prakriti-task" created by Thibault Vlieghe by August 2022 (thibault.vlieghe@mcgill.ca)
More details about the source repo "stim", can be found on GitHub: https://github.com/labdoyon/stim.git

## Installation

1/5 Install Matlab; the current version was validated on Matlab R2023a

2/5 Install Statistics and Machine Learning Toolbox in Matlab. You can do that by
    going to the "Add-Ons" menu in MATLAB and selecting "Get Add-Ons." Search for the
    "Statistics and Machine Learning Toolbox" and install it.
 
3/5 Clone or download stim_TMR_MSL from github
	https://github.com/EllaGab/stim_TMR_MSL.git
	Don't move files around. Respect the structure of the github repository

4/5 Download and install Psychtoolbox
	http://psychtoolbox.org/download
	Note that you will need to install GStreamer as well

5/5 Add stim.m experiments/ stimuli/ analysis/ to MATLAB path (optional).
	Running stim.m will automatically add all the required files to the MATLAB path

## Auditory Stimuli

The volume levels for the sound are between 0 and 1, which indicate the proportion of the
volume levels of the active device. The device volume depends on:
	1) the equipment used for the experiment
	2) the master system volume on the system at the time of the experiment

Advice: For meaningful inferences about the volume levels, use the same equipment and
keep master system volume consistent throughout all phases of the experiment and
across all participants.

## GUI

Use the "Quit" button to close menus. This will ensure proper saving of the data
and releasing computational resources (e.g., memory, processing, etc.)

Press 'Escape' to interrupt the session.

Press '5' to start the task. This is the TTL key that is expected from the scanner
to start the scanning session.

If STIM crashed or was interrupted unexpectedly, the keyboard input to Matlab
may be disabled. To enable it, press CTRL+C. It is the same as ListenChar(0).

When using additional equipment, such as keypad or a second screen, connect everything before
statring the matlab. Otherwise, the equipment will not be correctly recognized.


## ADDITIONAL RESOURSES FOR PROGRAMMERS

Demos to start coding with Psychtoolbox are provided together with the Psychtoolbox
under PsychDemos directory.
More demos and tutorials can be found on https://peterscarfe.com/ptbtutorials.html

