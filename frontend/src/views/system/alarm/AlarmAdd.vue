<template>
  <a-drawer
    title="新增报警日志"
    :maskClosable="false"
    width=650
    placement="right"
    :closable="false"
    @close="onClose"
    :visible="alarmAddVisiable"
    style="height: calc(100% - 55px);overflow: auto;padding-bottom: 53px;">
    <a-form :form="form">
      <a-form-item label='报警类型' v-bind="formItemLayout">
        <a-input v-model="alarm.type"
                 v-decorator="['type',
                   {rules: [
                    { required: true, message: '报警类型不能为空'},
                    { max: 20, message: '长度不能超过20个字符'}
                  ]}]"/>
      </a-form-item>
      <a-form-item label='经度' v-bind="formItemLayout">
        <a-input-number v-model="alarm.longitude" style="width: 100%"/>
      </a-form-item>
      <a-form-item label='纬度' v-bind="formItemLayout">
        <a-input-number v-model="alarm.latitude" style="width: 100%"/>
      </a-form-item>
      <a-form-item label='报警来源' v-bind="formItemLayout">
        <a-input v-model="alarm.source" style="width: 100%"/>
      </a-form-item>
    </a-form>
    <div class="drawer-bootom-button">
      <a-popconfirm title="确定放弃编辑？" @confirm="onClose" okText="确定" cancelText="取消">
        <a-button style="margin-right: .8rem">取消</a-button>
      </a-popconfirm>
      <a-button @click="handleSubmit" type="primary" :loading="loading">提交</a-button>
    </div>
  </a-drawer>
</template>
<script>
const formItemLayout = {
  labelCol: { span: 3 },
  wrapperCol: { span: 18 }
}
export default {
  name: 'AlarmAdd',
  props: {
    alarmAddVisiable: {
      default: false
    }
  },
  data () {
    return {
      loading: false,
      formItemLayout,
      form: this.$form.createForm(this),
      alarm: {},
      checkedKeys: [],
      expandedKeys: [],
      deptTreeData: [],
      deptTreeKeys: +new Date()
    }
  },
  methods: {
    reset () {
      this.loading = false
      this.deptTreeKeys = +new Date()
      this.expandedKeys = this.checkedKeys = []
      this.alarm = {}
      this.form.resetFields()
    },
    onClose () {
      this.reset()
      this.$emit('close')
    },
    handleCheck (checkedKeys) {
      this.checkedKeys = checkedKeys
    },
    handleExpand (expandedKeys) {
      this.expandedKeys = expandedKeys
    },
    handleSubmit () {
      this.form.validateFields((err, values) => {
        if (!err) {
          this.loading = true
          this.$post('alarm', {
            ...this.alarm
          }).then(() => {
            this.reset()
            this.$emit('success')
          }).catch(() => {
            this.loading = false
          })
        }
      })
    }
  }
}
</script>
