import { ConeOrientationEnum } from "../enums/ConeOrientationEnum";
import { DriveBaseTypeEnum } from "../enums/DriveBaseTypeEnum";
import { DriverExperienceInfoEnum } from "../enums/DriverExperienceInfoEnum";
import { GridLevelEnum } from "../enums/GridLevelEnum";
import { PickupEnum } from "../enums/PickupEnum";

export interface PitScouting {
    teamNumber: number;
    scoutName: string;
    driverExperience: DriverExperienceInfoEnum;
    weight: number;
    width: number;
    length: number;
    driveBaseType: DriveBaseTypeEnum;
    stable: boolean;
    hasSeparateIntake: boolean;
    canIntakeCone: boolean;
    canIntakeCube: boolean;
    pickupSpotsCube: PickupEnum;
    pickupSpotsCone: PickupEnum;
    intakeConeOrientations: ConeOrientationEnum[];
    gamePiecesNotes: string | null;
    gridScoringLevelsCube: GridLevelEnum[];
    gridScoringLevelsCone: GridLevelEnum[];
    scoringNotes: string | null;
    chargingStationNotes: string | null;
}
