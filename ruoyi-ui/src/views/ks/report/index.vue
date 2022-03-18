<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="員工姓名" prop="name">
        <el-select clearable v-model="queryParams.name" placeholder="請選擇機司名稱" style="small">
          <el-option
            v-for="item in userList"
            :key="item.employeeId"
            :value="item.name"
          >{{ item.name }}</el-option>
        </el-select>
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
      <el-table-column label="北上單數" align="center" prop="gonorthCount" />
      <el-table-column label="南下單數" align="center" prop="downboundCount" />
      <el-table-column label="總共油錢" align="center" prop="oliAmount" />
      <el-table-column label="薪資" align="center" prop="salary" />

      <el-table-column label="北上單" align="center" prop="name">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="gonorth_table_show(scope.row.name)">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column label="南下單" align="center" prop="name">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="downbound_table_show(scope.row.name)">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column label="加油單" align="center" prop="name">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="order_table_show(scope.row.name)">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column label="報表" align="center" prop="name">
        <!-- Table -->
        <template slot-scope="scope">
          <el-button
            type="text"
            v-hasPermi="['ks:employee:emplistReport']"
            @click="tttttttt(scope.row.employeeId)"
          >查看(請設日期再開)</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div id="printCons">
      <el-dialog title="個人車趟表單詳細資訊" :visible.sync="dialog.allData" width="90%">
        <!--
        <div style="page-break-before: always">bbbbbb</div>
        -->
        <div align="right">
          <!--
          <el-button type="primary" @click="goPrint">列印本頁資訊</el-button>
          -->
          <el-button
            type="success"
            v-hasPermi="['ks:employee:exportExcel']"
            @click="eeeeeeee(gridData[0].employeeId)"
          >匯出Excel</el-button>
        </div>
        <el-scrollbar style="height: 700px; position: relative; top: 10px">
          <el-table :data="gridData" ref="alldataD" border>
            <!-- 員工資料總攬位置 -->
            <el-table-column label="員工資料總攬">
              <el-table :data="gridData" ref="alldataD">
                <el-table-column label="編號" prop="employeeId"></el-table-column>
                <el-table-column label="姓名" prop="name"></el-table-column>
                <el-table-column label="南下次數" prop="downboundCount"></el-table-column>
                <el-table-column label="南下營業額" prop="downboundRevenue"></el-table-column>
                <el-table-column label="北上次數" prop="gonorthCount"></el-table-column>
                <el-table-column label="北上營業額" prop="gonorthRevenue"></el-table-column>
                <el-table-column
                  label="營業額-(南下+北上)"
                  prop="revenueTotal"
                  :render-header="renderheader"
                ></el-table-column>
                <el-table-column
                  label="日常支出次數-(土尾/發泡/洗車)"
                  prop="expenseCount"
                  :render-header="renderheader"
                ></el-table-column>
                <el-table-column
                  label="日常支出總額-(土尾/發泡/洗車)"
                  prop="expenseTotal"
                  :render-header="renderheader"
                ></el-table-column>
                <el-table-column label="加油次數" prop="oliCount"></el-table-column>
                <el-table-column label="油錢總額" prop="oliAmount"></el-table-column>
                <el-table-column
                  label="營業額-(扣除日常支出)"
                  prop="driverRevenue"
                  :render-header="renderheader"
                ></el-table-column>
                <el-table-column label="薪水-(司機抽2.3成)" prop="salary" :render-header="renderheader"></el-table-column>
              </el-table>
            </el-table-column>
          </el-table>
          <!-- 分隔-->
          <p></p>
          <el-table :data="gridData" ref="alldataD" border>
            <el-table-column label="南北車趟詳細資料">
              <!-- scope -->
              <template slot-scope="scope">
                <el-table :data="scope.row.downboundList" ref="alldataD" height="300">
                  <el-table-column label="南下單編號" prop="downboundId"></el-table-column>
                  <el-table-column label="日期" prop="downboundDate"></el-table-column>
                  <el-table-column label="車牌" prop="downboundLicensePlateNumber"></el-table-column>
                  <el-table-column label="姓名" prop="downboundDriver"></el-table-column>
                  <el-table-column label="公司" prop="downboundCompany"></el-table-column>
                  <el-table-column label="起點" prop="downboundOutset"></el-table-column>
                  <el-table-column label="堆場" prop="downboundYard"></el-table-column>
                  <el-table-column label="現金" prop="downboundCash"></el-table-column>
                  <el-table-column label="貨物" prop="downboundGoods"></el-table-column>
                  <el-table-column label="噸數" prop="downboundGoodsMt"></el-table-column>
                  <el-table-column label="貨物單價" prop="downboundGoodsPrice"></el-table-column>
                  <el-table-column label="此趟運費" prop="downboundTotal"></el-table-column>
                </el-table>
                <!-- 分隔-->
                <p></p>
                <!-- 分隔end-->
                <el-table :data="scope.row.gonorthList" ref="alldataD" height="300">
                  <el-table-column label="北上單編號" prop="gonorthId"></el-table-column>
                  <el-table-column label="日期" prop="gonorthDate"></el-table-column>
                  <el-table-column label="車牌" prop="gonorthLicensePlateNumber"></el-table-column>
                  <el-table-column label="姓名" prop="gonorthDriver"></el-table-column>
                  <el-table-column label="公司" prop="gonorthCompany"></el-table-column>
                  <el-table-column label="起點" prop="gonorthOutset"></el-table-column>
                  <el-table-column label="堆場" prop="gonorthYard"></el-table-column>
                  <el-table-column label="現金" prop="gonorthCash"></el-table-column>
                  <el-table-column label="貨物" prop="gonorthGoods"></el-table-column>
                  <el-table-column label="噸數" prop="gonorthGoodsMt"></el-table-column>
                  <el-table-column label="貨物單價" prop="gonorthGoodsPriceDriver"></el-table-column>
                  <el-table-column label="此趟運費" prop="gonorthBillTotal"></el-table-column>
                </el-table>
                <!-- 分隔-->
                <p></p>
                <!-- 分隔end-->
                <el-table :data="scope.row.downboundList" ref="alldataD" height="300">
                  <el-table-column label="日常維護編號" prop="downboundId"></el-table-column>
                  <el-table-column label="車牌" prop="downboundLicensePlateNumber"></el-table-column>
                  <el-table-column label="公司" prop="downboundCompany"></el-table-column>
                  <el-table-column label="公司" prop="downboundCompany"></el-table-column>
                  <el-table-column label="公司" prop="downboundCompany"></el-table-column>
                </el-table>
              </template>
            </el-table-column>
          </el-table>
        </el-scrollbar>
        <!--
        <div style="page-break-after: always">------</div>
        -->
      </el-dialog>
    </div>
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <el-dialog :visible.sync="dialog.gonorth" width="80%">
      <gonorth-dialog v-if="dialog.gonorth" ref="gonorthD" @closed="dialog.gonorth = false"></gonorth-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.downbound" width="80%">
      <downbound-dialog v-if="dialog.downbound" ref="downboundD" @closed="dialog.downbound = false"></downbound-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.order" width="80%">
      <order-dialog v-if="dialog.order" ref="orderD" @closed="dialog.order = false"></order-dialog>
    </el-dialog>
  </div>
</template>

<script>
import { listReport, emplistReport } from "@/api/ks/report";
import { listUser } from "@/api/ks/employee";
import gonorthDialog from "../gonorth/index";
import downboundDialog from "../downbound/index";
import orderDialog from "../order/index";
// 打印組件
import printJS from "print-js";

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
        order: false,
        allData: false
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
      },

      gridData: []
    };
  },

  created() {
    this.getList();
    this.getUser();
  },

  methods: {
    // 打印
    // goPrint() {
    //   console.log("打印");
    //   printJS({
    //     printable: this.gridData,
    //     type: "json",
    //     properties: [
    //       { field: "name", displayName: "姓名", columnSize: `10%` },
    //       { field: "employeeId", displayName: "編號", columnSize: `10%` },
    //       {
    //         field: "gonorthList",
    //         displayName: "北上車趟",
    //         columnSize: `50%`
    //       }
    //     ],

    //     // header: `<p class="custom-p"> 名单 </p>`,
    //     // style: '#printCons {width: 600px;} .no-print{width: 0px} .itemText1 { width: 200px } .itemText2 { width: 200px } .itemText3 { width: 200px } .itemText4 { width: 200px }',
    //     // gridHeaderStyle:'font-size:12px; padding:3px; border:1px solid; font-weight: 100; text-align:left;',
    //     // gridStyle:'font-size:12px; padding:3px; border:1px solid; text-align:left;',
    //     // repeatTableHeader: true,
    //     // scanStyles:true,
    //     targetStyles: ["*"],
    //     ignoreElements: ["no-print", "bc", "gb"]
    //   });
    // },
    // 換行用的
    renderheader(h, { column, $index }) {
      return h("span", {}, [
        h("span", {}, column.label.split("-")[0]),
        h("br"),
        h("span", {}, column.label.split("-")[1])
      ]);
    },

    tttttttt(employeeId) {
      this.dialog.allData = true;
      const id = employeeId;
      // console.info(this.queryParams);
      emplistReport(
        this.addDateRange(this.queryParams, this.dateRange),
        id
      ).then(response => {
        //  console.info(response);
        this.gridData = response.rows;
        console.info(this.gridData);
      });
    },

    // 匯出 excel
    // eeeeeeee(employeeId) {
    //   const id = employeeId;
    //   console.info(this.queryParams);
    //   window.location.href =
    //     process.env.VUE_APP_BASE_API + "/ks/employee/exportExcel/" + id;
    // },

    // 匯出 excel
    eeeeeeee(employeeId) {
      const id = employeeId;
      console.info(this.queryParams);

      this.download(
        "ks/employee/exportExcel/" + id,
        {
          ...this.queryParams
        },
        `員工薪資_${id + "日期" + this.dateRange}.xls`
      );
    },

    gonorth_table_show(name) {
      console.info(name);
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

    getAllData(name) {
      this.dialog.allData = true;
      this.loading = true;
      listReport(this.addDateRange(this.queryParams, this.dateRange)).then(
        response => {
          // this.gridData = response;
          this.gridData = response.rows;
          this.total = response.total;
          this.loading = false;
          console.log(this.list);
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
      // this.queryParams.name = null;
      this.resetForm("queryForm");
      this.handleQuery();
    }
  }
};
</script>
