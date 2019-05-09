package cc.mrbird.febs.system.service.impl;

import cc.mrbird.febs.common.domain.QueryRequest;
import cc.mrbird.febs.common.utils.SortUtil;
import cc.mrbird.febs.system.dao.AlarmMapper;
import cc.mrbird.febs.system.domain.Alarm;
import cc.mrbird.febs.system.service.AlarmService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Slf4j
@Service("alarmService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class AlarmServiceImpl extends ServiceImpl<AlarmMapper, Alarm> implements AlarmService {
    @Override
    public void createAlarm(Alarm alarm) {
        this.save(alarm);
    }


    @Override
    public IPage<Alarm> findAlarmDetail(Alarm alarm, QueryRequest queryRequest) {
        try {
            LambdaQueryWrapper<Alarm> queryWrapper = new LambdaQueryWrapper<>();
            Page<Alarm> page = new Page<>();
            SortUtil.handlePageSort(queryRequest, page, true);
            return this.page(page,queryWrapper);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void deleteAlarms(String[] alarmIds) throws Exception {
        List<String> list = Arrays.asList(alarmIds);
        this.baseMapper.deleteBatchIds(list);
    }

    @Override
    public void updateAlarm(Alarm alarm) {
        this.baseMapper.updateById(alarm);
    }
}
