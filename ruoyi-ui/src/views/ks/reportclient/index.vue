<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="100px"
    >
      <el-form-item label="廠商名稱" prop="clientId">
        <el-select
          clearable
          v-model="queryParams.clientId"
          placeholder="請選擇公司名稱"
          filterable
        >
          <el-option
            v-for="client in clientListQuery"
            :key="client.clientId"
            :value="client.clientId"
            :label="client.clientId + ' ' + client.clientName"
            >{{ client.clientId }} {{ client.clientName }}</el-option
          >
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

      <el-form-item label="起點" prop="params.outset">
        <el-select
          clearable
          v-model="queryParams.params.outset"
          placeholder="請選擇起點"
          style="width: 240px"
          filterable
        >
          <el-option
            v-for="p in placeList"
            :key="p.placeId"
            :value="p.placeId"
            :label="p.placeId + ' ' + p.placeName"
            >{{ p.placeId }} {{ p.placeName }}</el-option
          >
        </el-select>
      </el-form-item>
      <el-form-item label="堆場" prop="params.yard">
        <el-select
          clearable
          v-model="queryParams.params.yard"
          placeholder="請輸入堆場"
          style="width: 240px"
          filterable
        >
          <el-option
            v-for="p in placeList"
            :key="p.placeId"
            :value="p.placeId"
            :label="p.placeId + ' ' + p.placeName"
            >{{ p.placeId }} {{ p.placeName }}</el-option
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
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="clientList">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="廠商編號" align="center" prop="clientId" />
      <el-table-column label="廠商名稱" align="center" prop="clientName" />
      <!--
      <el-table-column label="北上單數" align="center" prop="gonorthCount" />
      -->
      <el-table-column label="南下單數" align="center" prop="downboundCount" />

      <!--
      <el-table-column label="日常開支" align="center" prop="expenseTotal" />
      <el-table-column label="總共油錢" align="center" prop="oliAmount" />
      <el-table-column label="薪資" align="center" prop="salary" />
      -->
      <!--
      <el-table-column label="北上金額" align="center" prop="salary" />
      -->
      <el-table-column
        label="請款金額(南下)"
        align="center"
        prop="downboundRevenue"
      />

      <!--
      <el-table-column label="北上單" align="center" prop="clientId">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="small"
            @click="gonorth_table_show(scope.row.clientId)"
            >查看</el-button
          >
        </template>
      </el-table-column>
-->

      <el-table-column label="南下單" align="center" prop="clientId">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="small"
            @click="downbound_table_show(scope.row.clientId)"
            >查看</el-button
          >
        </template>
      </el-table-column>

      <el-table-column label="報表" align="center" prop="clientId">
        <!-- Table -->
        <template slot-scope="scope">
          <el-button
            type="text"
            v-hasPermi="['ks:employee:emplistReport']"
            @click="tttttttt(scope.row.clientId, scope.row.clientName)"
            >查看(請設日期再開)</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <div id="printCons">
      <el-dialog
        :title="title"
        :visible.sync="dialog.allData"
        width="90%"
        :close-on-click-modal="false"
      >
        <!--
        <div style="page-break-before: always">bbbbbb</div>
        -->
        <div align="right">
          <!--
          <el-button type="primary" @click="goPrint">列印本頁資訊</el-button>
          -->
          <el-button
            type="success"
            v-hasPermi="['ks:client:exportExcel']"
            @click="eeeeeeee(gridData[0].clientId, gridData[0].clientName)"
            >匯出Excel</el-button
          >
        </div>
        <el-scrollbar style="height: 700px; position: relative; top: 10px">
          <el-table :data="gridData" ref="alldataD" border>
            <!-- 廠商請款位置 -->
            <el-table-column label="廠商請款總攬">
              <el-table :data="gridData" ref="alldataD">
                <el-table-column label="編號" prop="clientId"></el-table-column>
                <el-table-column
                  label="廠商名稱"
                  prop="clientName"
                ></el-table-column>
                <el-table-column
                  label="請款筆數(南下)"
                  prop="downboundCount"
                ></el-table-column>

                <!--
                <el-table-column
                  label="南下營業額"
                  prop="downboundRevenue"
                ></el-table-column>
                -->
                <!--
                <el-table-column
                  label="北上次數"
                  prop="gonorthCount"
                ></el-table-column>
                -->
                <!--
                <el-table-column
                  label="北上營業額"
                  prop="gonorthRevenue"
                ></el-table-column>
                -->

                <el-table-column
                  label="請款金額(南下)"
                  prop="downboundRevenue"
                  :render-header="renderheader"
                ></el-table-column>
              </el-table>
            </el-table-column>
          </el-table>
          <!-- 分隔-->
          <p></p>
          <el-table :data="gridData" ref="alldataD" border>
            <el-table-column label="南下請款資料">
              <!-- scope -->
              <template slot-scope="scope">
                <el-table
                  :data="scope.row.downboundList"
                  ref="alldataD"
                  height="450"
                >
                  <!--
                  <el-table-column
                    label="南下單編號"
                    prop="downboundId"
                  ></el-table-column>
                -->

                  <el-table-column
                    label="日期"
                    prop="downboundDate"
                  ></el-table-column>
                  <el-table-column
                    label="車牌"
                    prop="downboundLicensePlateNumber"
                  ></el-table-column>
                  <el-table-column
                    label="請款單"
                    prop="downboundSoftOrderNumber"
                  ></el-table-column>

                  <el-table-column
                    label="聯單"
                    prop="downboundCouponNumber"
                  ></el-table-column>
                  <!--
                  <el-table-column
                    label="姓名"
                    prop="downboundDriver"
                  ></el-table-column>

                  <el-table-column
                    label="公司"
                    prop="downboundCompany"
                  ></el-table-column>
                  -->
                  <el-table-column
                    label="起點"
                    prop="downboundOutset"
                  ></el-table-column>
                  <el-table-column
                    label="堆場"
                    prop="downboundYard"
                  ></el-table-column>

                  <!--
                  <el-table-column
                    label="現金"
                    prop="downboundCash"
                  ></el-table-column>
-->

                  <el-table-column
                    label="貨物"
                    prop="downboundGoods"
                  ></el-table-column>
                  <el-table-column
                    label="司機噸數"
                    prop="downboundGoodsMt"
                  ></el-table-column>

                  <el-table-column
                    label="貨物單價"
                    prop="downboundGoodsPrice"
                  ></el-table-column>
                  <el-table-column
                    label="此趟運費"
                    prop="downboundTotal"
                  ></el-table-column>
                </el-table>
                <!-- 分隔-->
                <p></p>
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
      <gonorth-dialog
        v-if="dialog.gonorth"
        ref="gonorthD"
        @closed="dialog.gonorth = false"
      ></gonorth-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.downbound" width="80%">
      <downbound-dialog
        v-if="dialog.downbound"
        ref="downboundD"
        @closed="dialog.downbound = false"
      ></downbound-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.expense" width="80%">
      <expense-dialog
        v-if="dialog.expense"
        ref="expenseD"
        @closed="dialog.expense = false"
      ></expense-dialog>
    </el-dialog>
    <el-dialog :visible.sync="dialog.order" width="80%">
      <order-dialog
        v-if="dialog.order"
        ref="orderD"
        @closed="dialog.order = false"
      ></order-dialog>
    </el-dialog>
  </div>
</template>

<script>
import { listReportClient, clientlistReport } from "@/api/ks/reportclient";
import { listUser } from "@/api/ks/employee";
import gonorthDialog from "../gonorth/index";
import downboundDialog from "../downbound/index";
import expenseDialog from "../expense/index";
import orderDialog from "../order/index";
import { listPlaceForSelector } from "@/api/ks/place";
import { listClientForSelector } from "@/api/ks/client";
// 打印組件
import printJS from "print-js";

export default {
  name: "Client",
  components: {
    gonorthDialog,
    downboundDialog,
    expenseDialog,
    orderDialog,
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
        expense: false,
        allData: false,
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
      // 廠商請款數據
      clientList: [],
      // 下拉
      clientListQuery: [],
      placeList: [],
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
        clientId: null,
        params: {
          outset: null,
          yard: null,
        },
      },

      gridData: [],
    };
  },

  created() {
    this.getList();
    this.getUser();
    this.getPlaceList();
    this.getClientList();
  },

  methods: {
    // 換行用的
    renderheader(h, { column, $index }) {
      return h("span", {}, [
        h("span", {}, column.label.split("-")[0]),
        h("br"),
        h("span", {}, column.label.split("-")[1]),
      ]);
    },

    tttttttt(clientId, clientName) {
      this.dialog.allData = true;
      const id = clientId;
      // console.info(this.queryParams);

      if (this.dateRange.length != 0) {
        this.title =
          "客戶廠商：" +
          clientName +
          "(" +
          clientId +
          ") 時間範圍：" +
          this.dateRange[0] +
          " ～ " +
          this.dateRange[1];
      } else {
        this.title =
          "客戶廠商：" + clientName + "(" + clientId + ") 時間範圍：歷史全部";
      }

      clientlistReport(
        this.addDateRange(this.queryParams, this.dateRange),
        id
      ).then((response) => {
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
    eeeeeeee(clientId, clientName) {
      console.info(this.queryParams);

      let excelTitle = "";
      if (this.dateRange.length != 0) {
        excelTitle =
          "客戶廠商：" +
          clientName +
          "(" +
          clientId +
          " 時間範圍：" +
          this.dateRange[0] +
          " ～ " +
          this.dateRange[1];
      } else {
        excelTitle =
          "客戶廠商：" + clientName + "(" + clientId + ") 時間範圍：歷史全部";
      }

      this.download(
        "ks/client/exportExcel/" + clientId,
        {
          ...this.queryParams,
        },
        `請款：${excelTitle}.xls`
      );
    },

    getClientList() {
      listClientForSelector().then((response) => {
        console.info(response);
        this.clientListQuery = response;
      });
    },

    gonorth_table_show(clientId) {
      this.dialog.gonorth = true;
      var that = this;

      this.$nextTick(() => {
        this.$refs.gonorthD.showSearch = false;
        this.$refs.gonorthD.queryParams.gonorthCompany = clientId;
        this.$refs.gonorthD.dateRange = this.dateRange;
        setTimeout(function () {
          that.$refs.gonorthD.getList();
        }, 300);
      });
    },
    // 南下
    downbound_table_show(clientId) {
      this.dialog.downbound = true;
      var that = this;
      this.$nextTick(() => {
        this.$refs.downboundD.showSearch = false;
        this.$refs.downboundD.queryParams.downboundCompany = clientId;
        // 地點
        this.$refs.downboundD.queryParams.downboundOutset =
          this.queryParams.params.outset;
        this.$refs.downboundD.queryParams.downboundYard =
          this.queryParams.params.yard;

        this.$refs.downboundD.dateRange = this.dateRange;
        setTimeout(function () {
          that.$refs.downboundD.getList();
        }, 300);
      });
    },

    getUser() {
      listUser().then((response) => {
        console.info(response);
        this.userList = response;
      });
    },
    /** 查询廠商列表 */
    getList() {
      this.loading = true;
      console.log("this.queryParams", this.queryParams);
      listReportClient(
        this.addDateRange(this.queryParams, this.dateRange)
      ).then((response) => {
        this.clientList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    getAllData(clientId) {
      this.dialog.allData = true;
      this.loading = true;
      listReportClient(
        this.addDateRange(this.queryParams, this.dateRange)
      ).then((response) => {
        // this.gridData = response;
        this.gridData = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    getPlaceList() {
      listPlaceForSelector().then((response) => {
        console.info("placeList", response);
        this.placeList = response;
      });
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
      //  this.queryParams.params = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
  },
};
</script>
