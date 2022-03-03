<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="員工姓名">
        <el-select clearable v-model="queryParams.name" placeholder="請選擇" style="width:100%">
          <el-option
            v-for="item in userList"
            :key="item.employeeId"
            :value="item.name"
          >{{item.name}}</el-option>
        </el-select>
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
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="list">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="員工姓名" align="center" prop="name" />
      <el-table-column label="北上单数" align="center" prop="gonorthCount" />
      <el-table-column label="南下单数" align="center" prop="downboundCount" />
      <el-table-column label="总共油钱" align="center" prop="oliAmount" />
      <el-table-column label="薪资" align="center" prop="salary" />

      <el-table-column label="北上单" align="center" prop="name">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="gonorth_table_show(scope.row.name)">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column label="南下单" align="center" prop="name">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="downbound_table_show(scope.row.name)">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column label="加油单" align="center" prop="name">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="order_table_show(scope.row.name)">查看</el-button>
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
    <el-dialog :visible.sync="dialog.gonorth" width="80%">
      <gonorth-dialog v-if="dialog.gonorth" ref="gonorthD" @closed="dialog.gonorth=false"></gonorth-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.downbound" width="80%">
      <downbound-dialog v-if="dialog.downbound" ref="downboundD" @closed="dialog.downbound=false"></downbound-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.order" width="80%">
      <order-dialog v-if="dialog.order" ref="orderD" @closed="dialog.order=false"></order-dialog>
    </el-dialog>
  </div>
</template>

<script>
import { listReport } from "@/api/ks/report";
import { listUser } from "@/api/ks/employee";
import gonorthDialog from "../gonorth/index";
import downboundDialog from "../downbound/index";
import orderDialog from "../order/index";

export default {
  name: "Employee",
  components: {
    gonorthDialog,
    downboundDialog,
    orderDialog
  },
  dicts: ["sys_user_sex"],
  data() {
    return {
      // 遮罩层
      loading: true,
      dialog: {
        gonorth: false,
        downbound: false,
        order: false
      },
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
      list: [],
      // 弹出层标题
      title: "",
      userList: [],
      // 是否显示弹出层
      open: false,
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null
      }
    };
  },
  created() {
    this.getList();
    this.getUser();
  },
  methods: {
    gonorth_table_show(name) {
      this.dialog.gonorth = true;
      var that = this;

      this.$nextTick(() => {
        this.$refs.gonorthD.showSearch = false;
        this.$refs.gonorthD.queryParams.gonorthDriver = name;
        this.$refs.gonorthD.dateRange = this.dateRange;
        setTimeout(function() {
          that.$refs.gonorthD.getList();
        }, 300);
      });
    },
    downbound_table_show(name) {
      this.dialog.downbound = true;
      var that = this;
      this.$nextTick(() => {
        this.$refs.downboundD.showSearch = false;
        this.$refs.downboundD.queryParams.downboundDriver = name;
        this.$refs.downboundD.dateRange = this.dateRange;
        setTimeout(function() {
          that.$refs.downboundD.getList();
        }, 300);
      });
    },
    order_table_show(name) {
      this.dialog.order = true;
      var that = this;
      this.$nextTick(() => {
        this.$refs.orderD.showSearch = false;
        this.$refs.orderD.queryParams.oilDriver = name;
        this.$refs.orderD.dateRange = this.dateRange;
        setTimeout(function() {
          that.$refs.orderD.getList();
        }, 300);
      });
    },
    getUser() {
      listUser().then(response => {
        console.info(response);
        this.userList = response;
      });
    },
    /** 查询員工表單列表 */
    getList() {
      this.loading = true;
      listReport(this.addDateRange(this.queryParams, this.dateRange)).then(
        response => {
          this.list = response.rows;
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
    }
  }
};
</script>