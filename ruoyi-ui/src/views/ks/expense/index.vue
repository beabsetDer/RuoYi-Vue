<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="100px"
    >
      <el-form-item label="日常開支編號" prop="expenseId">
        <el-input
          v-model="queryParams.expenseId"
          placeholder="請輸入日常開支編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日常開支日期" prop="expenseDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.expenseDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="選擇日常開支日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="時間範圍">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="開始日期"
          end-placeholder="結束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="機司名稱" prop="expenseDriver">
        <el-input
          v-model="queryParams.expenseDriver"
          placeholder="請輸入機司名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="車牌" prop="expenseLicensePlateNumber">
        <el-input
          v-model="queryParams.expenseLicensePlateNumber"
          placeholder="請輸入車牌"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="土尾" prop="expense1">
        <el-input
          v-model="queryParams.expense1"
          placeholder="請輸入土尾"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="發泡" prop="expense2">
        <el-input
          v-model="queryParams.expense2"
          placeholder="請輸入發泡"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="洗車" prop="expense3">
        <el-input
          v-model="queryParams.expense3"
          placeholder="請輸入洗車"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="其他雜項" prop="expenseOther">
        <el-input
          v-model="queryParams.expenseOther"
          placeholder="請輸入其他雜項"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日常開支總額" prop="expenseTotal">
        <el-input
          v-model="queryParams.expenseTotal"
          placeholder="請輸入日常開支總額"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
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
          v-hasPermi="['ks:expense:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ks:expense:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ks:expense:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:expense:export']"
          >匯出Excel</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="expenseList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!--
      <el-table-column label="流水號" align="center" prop="id" />
      -->
      <el-table-column label="日常開支編號" align="center" prop="expenseId" />
      <el-table-column
        label="日常開支日期"
        align="center"
        prop="expenseDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expenseDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="機司名稱" align="center" prop="expenseDriver" />
      <el-table-column
        label="車牌"
        align="center"
        prop="expenseLicensePlateNumber"
      />
      <el-table-column label="土尾" align="center" prop="expense1" />
      <el-table-column label="發泡" align="center" prop="expense2" />
      <el-table-column label="洗車" align="center" prop="expense3" />
      <el-table-column label="其他雜項" align="center" prop="expenseOther" />
      <el-table-column
        label="日常開支總額"
        align="center"
        prop="expenseTotal"
      />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ks:expense:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:expense:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改日常開支表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="日常開支編號" prop="expenseId">
          <el-input
            v-model="form.expenseId"
            style="width: 220px"
            maxlength="12"
            :disabled="true"
            placeholder="日常開支編號"
            @input="keyInCheckOrderId(form.expenseId)"
          >
            <!-- 指定前墜 -->
            <template slot="prepend">OHD -</template>
          </el-input>
        </el-form-item>
        <el-form-item label="日常開支日期" prop="expenseDate">
          <el-date-picker
            clearable
            size="small"
            v-model="form.expenseDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選擇日常開支日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="機司名稱" prop="expenseDriver">
          <!--
          <el-input v-model="form.expenseDriver" placeholder="請輸入機司名稱" />
          -->
          <el-select
            clearable
            v-model="form.expenseDriver"
            placeholder="請選擇機司名稱"
            filterable
          >
            <el-option
              v-for="driver in userList"
              :key="driver.employeeId"
              :label="driver.employeeId + ' ' + driver.name"
              :value="driver.name"
              >{{ driver.employeeId }} {{ driver.name }}</el-option
            >
          </el-select>
        </el-form-item>
        <el-form-item label="車牌" prop="expenseLicensePlateNumber">
          <!--<el-input v-model="form.expenseLicensePlateNumber" placeholder="請輸入車牌" />-->

          <el-select
            clearable
            v-model="form.expenseLicensePlateNumber"
            placeholder="請選擇車牌"
            filterable
          >
            <el-option
              v-for="car in carList"
              :key="car.licensePlateNumber"
              :value="car.licensePlateNumber"
              >{{ car.licensePlateNumber }}</el-option
            >
          </el-select>
        </el-form-item>
        <el-form-item label="土尾" prop="expense1">
          <el-input-number
            :max="5000"
            type="number"
            v-model="form.expense1"
            placeholder="請輸入土尾價格(無法超過5000)"
            style="width: 220px"
            @change="countPrice"
          />
        </el-form-item>
        <el-form-item label="發泡" prop="expense2">
          <el-input-number
            :max="2000"
            type="number"
            v-model="form.expense2"
            placeholder="請輸入發泡價格(無法超過2000)"
            style="width: 220px"
            @change="countPrice"
          />
        </el-form-item>
        <el-form-item label="洗車" prop="expense3">
          <el-input-number
            :max="2000"
            type="number"
            v-model="form.expense3"
            placeholder="請輸入洗車價格(無法超過2000)"
            style="width: 220px"
            @change="countPrice"
          />
        </el-form-item>
        <el-form-item label="其他雜項" prop="expenseOther">
          <el-input-number
            :max="2000"
            type="number"
            v-model="form.expenseOther"
            placeholder="請輸入其他雜項(無法超過2000)"
            style="width: 220px"
            @change="countPrice"
          />
        </el-form-item>
        <el-form-item label="日常開支總額" prop="expenseTotal">
          <el-input
            v-model="form.expenseTotal"
            placeholder="自動加總"
            :disabled="true"
            style="width: 220px"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">確 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listExpense,
  getExpense,
  delExpense,
  addExpense,
  updateExpense,
} from "@/api/ks/expense";
import { listUser } from "@/api/ks/employee";
import { listCarid } from "@/api/ks/car";

export default {
  name: "Expense",
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
      // 日常開支表單表格数据
      expenseList: [],
      dateRange: [],
      userList: [],
      carList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        expenseId: null,
        expenseDate: null,
        expenseDriver: null,
        expenseLicensePlateNumber: null,
        expense1: null,
        expense2: null,
        expense3: null,
        expenseOther: null,
        expenseTotal: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        expenseId: [
          { required: true, message: "日常開支編號不能为空", trigger: "blur" },
        ],
        expenseDriver: [
          { required: true, message: "機司名稱不能为空", trigger: "blur" },
        ],
        expenseLicensePlateNumber: [
          { required: true, message: "車牌不能为空", trigger: "blur" },
        ],
        expense1: [
          { required: true, message: "土尾不能为空", trigger: "blur" },
        ],
        expense2: [
          { required: true, message: "發泡不能为空", trigger: "blur" },
        ],
        expense3: [
          { required: true, message: "洗車不能为空", trigger: "blur" },
        ],
        expenseOther: [
          { required: true, message: "其他雜項不能为空", trigger: "blur" },
        ],
        expenseTotal: [
          { required: true, message: "日常開支總額不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getUser();
    this.getCars();
  },
  methods: {
    // 計算油價錢
    countPrice() {
      let sumPrice =
        this.form.expense1 +
        this.form.expense2 +
        this.form.expense3 +
        this.form.expenseOther;
      console.log(sumPrice);
      // 只保留到小數點2位數 不四捨五入
      let tempVal = parseFloat(sumPrice).toFixed(3);
      let realVal = tempVal.substring(0, tempVal.length - 1);
      this.form.expenseTotal = realVal;
    },
    // 輸入表單編號時候加的判斷
    keyInCheckOrderId(value) {
      if (value != null) {
        value = value.replace(/[^\d]/g, ""); // 只能輸入數字
        this.form.expenseId = parseInt(value); // 注意這裡是string，你要數字類型記得自己轉一下
      }
    },
    getUser() {
      listUser().then((response) => {
        console.info(response);
        this.userList = response;
      });
    },
    getCars() {
      listCarid().then((response) => {
        console.info(response);
        this.carList = response;
      });
    },
    /** 查询日常開支表單列表 */
    getList() {
      this.loading = true;
      listExpense(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.expenseList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
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
        expenseId: null,
        expenseDate: null,
        expenseDriver: null,
        expenseLicensePlateNumber: null,
        expense1: null,
        expense2: null,
        expense3: null,
        expenseOther: null,
        expenseTotal: null,
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
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    getdate() {
      var now = new Date(),
        y = now.getFullYear(),
        m = ("0" + (now.getMonth() + 1)).slice(-2),
        d = ("0" + now.getDate()).slice(-2);
      var zz = y + m + d + now.toTimeString().substr(0, 8).replace(/:/g, "");
      zz = zz.slice(2, zz.length);
      return zz;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加日常開支表單";

      // 新增之後給表單的默認值
      // 8000年後失效 因為這個是只要數字的部分 (?)
      // 參考: https://stackoverflow.com/questions/25159330/how-to-convert-an-iso-date-to-the-date-format-yyyy-mm-dd
      // 台北時間+8小時
      this.form.expenseDate = new Date(+new Date() + 8 * 3600 * 1000)
        .toISOString()
        .slice(0, 10);
      // 時間戳記
      this.form.expenseId = this.getdate();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getExpense(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改日常開支表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateExpense(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addExpense(this.form).then((response) => {
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
        .confirm('是否确认删除日常開支表單编号为"' + ids + '"的数据项？')
        .then(function () {
          return delExpense(ids);
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
        "ks/expense/export",
        {
          ...this.queryParams,
        },
        `expense_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
