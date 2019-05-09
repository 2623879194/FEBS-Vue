package cc.mrbird.febs.system.service;

import cc.mrbird.febs.common.domain.QueryRequest;
import cc.mrbird.febs.system.domain.Alarm;
import cc.mrbird.febs.system.domain.Dept;
import cc.mrbird.febs.system.domain.Dict;
import cc.mrbird.febs.system.domain.User;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;


public interface AlarmService extends IService<Alarm> {

    void createAlarm(Alarm alarm);

    void deleteAlarms(String[] alarmIds) throws Exception;

    IPage<Alarm> findAlarmDetail(Alarm alarm, QueryRequest queryRequest);

    public void updateAlarm(Alarm alarm);

}
