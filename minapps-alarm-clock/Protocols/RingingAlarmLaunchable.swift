import UIKit
import CoreData

protocol RingingAlarmLaunchable: class
{
    func launchAlarm(_ alarm: AlarmEntity_CoreData)
}


extension RingingAlarmLaunchable where Self: UIViewController
{
    func launchAlarm(_ alarm: AlarmEntity_CoreData)
    {
        guard let ringingAlarmVC = storyboard?.instantiateViewController(withIdentifier: RingingAlarmViewController.STRYBRD_ID) as? RingingAlarmViewController else {return}
        
        ringingAlarmVC.setup(withAlarm: alarm)
        
        present(ringingAlarmVC, animated: true, completion: nil)
    }
}

