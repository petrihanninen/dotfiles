# Better Default MacOS Settings

# Helpers

# Set host
H=""
function host() {
  H=$1
}

# Write a value to settings
function w() {
  defaults write "com.apple.$H" "$@"
}

# Write an integer value
function i() {
  w $1 -int $2
}

# Write a float value
function f() {
  w $1 -float $2
}

# Write a boolean value
function b() {
  w $1 -bool $2
}



# Settings

host com.apple.dock
f autohide-delay 0
i autohide-time-modifier 0
b showhidden TRUE
killall Dock

host com.apple.screencapture
w type 'jpg'

host com.apple.AppStore
w AutoPlayVideoSetting 'off'
i InAppReviewEnabled 0

host com.apple.AppleMultitouchTrackpad
i ActuateDetents 1
i ActuationStrength 0
i Clicking 1
i DragLock 0
i Dragging 0
i FirstClickThreshold 2
i ForceSuppressed 0
i SecondClickThreshold 2
i TrackpadCornerSecondaryClick 0
i TrackpadFiveFingerPinchGesture 2
i TrackpadFourFingerHorizSwipeGesture 2
i TrackpadFourFingerPinchGesture 2
i TrackpadFourFingerVertSwipeGesture 2
i TrackpadHandResting 1
i TrackpadHorizScroll 1
i TrackpadMomentumScroll 1
i TrackpadPinch 1
i TrackpadRightClick 1
i TrackpadRotate 1
i TrackpadScroll 1
i TrackpadThreeFingerDrag 0
i TrackpadThreeFingerHorizSwipeGesture 2
i TrackpadThreeFingerTapGesture 0
i TrackpadThreeFingerVertSwipeGesture 2
i TrackpadTwoFingerDoubleTapGesture 1
i TrackpadTwoFingerFromRightEdgeSwipeGesture 3


