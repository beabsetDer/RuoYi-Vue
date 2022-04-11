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
          placeholder="請輸入北上單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="聯單編號" prop="gonorthCouponNumber">
        <el-input
          v-model="queryParams.gonorthCouponNumber"
          placeholder="請輸入聯單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="軟單編號" prop="gonorthSoftOrderNumber">
        <el-input
          v-model="queryParams.gonorthSoftOrderNumber"
          placeholder="請輸入軟單編號"
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
          placeholder="選擇日期(北上單)"
        >
        </el-date-picker>
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
      <el-form-item label="司機名稱" prop="gonorthDriver">
        <el-select
          clearable
          v-model="queryParams.gonorthDriver"
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
      <el-form-item label="車牌號碼" prop="gonorthLicensePlateNumber">
        <el-select
          clearable
          v-model="queryParams.gonorthLicensePlateNumber"
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
      <el-form-item label="客戶公司" prop="gonorthCompany">
        <el-select
          clearable
          v-model="queryParams.gonorthCompany"
          placeholder="請選擇客戶公司"
          filterable
        >
          <el-option
            v-for="client in clientList"
            :key="client.clientId"
            :value="client.clientId"
            :label="client.clientId + ' ' + client.clientName"
            >{{ client.clientId }} {{ client.clientName }}</el-option
          >
        </el-select>
      </el-form-item>
      <el-form-item label="起點" prop="gonorthOutset">
        <el-select
          clearable
          v-model="queryParams.gonorthOutset"
          placeholder="請選擇起點"
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
      <el-form-item label="堆場" prop="gonorthYard">
        <el-select
          clearable
          v-model="queryParams.gonorthYard"
          placeholder="請選擇堆場"
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
      <el-form-item label="現金" prop="gonorthCash">
        <el-select
          v-model="queryParams.gonorthCash"
          placeholder="請選擇現金"
          clearable
          size="small"
        >
          <el-option
            v-for="dict in dict.type.ks_cash"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="發票" prop="gonorthBill">
        <el-select
          v-model="queryParams.gonorthBill"
          placeholder="請選擇發票"
          clearable
          size="small"
        >
          <el-option
            v-for="dict in dict.type.ks_bill"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="貨物名稱" prop="gonorthGoods">
        <el-select
          clearable
          v-model="queryParams.gonorthGoods"
          placeholder="請選擇貨物名稱"
          style="width: 220px"
          filterable
        >
          <el-option
            v-for="goods in goodsList"
            :key="goods.goodsId"
            :value="goods.goodsId"
            :label="goods.goodsId + ' ' + goods.goodsName"
            >{{ goods.goodsId }} {{ goods.goodsName }}</el-option
          >
        </el-select>
      </el-form-item>
      <el-form-item label="司機出貨噸數" prop="gonorthGoodsMt">
        <el-input
          v-model="queryParams.gonorthGoodsMt"
          placeholder="請輸入司機出貨噸數"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="收貨噸數" prop="gonorthGoodsCustomerMt">
        <el-input
          v-model="queryParams.gonorthGoodsCustomerMt"
          placeholder="請輸入收貨噸數"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="司機單價" prop="gonorthGoodsPriceDriver">
        <el-input
          v-model="queryParams.gonorthGoodsPriceDriver"
          placeholder="請輸入司機單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扣發票金額" prop="gonorthBillTotal">
        <el-input
          v-model="queryParams.gonorthBillTotal"
          placeholder="請輸入扣發票金額"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司單價" prop="gonorthGoodsPriceCompany">
        <el-input
          v-model="queryParams.gonorthGoodsPriceCompany"
          placeholder="請輸入公司單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司此趟運費" prop="gonorthTotal">
        <el-input
          v-model="queryParams.gonorthTotal"
          placeholder="請輸入公司此趟運費"
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
          v-hasPermi="['ks:gonorth:add']"
          >新增</el-button
        >
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
          v-hasPermi="['ks:gonorth:remove']"
          >刪除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:gonorth:export']"
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
      :data="gonorthList"
      @selection-change="handleSelectionChange"
      class="elTable"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!--
      <el-table-column label="流水號" align="center" prop="id" />
      -->
      <el-table-column
        label="編號-(北上單)"
        align="center"
        prop="gonorthId"
        :render-header="renderheader"
      />
      <el-table-column
        label="聯單編號"
        align="center"
        prop="gonorthCouponNumber"
      />
      <el-table-column
        label="軟單編號"
        align="center"
        prop="gonorthSoftOrderNumber"
      />
      <el-table-column
        label="日期-(北上單)"
        align="center"
        prop="gonorthDate"
        width="180"
        :render-header="renderheader"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.gonorthDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="司機名稱" align="center" prop="gonorthDriver" />
      <el-table-column
        label="車牌號碼"
        align="center"
        prop="gonorthLicensePlateNumber"
      />
      <el-table-column label="公司名稱" align="center" prop="gonorthCompany" />
      <el-table-column label="起點" align="center" prop="gonorthOutset" />
      <el-table-column label="堆場" align="center" prop="gonorthYard" />
      <el-table-column label="現金" align="center" prop="gonorthCash">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.ks_cash"
            :value="scope.row.gonorthCash"
          />
        </template>
      </el-table-column>
      <el-table-column label="發票" align="center" prop="gonorthBill">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.ks_bill"
            :value="scope.row.gonorthBill"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="貨物名稱"
        align="center"
        prop="gonorthGoods"
        width="100"
      />
      <el-table-column
        label="司機-出貨噸數"
        align="center"
        prop="gonorthGoodsMt"
        :render-header="renderheader"
      />
      <el-table-column
        label="收貨噸數"
        align="center"
        prop="gonorthGoodsCustomerMt"
      />
      <el-table-column
        label="司機單價"
        align="center"
        prop="gonorthGoodsPriceDriver"
      />
      <el-table-column
        label="金額-(扣發票)"
        align="center"
        prop="gonorthBillTotal"
        :render-header="renderheader"
      />
      <el-table-column
        label="公司單價"
        align="center"
        prop="gonorthGoodsPriceCompany"
      />
      <el-table-column
        label="公司-此趟運費"
        align="center"
        prop="gonorthTotal"
        :render-header="renderheader"
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
            v-hasPermi="['ks:gonorth:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:gonorth:remove']"
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

    <!-- 添加或修改北上表單对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="800px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item label="北上單編號" prop="gonorthId" label-width="120px">
          <el-input
            v-model="form.gonorthId"
            placeholder="北上單編號"
            style="width: 220px"
            maxlength="12"
            :disabled="true"
            @input="keyInCheckOrderId(form.gonorthId)"
          >
            <!-- 指定前墜 -->
            <template slot="prepend">gonorth -</template>
          </el-input>
        </el-form-item>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="聯單編號"
              prop="gonorthCouponNumber"
              label-width="120px"
            >
              <el-input
                v-model="form.gonorthCouponNumber"
                placeholder="請輸入聯單編號"
                style="width: 220px"
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="軟單編號"
              prop="gonorthSoftOrderNumber"
              label-width="120px"
            >
              <el-input
                v-model="form.gonorthSoftOrderNumber"
                placeholder="請輸入軟單編號"
                style="width: 220px"
              />
            </el-form-item>
          </div>
        </div>

        <el-form-item
          label="日期(北上單)"
          prop="gonorthDate"
          label-width="120px"
        >
          <el-date-picker
            clearable
            size="small"
            v-model="form.gonorthDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選擇日期(北上單)"
          >
          </el-date-picker>
        </el-form-item>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="司機名稱"
              prop="gonorthDriver"
              label-width="120px"
            >
              <!-- <el-input v-model="form.gonorthDriver" placeholder="請輸入司機名稱" /> -->
              <el-select
                clearable
                v-model="form.gonorthDriver"
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
          </div>
          <div style="width: 60%">
            <el-form-item
              label="車牌號碼"
              prop="gonorthLicensePlateNumber"
              label-width="120px"
            >
              <el-select
                clearable
                v-model="form.gonorthLicensePlateNumber"
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
          </div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="公司名稱"
              prop="gonorthCompany"
              label-width="120px"
            >
              <el-select
                clearable
                v-model="form.gonorthCompany"
                placeholder="請選擇公司名稱"
                filterable
              >
                <el-option
                  v-for="client in clientList"
                  :key="client.clientId"
                  :value="client.clientId"
                  :label="client.clientId + ' ' + client.clientName"
                  >{{ client.clientId }} {{ client.clientName }}</el-option
                >
              </el-select>
            </el-form-item>
          </div>
          <div style="width: 30%">
            <el-form-item label="起點" prop="gonorthOutset" label-width="60px">
              <!--
              <el-input v-model="form.gonorthOutset" placeholder="請輸入起點" />
  -->
              <el-select
                clearable
                v-model="form.gonorthOutset"
                placeholder="請選擇起點"
                style="width: 150px"
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
          </div>
          <div style="width: 30%">
            <el-form-item label="堆場" prop="gonorthYard" label-width="60px">
              <!--
              <el-input
                v-model="form.gonorthYard"
                placeholder="請輸入堆場"
                label-width="60px"
              />
              -->
              <el-select
                clearable
                v-model="form.gonorthYard"
                placeholder="請選擇堆場"
                style="width: 150px"
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
          </div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="貨物名稱"
              prop="gonorthGoods"
              label-width="120px"
            >
              <el-select
                clearable
                v-model="form.gonorthGoods"
                placeholder="請選擇貨物名稱"
                style="width: 220px"
                filterable
              >
                <el-option
                  v-for="goods in goodsList"
                  :key="goods.goodsId"
                  :value="goods.goodsId"
                  :label="goods.goodsId + ' ' + goods.goodsName"
                  >{{ goods.goodsId }} {{ goods.goodsName }}</el-option
                >
              </el-select>
            </el-form-item>
          </div>
          <div style="width: 30%">
            <el-form-item label="現金" prop="gonorthCash" label-width="60px">
              <el-select
                v-model="form.gonorthCash"
                placeholder="請選擇現金"
                style="width: 150px"
              >
                <el-option
                  v-for="dict in dict.type.ks_cash"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </div>
          <div style="width: 30%">
            <el-form-item label="發票" prop="gonorthBill" label-width="60px">
              <el-select
                v-model="form.gonorthBill"
                placeholder="請選擇發票"
                style="width: 150px"
              >
                <el-option
                  v-for="dict in dict.type.ks_bill"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="司機出貨噸數"
              prop="gonorthGoodsMt"
              label-width="120px"
            >
              <el-input-number
                v-model="form.gonorthGoodsMt"
                style="width: 220px"
                placeholder="請輸入司機出貨噸數"
                @change="
                  countMoney();
                  countMoneyeCompany();
                "
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="客戶收貨噸數"
              prop="gonorthGoodsCustomerMt"
              label-width="120px"
            >
              <el-input-number
                v-model="form.gonorthGoodsCustomerMt"
                style="width: 220px"
                placeholder="請輸入收貨噸數"
              />
            </el-form-item>
          </div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="司機單價"
              prop="gonorthGoodsPriceDriver"
              label-width="120px"
            >
              <el-input-number
                v-model="form.gonorthGoodsPriceDriver"
                placeholder="請輸入司機單價"
                style="width: 220px"
                @change="countMoney"
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="公司單價"
              prop="gonorthGoodsPriceCompany"
              label-width="120px"
            >
              <el-input-number
                v-model="form.gonorthGoodsPriceCompany"
                placeholder="請輸入公司單價"
                style="width: 220px"
                @change="countMoneyeCompany"
              />
            </el-form-item>
          </div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="扣發票金額"
              prop="gonorthBillTotal"
              label-width="120px"
            >
              <el-input
                v-model="form.gonorthBillTotal"
                placeholder="司機噸數 * 司機單價"
                style="width: 220px"
                :disabled="true"
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="公司此趟運費"
              prop="gonorthTotal"
              label-width="120px"
            >
              <el-input
                v-model="form.gonorthTotal"
                placeholder="司機噸數 * 公司單價"
                style="width: 220px"
                :disabled="true"
              />
            </el-form-item>
          </div>
        </div>
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
  listGonorth,
  getGonorth,
  delGonorth,
  addGonorth,
  updateGonorth,
} from "@/api/ks/gonorth";
import { listUser } from "@/api/ks/employee";
import { listCarid } from "@/api/ks/car";
import { listClientForSelector } from "@/api/ks/client";
import { listGoodsForSelector } from "@/api/ks/goods";
import { listPlaceForSelector } from "@/api/ks/place";

export default {
  name: "Gonorth",
  dicts: ["ks_cash", "ks_bill"],
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
      showSearch: false,
      // 总条数
      total: 0,
      // 北上表單表格数据
      gonorthList: [],
      dateRange: [],
      userList: [],
      carList: [],
      clientList: [],
      goodsList: [],
      placeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gonorthId: null,
        gonorthCouponNumber: null,
        gonorthSoftOrderNumber: null,
        gonorthDate: null,
        gonorthDriver: null,
        gonorthLicensePlateNumber: null,
        gonorthCompany: null,
        gonorthOutset: null,
        gonorthYard: null,
        gonorthCash: null,
        gonorthBill: null,
        gonorthGoods: null,
        gonorthGoodsMt: null,
        gonorthGoodsCustomerMt: null,
        gonorthGoodsPriceDriver: null,
        gonorthBillTotal: null,
        gonorthGoodsPriceCompany: null,
        gonorthTotal: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gonorthId: [
          { required: true, message: "北上單編號不能为空", trigger: "blur" },
        ],
        gonorthDate: [
          { required: true, message: "日期(北上單)不能为空", trigger: "blur" },
        ],
        gonorthDriver: [
          { required: true, message: "司機名稱不能为空", trigger: "blur" },
        ],
        gonorthLicensePlateNumber: [
          { required: true, message: "車牌號碼不能为空", trigger: "blur" },
        ],
        gonorthCompany: [
          { required: true, message: "公司名稱不能为空", trigger: "blur" },
        ],
        gonorthOutset: [
          { required: true, message: "起點不能为空", trigger: "blur" },
        ],
        gonorthYard: [
          { required: true, message: "堆場不能为空", trigger: "blur" },
        ],
        gonorthCash: [
          { required: true, message: "現金不能为空", trigger: "change" },
        ],
        gonorthBill: [
          { required: true, message: "發票不能为空", trigger: "change" },
        ],
        gonorthGoodsMt: [
          { required: true, message: "司機出貨噸數不能为空", trigger: "blur" },
        ],
        gonorthGoodsPriceDriver: [
          { required: true, message: "司機單價不能为空", trigger: "blur" },
        ],
        gonorthBillTotal: [
          { required: true, message: "扣發票金額不能为空", trigger: "blur" },
        ],
        gonorthGoodsPriceCompany: [
          { required: true, message: "公司單價不能为空", trigger: "blur" },
        ],
        gonorthTotal: [
          { required: true, message: "公司此趟運費不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getUser();
    this.getCars();
    this.getClientList();
    this.getGoodsList();
    this.getPlaceList();
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
    // 輸入表單編號時候加的判斷
    keyInCheckOrderId(value) {
      if (value != null) {
        value = value.replace(/[^\d]/g, ""); // 只能輸入數字
        this.form.gonorthId = parseInt(value); // 注意這裡是string，你要數字類型記得自己轉一下
        // console.log(this.form.gonorthId);
      }
    },
    /** 查询北上表單列表 */
    getList() {
      this.loading = true;
      listGonorth(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.gonorthList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // 計算錢錢
    countMoney() {
      let sumPrice =
        this.form.gonorthGoodsMt * this.form.gonorthGoodsPriceDriver;
      console.log("DriversumPrice", sumPrice);
      // 只保留到小數點2位數 不四捨五入
      let tempVal = parseFloat(sumPrice).toFixed(3);
      let realVal = tempVal.substring(0, tempVal.length - 1);
      this.form.gonorthBillTotal = realVal;
    },
    // 計算錢錢
    countMoneyeCompany() {
      let sumPrice =
        this.form.gonorthGoodsMt * this.form.gonorthGoodsPriceCompany;
      console.log("CompanysumPrice", sumPrice);
      // 只保留到小數點2位數 不四捨五入
      let tempVal = parseFloat(sumPrice).toFixed(3);
      let realVal = tempVal.substring(0, tempVal.length - 1);
      this.form.gonorthTotal = realVal;
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
    getClientList() {
      listClientForSelector().then((response) => {
        console.info(response);
        this.clientList = response;
      });
    },
    getGoodsList() {
      listGoodsForSelector().then((response) => {
        console.info("goodsList", response);
        this.goodsList = response;
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
      this.form = {
        id: null,
        gonorthId: null,
        gonorthCouponNumber: null,
        gonorthSoftOrderNumber: null,
        gonorthDate: null,
        gonorthDriver: null,
        gonorthLicensePlateNumber: null,
        gonorthCompany: null,
        gonorthOutset: null,
        gonorthYard: null,
        gonorthCash: null,
        gonorthBill: null,
        gonorthGoods: null,
        gonorthGoodsMt: null,
        gonorthGoodsCustomerMt: null,
        gonorthGoodsPriceDriver: null,
        gonorthBillTotal: null,
        gonorthGoodsPriceCompany: null,
        gonorthTotal: null,
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
      this.title = "添加北上表單";
      // 新增預設下拉表單
      this.form.gonorthCash = "否";
      this.form.gonorthBill = "是";
      // 新增之後給表單的默認值
      // 8000年後失效 因為這個是只要數字的部分 (?)
      // 參考: https://stackoverflow.com/questions/25159330/how-to-convert-an-iso-date-to-the-date-format-yyyy-mm-dd
      // 台北時間+8小時
      this.form.gonorthDate = new Date(+new Date() + 8 * 3600 * 1000)
        .toISOString()
        .slice(0, 10);
      // 時間戳記
      this.form.gonorthId = this.getdate();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getGonorth(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改北上表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateGonorth(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGonorth(this.form).then((response) => {
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
        .then(function () {
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
          ...this.queryParams,
        },
        `gonorth_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
