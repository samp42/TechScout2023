package enums

type DriveBaseType uint8

const (
	Tank DriveBaseType = iota
	Swerve
	Mecanum
	Other
)
