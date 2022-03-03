<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="員工編號" prop="employeeId">
        <el-input
          v-model="queryParams.employeeId"
          placeholder="请输入員工編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="員工姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入員工姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="綽號" prop="aka">
        <el-input
          v-model="queryParams.aka"
          placeholder="请输入綽號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手機" prop="phoneNumber">
        <el-input
          v-model="queryParams.phoneNumber"
          placeholder="请输入手機"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="身分證" prop="idCard">
        <el-input
          v-model="queryParams.idCard"
          placeholder="请输入身分證"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓別" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择姓別" clearable size="small">
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="家電" prop="homeTelephoneNumber">
        <el-input
          v-model="queryParams.homeTelephoneNumber"
          placeholder="请输入家電"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="住址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入住址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="隸屬公司" prop="company">
        <el-input
          v-model="queryParams.company"
          placeholder="请输入隸屬公司"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="職稱" prop="staffPositions">
        <el-input
          v-model="queryParams.staffPositions"
          placeholder="请输入職稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入職日期" prop="entryDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.entryDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择入職日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="離職日期" prop="resignationDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.resignationDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择離職日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="離職原因" prop="reasonForLeaving">
        <el-input
          v-model="queryParams.reasonForLeaving"
          placeholder="请输入離職原因"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ks:employee:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ks:employee:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ks:employee:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:employee:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="employeeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="流水號" align="center" prop="id" />
      <el-table-column label="員工編號" align="center" prop="employeeId" />

      <el-table-column label="員工姓名" align="center" prop="name" />

      <el-table-column label="綽號" align="center" prop="aka" />
      <el-table-column label="手機" align="center" prop="phoneNumber" width="110" />
      <el-table-column label="身分證" align="center" prop="idCard" width="110" />

      <el-table-column label="姓別" align="center" prop="sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex" />
        </template>
      </el-table-column>

      <el-table-column label="家電" align="center" prop="homeTelephoneNumber" width="110" />
      <el-table-column label="住址" align="center" prop="address" width="200" />
      <el-table-column label="隸屬公司" align="center" prop="company" width="150" />
      <el-table-column label="職稱" align="center" prop="staffPositions" />
      <el-table-column label="入職日期" align="center" prop="entryDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.entryDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="離職日期" align="center" prop="resignationDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.resignationDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="離職原因" align="center" prop="reasonForLeaving" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ks:employee:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:employee:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改員工表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="員工編號" prop="employeeId">
          <el-input v-model="form.employeeId" placeholder="请输入員工編號" />
        </el-form-item>
        <el-form-item label="員工姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入員工姓名" />
        </el-form-item>
        <el-form-item label="綽號" prop="aka">
          <el-input v-model="form.aka" placeholder="请输入綽號" />
        </el-form-item>
        <el-form-item label="手機" prop="phoneNumber">
          <el-input v-model="form.phoneNumber" placeholder="请输入手機" />
        </el-form-item>
        <el-form-item label="身分證" prop="idCard">
          <el-input v-model="form.idCard" placeholder="请输入身分證" />
        </el-form-item>
        <el-form-item label="姓別" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择姓別">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="家電" prop="homeTelephoneNumber">
          <el-input v-model="form.homeTelephoneNumber" placeholder="请输入家電" />
        </el-form-item>
        <el-form-item label="住址" prop="address">
          <el-input v-model="form.address" placeholder="请输入住址" />
        </el-form-item>
        <el-form-item label="隸屬公司" prop="company">
          <el-input v-model="form.company" placeholder="请输入隸屬公司" />
        </el-form-item>
        <el-form-item label="職稱" prop="staffPositions">
          <el-input v-model="form.staffPositions" placeholder="请输入職稱" />
        </el-form-item>
        <el-form-item label="入職日期" prop="entryDate">
          <el-date-picker
            clearable
            size="small"
            v-model="form.entryDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择入職日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="離職日期" prop="resignationDate">
          <el-date-picker
            clearable
            size="small"
            v-model="form.resignationDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择離職日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="離職原因" prop="reasonForLeaving">
          <el-input v-model="form.reasonForLeaving" placeholder="请输入離職原因" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listEmployee,
  getEmployee,
  delEmployee,
  addEmployee,
  updateEmployee
} from "@/api/ks/employee";

export default {
  name: "Employee",
  dicts: ["sys_user_sex"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 員工表單表格数据
      employeeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        employeeId: null,
        name: null,
        aka: null,
        phoneNumber: null,
        idCard: null,
        sex: null,
        homeTelephoneNumber: null,
        address: null,
        company: null,
        staffPositions: null,
        entryDate: null,
        resignationDate: null,
        reasonForLeaving: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        employeeId: [
          { required: true, message: "員工編號不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询員工表單列表 */
    getList() {
      this.loading = true;
      listEmployee(this.queryParams).then(response => {
        this.employeeList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        employeeId: null,
        name: null,
        aka: null,
        phoneNumber: null,
        idCard: null,
        sex: null,
        homeTelephoneNumber: null,
        address: null,
        company: null,
        staffPositions: null,
        entryDate: null,
        resignationDate: null,
        reasonForLeaving: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加員工表單";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getEmployee(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改員工表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateEmployee(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEmployee(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除員工表單编号为"' + ids + '"的数据项？')
        .then(function() {
          return delEmployee(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "ks/employee/export",
        {
          ...this.queryParams
        },
        `employee_${new Date().getTime()}.xlsx`
      );
    }
  }
};
</script>
