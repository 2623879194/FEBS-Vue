package cc.mrbird.febs.system.controller;

import cc.mrbird.febs.common.annotation.Log;
import cc.mrbird.febs.common.controller.BaseController;
import cc.mrbird.febs.common.domain.QueryRequest;
import cc.mrbird.febs.common.exception.FebsException;
import cc.mrbird.febs.common.utils.Uuid;
import cc.mrbird.febs.system.domain.Alarm;
import cc.mrbird.febs.system.domain.Dept;
import cc.mrbird.febs.system.domain.Dict;
import cc.mrbird.febs.system.service.AlarmService;
import cc.mrbird.febs.system.service.DeptService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Slf4j
@Validated
@RestController
@RequestMapping("alarm")
public class AlarmController extends BaseController {

    private String message;

    @Autowired
    private AlarmService alarmService;

    @GetMapping
    public Map<String, Object> roleList(QueryRequest queryRequest, Alarm alarm) {
        Map<String,Object> data = getDataTable(alarmService.findAlarmDetail(alarm, queryRequest));
        return data;
    }

    @Log("新增预警")
    @PostMapping()
    public void addAlarm(@Valid Alarm alarm) throws FebsException {
        try {
            String uuid = Uuid.getUUID();
            alarm.setTime(new Date());
            alarm.setUpdateTime(new Date());
            alarm.setCreateTime(new Date());
            alarm.setCode(uuid);
            alarm.setDataState((byte)1);
            this.alarmService.createAlarm(alarm);
        } catch (Exception e) {
            message = "新增预警信息失败";
            log.error(message, e);
            throw new FebsException(message);
        }
    }

    @Log("删除报警信息")
    @DeleteMapping("/{alarmIds}")
    public void deleteAlarm(@NotBlank(message = "{required}") @PathVariable String alarmIds) throws FebsException {
        try {
            String[] ids = alarmIds.split(StringPool.COMMA);
            this.alarmService.deleteAlarms(ids);
        } catch (Exception e) {
            message = "删除报警信息失败";
            log.error(message, e);
            throw new FebsException(message);
        }
    }

    @Log("修改报警信息")
    @PutMapping
    public void updateDict(@Valid Alarm alarm) throws FebsException {
        try {
            this.alarmService.updateAlarm(alarm);
        } catch (Exception e) {
            message = "修改报警信息失败";
            log.error(message, e);
            throw new FebsException(message);
        }
    }
}
