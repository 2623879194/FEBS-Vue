package cc.mrbird.febs.system.domain;

import cc.mrbird.febs.common.converter.TimeConverter;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("alarm_info")
@Excel("报警信息表")
public class Alarm implements Serializable {

    //自增id
    @TableId(value = "pk_id", type = IdType.AUTO)
    //@NotBlank(message = "{required}")
    private Long id;


    //报警信息唯一编码(guid)
    @TableField("pk_code")
    //@NotBlank(message = "{required}")
    @ExcelField(value = "报警编码")
    private String code;

    //报警类型
    @TableField("fd_alarm_type")
    @NotBlank(message = "{required}")
    @ExcelField(value = "报警类型")
    private String type;

    //报警时间
    @TableField("fd_alarm_time")
    //@NotBlank(message = "{required}")
    @ExcelField(value = "报警时间")
    private Date time;

    //经度
    @TableField("fd_longitude")
    @NotBlank(message = "{required}")
    @ExcelField(value = "经度")
    private String longitude;

    //维度
    @TableField("fd_latitude")
    @ExcelField(value = "纬度")
    @NotBlank(message = "{required}")
    private String latitude;

    //报警来源
    @TableField("fd_alarm_sources")
    @ExcelField(value = "报警来源")
    @NotBlank(message = "{required}")
    private String source;

    //数据状态
    @TableField("datastate")
    @ExcelField(value = "数据状态")
    //@NotBlank(message = "{required}")
    private byte dataState;

    //创建日期
    //@NotBlank(message = "{required}")
    @ExcelField(value = "创建时间", writeConverter = TimeConverter.class)
    private Date createTime;

    //更新日期
    //@NotBlank(message = "{required}")
    @ExcelField(value = "修改时间", writeConverter = TimeConverter.class)
    private Date updateTime;


}