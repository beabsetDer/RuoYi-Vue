<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="100px"
    >
      <el-form-item label="南下單編號" prop="downboundId">
        <el-input
          v-model="queryParams.downboundId"
          placeholder="请输入南下單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日期(南下單)" prop="downboundDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.downboundDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择日期(南下單)"
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
      <el-form-item label="司機名稱" prop="downboundDriver">
        <el-input
          v-model="queryParams.downboundDriver"
          placeholder="请输入司機名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="車牌號碼" prop="downboundLicensePlateNumber">
        <el-input
          v-model="queryParams.downboundLicensePlateNumber"
          placeholder="请输入車牌號碼"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司名稱" prop="downboundCompany">
        <el-input
          v-model="queryParams.downboundCompany"
          placeholder="请输入公司名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="起點" prop="downboundOutset">
        <el-input
          v-model="queryParams.downboundOutset"
          placeholder="请输入起點"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="堆場" prop="downboundYard">
        <el-input
          v-model="queryParams.downboundYard"
          placeholder="请输入堆場"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="現金" prop="downboundCash">
        <el-select v-model="queryParams.downboundCash" placeholder="请选择現金" clearable size="small">
          <el-option
            v-for="dict in dict.type.ks_cash"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="貨物名稱" prop="downboundGoods">
        <el-input
          v-model="queryParams.downboundGoods"
          placeholder="请输入貨物名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="貨物噸數" prop="downboundGoodsMt">
        <el-input
          v-model="queryParams.downboundGoodsMt"
          placeholder="请输入貨物噸數"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="貨物單價" prop="downboundGoodsPrice">
        <el-input
          v-model="queryParams.downboundGoodsPrice"
          placeholder="请输入貨物單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="此趟運費" prop="downboundTotal">
        <el-input
          v-model="queryParams.downboundTotal"
          placeholder="请输入此趟運費"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="此趟薪資" prop="downboundDriverPay">
        <el-input
          v-model="queryParams.downboundDriverPay"
          placeholder="请输入此趟薪資"
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
          v-hasPermi="['ks:downbound:add']"
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
          v-hasPermi="['ks:downbound:edit']"
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
          v-hasPermi="['ks:downbound:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:downbound:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="downboundList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="流水號" align="center" prop="id" />
      <el-table-column label="南下單編號" align="center" prop="downboundId" />
      <el-table-column label="日期(南下單)" align="center" prop="downboundDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.downboundDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="司機名稱" align="center" prop="downboundDriver" />
      <el-table-column label="車牌號碼" align="center" prop="downboundLicensePlateNumber" />
      <el-table-column label="公司名稱" align="center" prop="downboundCompany" />
      <el-table-column label="起點" align="center" prop="downboundOutset" />
      <el-table-column label="堆場" align="center" prop="downboundYard" />
      <el-table-column label="現金" align="center" prop="downboundCash">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.ks_cash" :value="scope.row.downboundCash" />
        </template>
      </el-table-column>
      <el-table-column label="貨物名稱" align="center" prop="downboundGoods" />
      <el-table-column label="貨物噸數" align="center" prop="downboundGoodsMt" />
      <el-table-column label="貨物單價" align="center" prop="downboundGoodsPrice" />
      <el-table-column label="此趟運費" align="center" prop="downboundTotal" />
      <el-table-column label="此趟薪資" align="center" prop="downboundDriverPay" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ks:downbound:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:downbound:remove']"
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

    <!-- 添加或修改南下表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="南下單編號" prop="downboundId">
          <el-input
            v-model="form.downboundId"
            style="width:220px"
            maxlength="8"
            placeholder="南下單編號"
            @input="keyInCheckOrderId(form.downboundId)"
          >
            <!-- 指定前墜 -->
            <template slot="prepend">south -</template>
          </el-input>
        </el-form-item>
        <el-form-item label="日期(南下)" prop="downboundDate">
          <el-date-picker
            clearable
            size="small"
            v-model="form.downboundDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择日期(南下單)"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="司機名稱" prop="downboundDriver">
          <!-- <el-input v-model="form.downboundDriver" placeholder="请输入司機名稱" /> -->

          <el-select clearable v-model="form.downboundDriver" placeholder="請選擇機司名稱">
            <el-option
              v-for="item in userList"
              :key="item.employeeId"
              :label="item.employeeId +' '+ item.name"
              :value="item.name"
            >{{item.employeeId}} {{item.name}}</el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="車牌號碼" prop="downboundLicensePlateNumber">
          <!-- <el-input v-model="form.downboundLicensePlateNumber" placeholder="请输入車牌號碼" /> -->

          <el-select clearable v-model="form.downboundLicensePlateNumber" placeholder="請選擇車牌">
            <el-option
              v-for="car in carList"
              :key="car.licensePlateNumber"
              :value="car.licensePlateNumber"
            >{{car.licensePlateNumber}}</el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="公司名稱" prop="downboundCompany">
          <!--   <el-input v-model="form.downboundCompany" placeholder="請輸入公司名稱" /> -->

          <el-select clearable v-model="form.downboundCompany" placeholder="請選擇公司名稱">
            <el-option
              v-for="client in clientList"
              :key="client.clientId"
              :value="client.clientId"
              :label="client.clientId +' '+ client.clientName"
            >{{client.clientId}} {{client.clientName}}</el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="起點" prop="downboundOutset">
          <el-input v-model="form.downboundOutset" placeholder="请输入起點" />
        </el-form-item>
        <el-form-item label="堆場" prop="downboundYard">
          <el-input v-model="form.downboundYard" placeholder="请输入堆場" />
        </el-form-item>
        <el-form-item label="現金" prop="downboundCash">
          <el-select v-model="form.downboundCash" placeholder="请选择現金">
            <el-option
              v-for="dict in dict.type.ks_cash"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="貨物名稱" prop="downboundGoods">
          <!-- <el-input v-model="form.downboundGoods" placeholder="请输入貨物名稱" /> -->

          <el-select clearable v-model="form.downboundGoods" placeholder="請選擇貨物名稱">
            <el-option
              v-for="goods in goodsList"
              :key="goods.goodsId"
              :value="goods.goodsId"
              :label="goods.goodsId +' '+ goods.goodsName"
            >{{goods.goodsId}} {{goods.goodsName}}</el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="貨物噸數" prop="downboundGoodsMt">
          <el-input-number v-model="form.downboundGoodsMt" placeholder="请输入貨物噸數" />
        </el-form-item>
        <el-form-item label="貨物單價" prop="downboundGoodsPrice">
          <el-input-number v-model="form.downboundGoodsPrice" placeholder="请输入貨物單價" />
        </el-form-item>
        <el-form-item label="此趟運費" prop="downboundTotal">
          <el-input v-model="form.downboundTotal" placeholder="请输入此趟運費" />
        </el-form-item>
        <el-form-item label="此趟薪資" prop="downboundDriverPay">
          <el-input v-model="form.downboundDriverPay" placeholder="请输入此趟薪資" />
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
  listDownbound,
  getDownbound,
  delDownbound,
  addDownbound,
  updateDownbound
} from "@/api/ks/downbound";
import { listUser } from "@/api/ks/employee";
import { listCarid } from "@/api/ks/car";
import { listClientForSelector } from "@/api/ks/client";
import { listGoodsForSelector } from "@/api/ks/goods";

export default {
  name: "Downbound",
  dicts: ["ks_cash"],
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
      // 南下表單表格数据
      downboundList: [],
      dateRange: [],
      userList: [],
      carList: [],
      clientList: [],
      goodsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        downboundId: null,
        downboundDate: null,
        downboundDriver: null,
        downboundLicensePlateNumber: null,
        downboundCompany: null,
        downboundOutset: null,
        downboundYard: null,
        downboundCash: null,
        downboundGoods: null,
        downboundGoodsMt: null,
        downboundGoodsPrice: null,
        downboundTotal: null,
        downboundDriverPay: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        downboundId: [
          { required: true, message: "南下單編號不能为空", trigger: "blur" }
        ],
        downboundDate: [
          { required: true, message: "日期(南下單)不能为空", trigger: "blur" }
        ],
        downboundDriver: [
          { required: true, message: "司機名稱不能为空", trigger: "blur" }
        ],
        downboundLicensePlateNumber: [
          { required: true, message: "車牌號碼不能为空", trigger: "blur" }
        ],
        downboundCompany: [
          { required: true, message: "公司名稱不能为空", trigger: "blur" }
        ],
        downboundOutset: [
          { required: true, message: "起點不能为空", trigger: "blur" }
        ],
        downboundYard: [
          { required: true, message: "堆場不能为空", trigger: "blur" }
        ],
        downboundCash: [
          { required: true, message: "現金不能为空", trigger: "change" }
        ],
        downboundGoodsMt: [
          { required: true, message: "貨物噸數不能为空", trigger: "blur" }
        ],
        downboundGoodsPrice: [
          { required: true, message: "貨物單價不能为空", trigger: "blur" }
        ],
        downboundTotal: [
          { required: true, message: "此趟運費不能为空", trigger: "blur" }
        ],
        downboundDriverPay: [
          { required: true, message: "此趟薪資不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getUser();
    this.getCars();
    this.getClientList();
    this.getGoodsList();
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
    getGoodsList() {
      listGoodsForSelector().then(response => {
        console.info(response);
        this.goodsList = response;
      });
    },
    getClientList() {
      listClientForSelector().then(response => {
        console.info(response);
        this.clientList = response;
      });
    },
    getUser() {
      listUser().then(response => {
        console.info(response);
        this.userList = response;
      });
    },
    getCars() {
      listCarid().then(response => {
        console.info(response);
        this.carList = response;
      });
    },

    /** 查询南下表單列表 */
    getList() {
      this.loading = true;
      listDownbound(this.addDateRange(this.queryParams, this.dateRange)).then(
        response => {
          this.downboundList = response.rows;
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
        downboundId: null,
        downboundDate: null,
        downboundDriver: null,
        downboundLicensePlateNumber: null,
        downboundCompany: null,
        downboundOutset: null,
        downboundYard: null,
        downboundCash: null,
        downboundGoods: null,
        downboundGoodsMt: null,
        downboundGoodsPrice: null,
        downboundTotal: null,
        downboundDriverPay: null
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
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加南下表單";
      // 新增之後給表單的默認值
      // 8000年後失效 因為這個是只要數字的部分 (?)
      // 參考: https://stackoverflow.com/questions/25159330/how-to-convert-an-iso-date-to-the-date-format-yyyy-mm-dd
      // 台北時間+8小時
      this.form.downboundDate = new Date(+new Date() + 8 * 3600 * 1000)
        .toISOString()
        .slice(0, 10);
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getDownbound(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改南下表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDownbound(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDownbound(this.form).then(response => {
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
        .confirm('是否确认删除南下表單编号为"' + ids + '"的数据项？')
        .then(function() {
          return delDownbound(ids);
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
        "ks/downbound/export",
        {
          ...this.queryParams
        },
        `downbound_${new Date().getTime()}.xlsx`
      );
    }
  }
};
</script>
