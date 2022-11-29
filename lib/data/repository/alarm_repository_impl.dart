import 'package:injectable/injectable.dart';
import 'package:my_pillow/data/data_source/alarm/local/alarm_local_data_source.dart';
import 'package:my_pillow/data/model/alarm/sleep_time_dto.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time.dart';
import 'package:my_pillow/domain/entities/alarm/snooze_time.dart';
import 'package:my_pillow/domain/repository/alarm_repository.dart';

@Singleton(as: AlarmRepository)
class AlarmRepositoryImpl extends AlarmRepository {
  final AlarmLocalDataSource _dataSource;

  AlarmRepositoryImpl(this._dataSource) {
    _fetchProps();
  }

  void _fetchProps() {
    remindToChange.add(_dataSource.remindToChange);
    bedtime.add(_dataSource.bedtime.toModel());
    wakeupTime.add(_dataSource.wakeupTime.toModel());
    remindToSleep.add(_dataSource.remindToSleep);
    alarmEnabled.add(_dataSource.alarmEnabled);
    vibrationEnabled.add(_dataSource.vibrationEnabled);
    alarmVolume.add(_dataSource.alarmVolume);
    snoozeTime.add(SnoozeTime.fromValue(_dataSource.snoozeTime));
  }

  @override
  void setRemindToChange(bool value) {
    remindToChange.add(value);
    _dataSource.remindToChange = value;
  }

  @override
  void setBedtime(SleepTime value) {
    bedtime.add(value);
    _dataSource.bedtime = SleepTimeMapper.fromModel(value);
  }

  @override
  void setWakeupTime(SleepTime value) {
    wakeupTime.add(value);
    _dataSource.wakeupTime = SleepTimeMapper.fromModel(value);
  }

  @override
  void setRemindToSleep(bool value) {
    remindToSleep.add(value);
    _dataSource.remindToSleep = value;
  }

  @override
  void setAlarmEnabled(bool value) {
    alarmEnabled.add(value);
    _dataSource.alarmEnabled = value;
  }

  @override
  void setAlarmVolume(double value) {
    alarmVolume.add(value);
    _dataSource.alarmVolume = value;
  }

  @override
  void setVibrationEnabled(bool value) {
    vibrationEnabled.add(value);
    _dataSource.vibrationEnabled = value;
  }

  @override
  void setSnoozeTime(SnoozeTime value) {
    snoozeTime.add(value);
    _dataSource.snoozeTime = value.value;
  }
}
