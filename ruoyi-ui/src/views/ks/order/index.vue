<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="100px"
    >
      <el-form-item label="測試用" prop="oilkkkkkk">
        <el-input
          v-model="queryParams.oilkkkkkk"
          placeholder="請輸入測試用"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="油單編號" prop="oilOrderId">
        <el-input
          v-model="queryParams.oilOrderId"
          placeholder="請輸入油單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="加油日期" prop="oilDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.oilDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="選擇加油日期"
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

      <el-form-item label="機司名稱" prop="oilDriver">
        <el-select
          clearable
          v-model="queryParams.oilDriver"
          placeholder="請選擇機司名稱"
          size="small"
        >
          <el-option
            v-for="item in userList"
            :key="item.employeeId"
            :value="item.name"
            >{{ item.name }}</el-option
          >
        </el-select>
      </el-form-item>
      <el-form-item label="車牌" prop="oilLicensePlateNumber">
        <!--  <el-input
          v-model="queryParams.oilLicensePlateNumber"
          placeholder="請輸入油加車牌"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->
        <el-select
          clearable
          v-model="queryParams.oilLicensePlateNumber"
          placeholder="請選擇車牌"
          size="small"
        >
          <el-option
            v-for="car in carList"
            :key="car.licensePlateNumber"
            :value="car.licensePlateNumber"
            >{{ car.licensePlateNumber }}</el-option
          >
        </el-select>
      </el-form-item>

      <el-form-item label="油的種類" prop="oilType">
        <!-- 
        <el-input
          v-model="queryParams.oilType"
          placeholder="请输入油的種類"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->

        <el-select v-model="queryParams.oilType" placeholder="油的種類">
          <el-option
            v-for="oilType in oilTypeList"
            :key="oilType.id"
            :value="oilType.value"
            >{{ oilType.label }}</el-option
          >
        </el-select>
      </el-form-item>

      <el-form-item label="油的價格" prop="oilPrice">
        <el-input
          v-model="queryParams.oilPrice"
          placeholder="請輸入油的價格"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="加油公升" prop="oilLiters">
        <el-input
          v-model="queryParams.oilLiters"
          placeholder="請輸入加油公升"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="價格折扣" prop="oilDiscount">
        <el-input
          v-model="queryParams.oilDiscount"
          placeholder="请输入價格折扣"
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
        <!--
        <el-input
          v-model="queryParams.gasStation"
          placeholder="请输入加油站名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->
        <el-select v-model="queryParams.gasStation" placeholder="請選擇加油站">
          <el-option
            v-for="gasStation in gasStationList"
            :key="gasStation.id"
            :value="gasStation.value"
            >{{ gasStation.label }}</el-option
          >
        </el-select>
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
          v-hasPermi="['ks:order:add']"
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
          v-hasPermi="['ks:order:edit']"
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
          v-hasPermi="['ks:order:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:order:export']"
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
      :data="orderList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!--
      <el-table-column label="流水號" align="center" prop="id" />
      -->
      <el-table-column label="油單編號" align="center" prop="oilOrderId" />
      <el-table-column
        label="加油日期"
        align="center"
        prop="oilDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.oilDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="機司名稱" align="center" prop="oilDriver" />
      <el-table-column
        label="油加車牌"
        align="center"
        prop="oilLicensePlateNumber"
      />
      <el-table-column label="油的種類" align="center" prop="oilType" />
      <el-table-column label="油的價格" align="center" prop="oilPrice" />
      <el-table-column label="加油公升" align="center" prop="oilLiters" />
      <el-table-column label="價格折扣" align="center" prop="oilDiscount" />
      <el-table-column label="油單總價格" align="center" prop="oilTotal" />
      <el-table-column label="加油站名稱" align="center" prop="gasStation" />
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
            v-hasPermi="['ks:order:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:order:remove']"
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

    <!-- 添加或修改加油表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="油單編號" prop="oilOrderId">
          <el-input
            v-model="form.oilOrderId"
            placeholder="請輸入油單編號"
            style="width: 220px"
            maxlength="12"
            :disabled="true"
            @input="keyInCheckOrderId(form.oilOrderId)"
          >
            <!-- 指定前墜 -->
            <template slot="prepend">oil -</template>
          </el-input>
        </el-form-item>
        <el-form-item label="加油日期" prop="oilDate">
          <el-date-picker
            clearable
            v-model="form.oilDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選擇加油日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="機司名稱" prop="oilDriver">
          <!-- <el-input v-model="form.oilDriver" placeholder="請輸入機司名稱" />
          -->
          <el-select
            clearable
            v-model="form.oilDriver"
            placeholder="請選擇機司名稱"
            filterable
          >
            <el-option
              v-for="item in userList"
              :key="item.employeeId"
              :label="item.employeeId + ' ' + item.name"
              :value="item.name"
              >{{ item.employeeId }} {{ item.name }}</el-option
            >
          </el-select>
        </el-form-item>
        <el-form-item label="油加車牌" prop="oilLicensePlateNumber">
          <!--  <el-input v-model="form.oilLicensePlateNumber" placeholder="請選擇車牌" />-->
          <el-select
            clearable
            v-model="form.oilLicensePlateNumber"
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
        <el-form-item label="油的種類" prop="oilType">
          <!--  <el-input v-model="form.oilType" placeholder="请输入油的種類" />
          -->
          <el-select v-model="form.oilType" placeholder="油的種類">
            <el-option
              v-for="oilType in oilTypeList"
              :key="oilType.id"
              :value="oilType.value"
              >{{ oilType.label }}</el-option
            >
          </el-select>
        </el-form-item>
        <el-form-item label="油的價格" prop="oilPrice">
          <el-input-number
            v-model="form.oilPrice"
            placeholder="請輸入油的價格"
            :max="50"
            type="number"
            style="width: 220px"
            @change="countOil"
          />
        </el-form-item>
        <el-form-item label="加油公升" prop="oilLiters">
          <el-input-number
            v-model="form.oilLiters"
            placeholder="請輸入加油公升"
            :max="500"
            type="number"
            style="width: 220px"
            @change="countOil"
          />
        </el-form-item>
        <el-form-item label="價格折扣" prop="oilDiscount">
          <el-input-number
            v-model="form.oilDiscount"
            :max="1000"
            placeholder="請輸入價格折扣"
            style="width: 220px"
            @change="countOil"
          />
        </el-form-item>
        <el-form-item label="油單總價格" prop="oilTotal">
          <!-- :disabled 少了: 就報錯??-->
          <!-- el-input-number 同上.. -->
          <el-input
            v-model="form.oilTotal"
            placeholder="保留小數點2位"
            :disabled="true"
            style="width: 220px"
          >
            <!-- 指定前墜 -->
            <template slot="prepend">＄</template>
          </el-input>
        </el-form-item>
        <el-form-item label="加油站名稱" prop="gasStation">
          <!-- <el-input v-model="form.gasStation" placeholder="請選擇加油站" />
          -->
          <el-select v-model="form.gasStation" placeholder="請選擇加油站">
            <el-option
              v-for="gasStation in gasStationList"
              :key="gasStation.id"
              :value="gasStation.value"
              >{{ gasStation.label }}</el-option
            >
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">確 定</el-button>
        <el-button @click="cancel">取消</el-button>
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
  updateOrder,
} from "@/api/ks/order";
import { listUser } from "@/api/ks/employee";
import { listCarid } from "@/api/ks/car";

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
      dateRange: [],
      // 总条数
      total: 0,
      // 加油表單表格数据
      orderList: [],
      userList: [],
      carList: [],
      // 油的種類
      oilTypeList: [
        {
          id: 1,
          value: "超級柴油",
          label: "超級柴油",
        },
        {
          id: 2,
          value: "柴油",
          label: "柴油",
        },
        {
          id: 3,
          value: "98",
          label: "98",
        },
        {
          id: 4,
          value: "95",
          label: "95",
        },
        {
          id: 5,
          value: "92",
          label: "92",
        },
        {
          id: 6,
          value: "其他",
          label: "其他",
        },
      ],
      // 加油站名稱
      gasStationList: [
        {
          id: 1,
          value: "建興加油站",
          label: "建興加油站",
        },
        {
          id: 2,
          value: "申昌加油站",
          label: "申昌加油站",
        },
        {
          id: 3,
          value: "其他",
          label: "其他",
        },
      ],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        oilOrderId: null,
        oilDate: null,
        oilDriver: null,
        oilLicensePlateNumber: null,
        oilType: null,
        oilPrice: null,
        oilLiters: null,
        oilDiscount: null,
        oilTotal: null,
        gasStation: null,
        oilkkkkkk: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        oilOrderId: [
          { required: true, message: "油單編號不能為空", trigger: "blur" },
        ],
        oilDriver: [
          { required: true, message: "機司名稱不能為空", trigger: "blur" },
        ],
        oilLicensePlateNumber: [
          { required: true, message: "油加車牌不能為空", trigger: "blur" },
        ],
        oilType: [
          { required: true, message: "油的種類不能為空", trigger: "change" },
        ],
        oilPrice: [
          { required: true, message: "油的價格不能為空", trigger: "blur" },
        ],
        oilLiters: [
          { required: true, message: "加油公升不能為空", trigger: "blur" },
        ],
        oilTotal: [
          {
            required: true,
            message: "油單總價格不能為空",
            trigger: "blur",
          },
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
    // 輸入表單編號時候加的判斷
    keyInCheckOrderId(value) {
      if (value != null) {
        value = value.replace(/[^\d]/g, ""); // 只能輸入數字
        this.form.oilOrderId = parseInt(value); // 注意這裡是string，你要數字類型記得自己轉一下
        // console.log(this.form.oilOrderId);
      }
    },
    // 計算油價錢
    countOil() {
      //  console.log(this.form.oilPrice);
      //  console.log(this.form.oilLiters);
      let sumPrice =
        this.form.oilPrice * this.form.oilLiters - this.form.oilDiscount;
      console.log(sumPrice);
      // 只保留到小數點2位數 不四捨五入
      let tempVal = parseFloat(sumPrice).toFixed(3);
      let realVal = tempVal.substring(0, tempVal.length - 1);
      this.form.oilTotal = realVal;
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

    /** 查询加油表單列表 */
    getList() {
      this.loading = true;
      const arr = listOrder(
        this.addDateRange(this.queryParams, this.dateRange)
      ).then((response) => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      console.info("ZZZZ", this.queryParams);
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
        oilDate: null,
        oilDriver: null,
        oilLicensePlateNumber: null,
        oilType: null,
        oilPrice: null,
        oilLiters: null,
        oilDiscount: null,
        oilTotal: null,
        gasStation: null,
        oilkkkkkk:null,
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
      this.title = "新增加油表單";
      // 新增之後給表單的默認值
      // 8000年後失效 因為這個是只要數字的部分 (?)
      // 參考: https://stackoverflow.com/questions/25159330/how-to-convert-an-iso-date-to-the-date-format-yyyy-mm-dd
      // 台北時間+8小時
      this.form.oilDate = new Date(+new Date() + 8 * 3600 * 1000)
        .toISOString()
        .slice(0, 10);
      this.form.gasStation = "建興加油站";
      this.form.oilType = "超級柴油";
      // 時間戳記
      this.form.oilOrderId = this.getdate();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getOrder(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改加油表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateOrder(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then((response) => {
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
        .then(function () {
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
          ...this.queryParams,
        },
        `order_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
