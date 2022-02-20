<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="油單編號" prop="oilOrderId">
        <el-input
          v-model="queryParams.oilOrderId"
          placeholder="请输入油單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="加油日期" prop="oidDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.oidDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="選擇加油日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="機司名稱" prop="oilDriver">
        <el-input
          v-model="queryParams.oilDriver"
          placeholder="請輸入機司名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="油加車牌" prop="oilLicensePlateNumber">
        <el-input
          v-model="queryParams.oilLicensePlateNumber"
          placeholder="请输入油加車牌"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="油的價格" prop="oilPrice">
        <el-input
          v-model="queryParams.oilPrice"
          placeholder="请输入油的價格"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="加油公升" prop="oilLiters">
        <el-input
          v-model="queryParams.oilLiters"
          placeholder="请输入加油公升"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="油單總價格" prop="oilTotal">
        <el-input
          v-model="queryParams.oilTotal"
          placeholder="请输入油單總價格"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="加油站名稱" prop="gasStation">
        <el-input
          v-model="queryParams.gasStation"
          placeholder="请输入加油站名稱"
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
          v-hasPermi="['ks:order:add']"
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
          v-hasPermi="['ks:order:edit']"
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
          v-hasPermi="['ks:order:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="流水號" align="center" prop="id" />
      <el-table-column label="油單編號" align="center" prop="oilOrderId" />
      <el-table-column label="加油日期" align="center" prop="oidDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.oidDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="機司名稱" align="center" prop="oilDriver" />
      <el-table-column label="油加車牌" align="center" prop="oilLicensePlateNumber" />
      <el-table-column label="油的種類" align="center" prop="oilType" />
      <el-table-column label="油的價格" align="center" prop="oilPrice" />
      <el-table-column label="加油公升" align="center" prop="oilLiters" />
      <el-table-column label="油單總價格" align="center" prop="oilTotal" />
      <el-table-column label="加油站名稱" align="center" prop="gasStation" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ks:order:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:order:remove']"
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

    <!-- 添加或修改加油表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="油單編號" prop="oilOrderId">
          <el-input v-model="form.oilOrderId" placeholder="请输入油單編號" />
        </el-form-item>
        <el-form-item label="加油日期" prop="oidDate">
          <el-date-picker
            clearable
            size="small"
            v-model="form.oidDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择加油日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="機司名稱" prop="oilDriver">
          <!-- <el-input v-model="form.oilDriver" placeholder="請輸入機司名稱" />
          -->
          <el-select v-model="form.oilDriver" placeholder="請輸入機司名稱">
            <el-option
              v-for="item in form.empList"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="油加車牌" prop="oilLicensePlateNumber">
          <el-input v-model="form.oilLicensePlateNumber" placeholder="请输入油加車牌" />
        </el-form-item>
        <el-form-item label="油的價格" prop="oilPrice">
          <el-input v-model="form.oilPrice" placeholder="请输入油的價格" />
        </el-form-item>
        <el-form-item label="加油公升" prop="oilLiters">
          <el-input v-model="form.oilLiters" placeholder="请输入加油公升" />
        </el-form-item>
        <el-form-item label="油單總價格" prop="oilTotal">
          <el-input v-model="form.oilTotal" placeholder="请输入油單總價格" />
        </el-form-item>
        <el-form-item label="加油站名稱" prop="gasStation">
          <el-input v-model="form.gasStation" placeholder="请输入加油站名稱" />
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
  listOrder,
  getOrder,
  delOrder,
  addOrder,
  updateOrder
} from "@/api/ks/order";

export default {
  name: "Order",
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
      // 加油表單表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        oilOrderId: null,
        oidDate: null,
        oilDriver: null,
        oilLicensePlateNumber: null,
        oilType: null,
        oilPrice: null,
        oilLiters: null,
        oilTotal: null,
        gasStation: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        oilOrderId: [
          { required: true, message: "油單編號不能为空", trigger: "blur" }
        ],
        oilDriver: [
          { required: true, message: "機司名稱不能为空", trigger: "blur" }
        ],
        oilLicensePlateNumber: [
          { required: true, message: "油加車牌不能为空", trigger: "blur" }
        ],
        oilType: [
          { required: true, message: "油的種類不能为空", trigger: "change" }
        ],
        oilPrice: [
          { required: true, message: "油的價格不能为空", trigger: "blur" }
        ],
        oilLiters: [
          { required: true, message: "加油公升不能为空", trigger: "blur" }
        ],
        oilTotal: [
          { required: true, message: "油單總價格不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询加油表單列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
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
        oilOrderId: null,
        oidDate: null,
        oilDriver: null,
        oilLicensePlateNumber: null,
        oilType: null,
        oilPrice: null,
        oilLiters: null,
        oilTotal: null,
        gasStation: null
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
      this.title = "添加加油表單";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getOrder(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改加油表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
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
        .confirm('是否确认删除加油表單编号为"' + ids + '"的数据项？')
        .then(function() {
          return delOrder(ids);
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
        "ks/order/export",
        {
          ...this.queryParams
        },
        `order_${new Date().getTime()}.xlsx`
      );
    }
  }
};
</script>
