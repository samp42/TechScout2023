import {ChargeStationAutoEnum} from "../enums/ChargeStationAutoEnum";
import {CycleTimestamp} from "./CycleTimestamp";
import {ChargeStationEnum} from "../enums/ChargeStationEnum";
import {ChargeStationOrderEnum} from "../enums/ChargeStationOrderEnum";
import {CardColorEnum} from "../enums/CardColorEnum";

export interface TeamScouting {
    practice: boolean;
    scoutName: string;
    teamNumber: number;
    matchNumber: number;
    mobility: boolean;
    chargeStationAuto: ChargeStationAutoEnum;
    conesAuto: number;
    cubesAuto: number;
    cycles: CycleTimestamp[];
    chargeStationEndgame: ChargeStationEnum;
    chargeStationOrder: ChargeStationOrderEnum;
    card: CardColorEnum;
}
