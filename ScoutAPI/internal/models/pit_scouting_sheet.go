package models

import "ScoutAPI/internal/enums"

type PitScoutingSheet struct {
	TeamNumber uint8
	ScoutName  string

	// robot
	DriveType       enums.DriveBaseType
	RobotDimensions [2]uint8 // length, width

	// game pieces
	CanIntakeCone bool
	CanIntakeCube bool
	IntakeDetails string `bson:",omitempty"` // for example floor, human player, etc.

	// grid level
	LevelOne    bool
	LevelTwo    bool
	LevelThree  bool
	GridDetails string `bson:",omitempty"` // for example special alignment, etc.

	// autonomous
	AutoCubes uint8
	AutoCones uint8
	Dock      bool
	Engage    bool

	// endgame
	CanDock        bool
	CanEngage      bool
	EndgameDetails string `bson:",omitempty"` // for example can make space, must go first/last, etc.
}
