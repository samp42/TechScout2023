import {TeleopActionEnum} from "../enums/TeleopActionEnum";

export interface CycleTimestamp {
    timestamp: number;
    action: TeleopActionEnum;
}
