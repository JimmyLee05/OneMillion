func mynt(mynt: Mynt, didUpdateAlarmState isAlarm: Bool) {
        if isAlarm {
            homeListView?.getCell(with: mynt.sn)?.startAlarm()
        } else {
            homeListView?.getCell(with: mynt.sn)?.stopAlarm()
        }
    }

func mynt(mynt: Mynt, didUpdateAlarmState isAlarm: Bool) {
        if isAlarm {
            homeListView?.getCell(with: mynt.sn)?.startAlarm()
        } else {
            homeListView?.getCell(with: mynt.sn)?.stopAlarm()
        }
}