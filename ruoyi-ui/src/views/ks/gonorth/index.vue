<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="100px"
    >
      <el-form-item label="北上單編號" prop="gonorthId">
        <el-input
          v-model="queryParams.gonorthId"
          placeholder="请输入北上單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日期(北上單)" prop="gonorthDate">
        <el-date-picker
          clearable
          size="small"
          v-model="queryParams.gonorthDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择日期(北上單)"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="时间">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="司機名稱" prop="gonorthDriver">
        <el-input
          v-model="queryParams.gonorthDriver"
          placeholder="请输入司機名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="車牌號碼" prop="gonorthLicensePlateNumber">
        <el-input
          v-model="queryParams.gonorthLicensePlateNumber"
          placeholder="请输入車牌號碼"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司名稱" prop="gonorthCompany">
        <el-input
          v-model="queryParams.gonorthCompany"
          placeholder="请输入公司名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="起點" prop="gonorthOutset">
        <el-input
          v-model="queryParams.gonorthOutset"
          placeholder="请输入起點"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="堆場" prop="gonorthYard">
        <el-input
          v-model="queryParams.gonorthYard"
          placeholder="请输入堆場"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="現金" prop="gonorthCash">
        <el-select v-model="queryParams.gonorthCash" placeholder="请选择現金" clearable size="small">
          <el-option
            v-for="dict in dict.type.ks_cash"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="貨物名稱" prop="gonorthGoods">
        <el-input
          v-model="queryParams.gonorthGoods"
          placeholder="请输入貨物名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="貨物噸數" prop="gonorthGoodsMt">
        <el-input
          v-model="queryParams.gonorthGoodsMt"
          placeholder="请输入貨物噸數"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司單價" prop="gonorthGoodsPriceCompany">
        <el-input
          v-model="queryParams.gonorthGoodsPriceCompany"
          placeholder="请输入公司單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="司機單價" prop="gonorthGoodsPriceDriver">
        <el-input
          v-model="queryParams.gonorthGoodsPriceDriver"
          placeholder="请输入司機單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司此趟運費" prop="gonorthTotal">
        <el-input
          v-model="queryParams.gonorthTotal"
          placeholder="请输入公司此趟運費"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扣發票金額" prop="gonorthBillTotal">
        <el-input
          v-model="queryParams.gonorthBillTotal"
          placeholder="请输入扣發票金額"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="此趟薪資" prop="gonorthDriverPay">
        <el-input
          v-model="queryParams.gonorthDriverPay"
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
          v-hasPermi="['ks:gonorth:add']"
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
          v-hasPermi="['ks:gonorth:edit']"
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
          v-hasPermi="['ks:gonorth:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:gonorth:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gonorthList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="流水號" align="center" prop="id" />
      <el-table-column label="北上單編號" align="center" prop="gonorthId" />
      <el-table-column label="日期(北上單)" align="center" prop="gonorthDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.gonorthDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="司機名稱" align="center" prop="gonorthDriver" />
      <el-table-column label="車牌號碼" align="center" prop="gonorthLicensePlateNumber" />
      <el-table-column label="公司名稱" align="center" prop="gonorthCompany" />
      <el-table-column label="起點" align="center" prop="gonorthOutset" />
      <el-table-column label="堆場" align="center" prop="gonorthYard" />
      <el-table-column label="現金" align="center" prop="gonorthCash">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.ks_cash" :value="scope.row.gonorthCash" />
        </template>
      </el-table-column>
      <el-table-column label="貨物名稱" align="center" prop="gonorthGoods" />
      <el-table-column label="貨物噸數" align="center" prop="gonorthGoodsMt" />
      <el-table-column label="公司單價" align="center" prop="gonorthGoodsPriceCompany" />
      <el-table-column label="司機單價" align="center" prop="gonorthGoodsPriceDriver" />
      <el-table-column label="公司此趟運費" align="center" prop="gonorthTotal" />
      <el-table-column label="扣發票金額" align="center" prop="gonorthBillTotal" />
      <el-table-column label="此趟薪資" align="center" prop="gonorthDriverPay" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ks:gonorth:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:gonorth:remove']"
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

    <!-- 添加或修改北上表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="北上單編號" prop="gonorthId">
          <el-input v-model="form.gonorthId" placeholder="请输入北上單編號" />
        </el-form-item>
        <el-form-item label="日期(北上單)" prop="gonorthDate">
          <el-date-picker
            clearable
            size="small"
            v-model="form.gonorthDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择日期(北上單)"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="司機名稱" prop="gonorthDriver">
          <el-input v-model="form.gonorthDriver" placeholder="请输入司機名稱" />
        </el-form-item>
        <el-form-item label="車牌號碼" prop="gonorthLicensePlateNumber">
          <el-input v-model="form.gonorthLicensePlateNumber" placeholder="请输入車牌號碼" />
        </el-form-item>
        <el-form-item label="公司名稱" prop="gonorthCompany">
          <el-input v-model="form.gonorthCompany" placeholder="请输入公司名稱" />
        </el-form-item>
        <el-form-item label="起點" prop="gonorthOutset">
          <el-input v-model="form.gonorthOutset" placeholder="请输入起點" />
        </el-form-item>
        <el-form-item label="堆場" prop="gonorthYard">
          <el-input v-model="form.gonorthYard" placeholder="请输入堆場" />
        </el-form-item>
        <el-form-item label="現金" prop="gonorthCash">
          <el-select v-model="form.gonorthCash" placeholder="请选择現金">
            <el-option
              v-for="dict in dict.type.ks_cash"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="貨物名稱" prop="gonorthGoods">
          <el-input v-model="form.gonorthGoods" placeholder="请输入貨物名稱" />
        </el-form-item>
        <el-form-item label="貨物噸數" prop="gonorthGoodsMt">
          <el-input v-model="form.gonorthGoodsMt" placeholder="请输入貨物噸數" />
        </el-form-item>
        <el-form-item label="公司單價" prop="gonorthGoodsPriceCompany">
          <el-input v-model="form.gonorthGoodsPriceCompany" placeholder="请输入公司單價" />
        </el-form-item>
        <el-form-item label="司機單價" prop="gonorthGoodsPriceDriver">
          <el-input v-model="form.gonorthGoodsPriceDriver" placeholder="请输入司機單價" />
        </el-form-item>
        <el-form-item label="公司此趟運費" prop="gonorthTotal">
          <el-input v-model="form.gonorthTotal" placeholder="请输入公司此趟運費" />
        </el-form-item>
        <el-form-item label="扣發票金額" prop="gonorthBillTotal">
          <el-input v-model="form.gonorthBillTotal" placeholder="请输入扣發票金額" />
        </el-form-item>
        <el-form-item label="此趟薪資" prop="gonorthDriverPay">
          <el-input v-model="form.gonorthDriverPay" placeholder="请输入此趟薪資" />
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
  listGonorth,
  getGonorth,
  delGonorth,
  addGonorth,
  updateGonorth
} from "@/api/ks/gonorth";

export default {
  name: "Gonorth",
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
      // 北上表單表格数据
      gonorthList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gonorthId: null,
        gonorthDate: null,
        gonorthDriver: null,
        gonorthLicensePlateNumber: null,
        gonorthCompany: null,
        gonorthOutset: null,
        gonorthYard: null,
        gonorthCash: null,
        gonorthGoods: null,
        gonorthGoodsMt: null,
        gonorthGoodsPriceCompany: null,
        gonorthGoodsPriceDriver: null,
        gonorthTotal: null,
        gonorthBillTotal: null,
        gonorthDriverPay: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gonorthId: [
          { required: true, message: "北上單編號不能为空", trigger: "blur" }
        ],
        gonorthDate: [
          { required: true, message: "日期(北上單)不能为空", trigger: "blur" }
        ],
        gonorthDriver: [
          { required: true, message: "司機名稱不能为空", trigger: "blur" }
        ],
        gonorthLicensePlateNumber: [
          { required: true, message: "車牌號碼不能为空", trigger: "blur" }
        ],
        gonorthCompany: [
          { required: true, message: "公司名稱不能为空", trigger: "blur" }
        ],
        gonorthOutset: [
          { required: true, message: "起點不能为空", trigger: "blur" }
        ],
        gonorthYard: [
          { required: true, message: "堆場不能为空", trigger: "blur" }
        ],
        gonorthCash: [
          { required: true, message: "現金不能为空", trigger: "change" }
        ],
        gonorthGoodsMt: [
          { required: true, message: "貨物噸數不能为空", trigger: "blur" }
        ],
        gonorthGoodsPriceCompany: [
          { required: true, message: "公司單價不能为空", trigger: "blur" }
        ],
        gonorthTotal: [
          { required: true, message: "公司此趟運費不能为空", trigger: "blur" }
        ],
        gonorthBillTotal: [
          { required: true, message: "扣發票金額不能为空", trigger: "blur" }
        ],
        gonorthDriverPay: [
          { required: true, message: "此趟薪資不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询北上表單列表 */
    getList() {
      this.loading = true;
      listGonorth(this.addDateRange(this.queryParams, this.dateRange)).then(
        response => {
          this.gonorthList = response.rows;
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
        gonorthId: null,
        gonorthDate: null,
        gonorthDriver: null,
        gonorthLicensePlateNumber: null,
        gonorthCompany: null,
        gonorthOutset: null,
        gonorthYard: null,
        gonorthCash: null,
        gonorthGoods: null,
        gonorthGoodsMt: null,
        gonorthGoodsPriceCompany: null,
        gonorthGoodsPriceDriver: null,
        gonorthTotal: null,
        gonorthBillTotal: null,
        gonorthDriverPay: null
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
      this.title = "添加北上表單";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getGonorth(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改北上表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGonorth(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGonorth(this.form).then(response => {
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
        .confirm('是否确认删除北上表單编号为"' + ids + '"的数据项？')
        .then(function() {
          return delGonorth(ids);
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
        "ks/gonorth/export",
        {
          ...this.queryParams
        },
        `gonorth_${new Date().getTime()}.xlsx`
      );
    }
  }
};
</script>
