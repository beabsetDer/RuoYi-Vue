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
          placeholder="請輸入南下單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="聯單編號" prop="downboundCouponNumber">
        <el-input
          v-model="queryParams.downboundCouponNumber"
          placeholder="請輸入聯單編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="軟單編號" prop="downboundSoftOrderNumber">
        <el-input
          v-model="queryParams.downboundSoftOrderNumber"
          placeholder="請輸入軟單編號"
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
          placeholder="選擇日期(南下單)"
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
        <!--
        <el-input
          v-model="queryParams.downboundDriver"
          placeholder="請輸入司機名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->

        <el-select
          clearable
          v-model="queryParams.downboundDriver"
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
      <el-form-item label="車牌號碼" prop="downboundLicensePlateNumber">
        <!--
        <el-input
          v-model="queryParams.downboundLicensePlateNumber"
          placeholder="請輸入車牌號碼"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->

        <el-select
          clearable
          v-model="queryParams.downboundLicensePlateNumber"
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
      <el-form-item label="公司名稱" prop="downboundCompany">
        <!--
        <el-input
          v-model="queryParams.downboundCompany"
          placeholder="請輸入公司名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      -->

        <el-select
          clearable
          v-model="queryParams.downboundCompany"
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
      <el-form-item label="起點" prop="downboundOutset">
        <!--
        <el-input
          v-model="queryParams.downboundOutset"
          placeholder="請輸入起點"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->

        <el-select
          clearable
          v-model="queryParams.downboundOutset"
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
      <el-form-item label="堆場" prop="downboundYard">
        <!--
        <el-input
          v-model="queryParams.downboundYard"
          placeholder="請輸入堆場"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->
        <el-select
          clearable
          v-model="queryParams.downboundYard"
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
      <el-form-item label="現金" prop="downboundCash">
        <el-select
          v-model="queryParams.downboundCash"
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

      <el-form-item label="發票" prop="downboundBill">
        <el-select
          v-model="queryParams.downboundBill"
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

      <el-form-item label="貨物名稱" prop="downboundGoods">
        <!--
        <el-input
          v-model="queryParams.downboundGoods"
          placeholder="請輸入貨物名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      -->
        <el-select
          clearable
          v-model="queryParams.downboundGoods"
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
      <el-form-item label="司機出物噸數" prop="downboundGoodsMt">
        <el-input
          v-model="queryParams.downboundGoodsMt"
          placeholder="請輸入貨物噸數"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客戶收貨噸數" prop="downboundGoodsCustomerMt">
        <el-input
          v-model="queryParams.downboundGoodsCustomerMt"
          placeholder="请输入收貨噸數"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="司機單價" prop="downboundGoodsPriceDriver">
        <el-input
          v-model="queryParams.downboundGoodsPriceDriver"
          placeholder="请输入司機單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="扣發票金額(南)" prop="downboundBillTotal">
        <el-input
          v-model="queryParams.downboundBillTotal"
          placeholder="请输入扣發票金額(南)"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司單價" prop="downboundGoodsPrice">
        <el-input
          v-model="queryParams.downboundGoodsPrice"
          placeholder="請輸入公司單價"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="此趟運費" prop="downboundTotal">
        <el-input
          v-model="queryParams.downboundTotal"
          placeholder="請輸入此趟運費"
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
          v-hasPermi="['ks:downbound:add']"
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
          v-hasPermi="['ks:downbound:edit']"
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
          v-hasPermi="['ks:downbound:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:downbound:export']"
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
      :data="downboundList"
      @selection-change="handleSelectionChange"
      class="elTable"
    >
      <el-table-column type="selection" width="55" align="center" />

      <!--
      <el-table-column label="流水號" align="center" prop="id" />
-->

      <el-table-column label="南下單編號" align="center" prop="downboundId" />
      <el-table-column
        label="聯單編號"
        align="center"
        prop="downboundCouponNumber"
      />
      <el-table-column
        label="軟單編號"
        align="center"
        prop="downboundSoftOrderNumber"
      />
      <el-table-column
        label="日期(南下單)"
        align="center"
        prop="downboundDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.downboundDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="司機名稱" align="center" prop="downboundDriver" />
      <el-table-column
        label="車牌號碼"
        align="center"
        prop="downboundLicensePlateNumber"
      />
      <el-table-column
        label="公司名稱"
        align="center"
        prop="downboundCompany"
      />
      <el-table-column label="起點" align="center" prop="downboundOutset" />
      <el-table-column label="堆場" align="center" prop="downboundYard" />

      <el-table-column label="現金" align="center" prop="downboundCash">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.ks_cash"
            :value="scope.row.downboundCash"
          />
        </template>
      </el-table-column>

      <el-table-column label="發票" align="center" prop="downboundBill">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.ks_bill"
            :value="scope.row.downboundBill"
          />
        </template>
      </el-table-column>

      <el-table-column label="貨物名稱" align="center" prop="downboundGoods" />

      <el-table-column
        label="司機出貨噸數"
        align="center"
        prop="downboundGoodsMt"
      />
      <el-table-column
        label="客戶收貨噸數"
        align="center"
        prop="downboundGoodsCustomerMt"
      />
      <el-table-column
        label="司機單價"
        align="center"
        prop="downboundGoodsPriceDriver"
      />
      <el-table-column
        label="扣發票金額(南)"
        align="center"
        prop="downboundBillTotal"
      />
      <el-table-column
        label="公司單價"
        align="center"
        prop="downboundGoodsPrice"
      />
      <el-table-column label="此趟運費" align="center" prop="downboundTotal" />
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
            v-hasPermi="['ks:downbound:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:downbound:remove']"
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

    <!-- 添加或修改南下表單对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="800px"
      :close-on-click-modal="false"
      append-to-body
    >
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item label="南下單編號" prop="downboundId" label-width="120px">
          <el-input
            v-model="form.downboundId"
            style="width: 220px"
            maxlength="12"
            placeholder="南下單編號"
            :disabled="true"
            @input="keyInCheckOrderId(form.downboundId)"
          >
            <!-- 指定前墜 -->
            <template slot="prepend">south -</template>
          </el-input>
        </el-form-item>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="聯單編號"
              prop="downboundCouponNumber"
              label-width="120px"
            >
              <el-input
                v-model="form.downboundCouponNumber"
                style="width: 220px"
                placeholder="請輸入聯單編號"
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="軟單編號"
              prop="downboundSoftOrderNumber"
              label-width="120px"
            >
              <el-input
                v-model="form.downboundSoftOrderNumber"
                style="width: 220px"
                placeholder="請輸入軟單編號"
              />
            </el-form-item>
          </div>
        </div>

        <el-form-item
          label="日期(南下)"
          prop="downboundDate"
          label-width="120px"
        >
          <el-date-picker
            clearable
            size="small"
            v-model="form.downboundDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="選擇日期(南下單)"
          ></el-date-picker>
        </el-form-item>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="司機名稱"
              prop="downboundDriver"
              label-width="120px"
            >
              <el-select
                clearable
                v-model="form.downboundDriver"
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
              prop="downboundLicensePlateNumber"
              label-width="120px"
            >
              <el-select
                clearable
                v-model="form.downboundLicensePlateNumber"
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
              prop="downboundCompany"
              label-width="120px"
            >
              <!--   <el-input v-model="form.downboundCompany" placeholder="請輸入公司名稱" /> -->

              <el-select
                clearable
                v-model="form.downboundCompany"
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
            <el-form-item
              label="起點"
              prop="downboundOutset"
              label-width="60px"
            >
              <el-select
                clearable
                v-model="form.downboundOutset"
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
            <el-form-item label="堆場" prop="downboundYard" label-width="60px">
              <el-select
                clearable
                v-model="form.downboundYard"
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
              prop="downboundGoods"
              label-width="120px"
            >
              <el-select
                clearable
                v-model="form.downboundGoods"
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
            <el-form-item label="現金" prop="downboundCash" label-width="60px">
              <el-select
                v-model="form.downboundCash"
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
            <el-form-item label="票票" prop="downboundBill" label-width="60px">
              <el-select
                v-model="form.downboundBill"
                placeholder="請選擇票票"
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
              prop="downboundGoodsMt"
              label-width="120px"
            >
              <el-input-number
                v-model="form.downboundGoodsMt"
                placeholder="請輸入司機出貨噸數"
                style="width: 220px"
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
              prop="downboundGoodsCustomerMt"
              label-width="120px"
            >
              <el-input-number
                v-model="form.downboundGoodsCustomerMt"
                style="width: 220px"
                placeholder="请输入客戶收貨噸數"
              />
            </el-form-item>
          </div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-form-item
              label="司機單價"
              prop="downboundGoodsPriceDriver"
              label-width="120px"
            >
              <el-input-number
                v-model="form.downboundGoodsPriceDriver"
                placeholder="請輸入司機單價"
                style="width: 220px"
                @change="countMoney"
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="公司單價"
              prop="downboundGoodsPrice"
              label-width="120px"
            >
              <el-input-number
                v-model="form.downboundGoodsPrice"
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
              label="扣發票金額(南)"
              prop="downboundBillTotal"
              label-width="120px"
            >
              <el-input
                v-model="form.downboundBillTotal"
                placeholder="司機噸數 * 司機單價"
                :disabled="true"
                style="width: 220px"
              />
            </el-form-item>
          </div>
          <div style="width: 60%">
            <el-form-item
              label="公司此趟運費"
              prop="downboundTotal"
              label-width="120px"
            >
              <el-input
                v-model="form.downboundTotal"
                placeholder="司機噸數 * 公司單價"
                :disabled="true"
                style="width: 220px"
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
  listDownbound,
  getDownbound,
  delDownbound,
  addDownbound,
  updateDownbound,
} from "@/api/ks/downbound";
import { listUser } from "@/api/ks/employee";
import { listCarid } from "@/api/ks/car";
import { listClientForSelector } from "@/api/ks/client";
import { listGoodsForSelector } from "@/api/ks/goods";
import { listPlaceForSelector } from "@/api/ks/place";

export default {
  name: "Downbound",
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
      // 南下表單表格数据
      downboundList: [],
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
        downboundId: null,
        downboundCouponNumber: null,
        downboundSoftOrderNumber: null,
        downboundDate: null,
        downboundDriver: null,
        downboundLicensePlateNumber: null,
        downboundCompany: null,
        downboundOutset: null,
        downboundYard: null,
        downboundCash: null,
        downboundBill: null,
        downboundGoods: null,
        downboundGoodsMt: null,
        downboundGoodsCustomerMt: null,
        downboundGoodsPriceDriver: null,
        downboundBillTotal: null,
        downboundGoodsPrice: null,
        downboundTotal: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        downboundId: [
          { required: true, message: "南下單編號不能為空", trigger: "blur" },
        ],
        downboundDate: [
          { required: true, message: "日期(南下單)不能為空", trigger: "blur" },
        ],
        downboundDriver: [
          { required: true, message: "司機名稱不能為空", trigger: "blur" },
        ],
        downboundLicensePlateNumber: [
          { required: true, message: "車牌號碼不能為空", trigger: "blur" },
        ],
        downboundCompany: [
          { required: true, message: "公司名稱不能為空", trigger: "blur" },
        ],
        downboundOutset: [
          { required: true, message: "起點不能為空", trigger: "blur" },
        ],
        downboundYard: [
          { required: true, message: "堆場不能為空", trigger: "blur" },
        ],
        downboundCash: [
          { required: true, message: "現金不能為空", trigger: "change" },
        ],
        downboundBill: [
          { required: true, message: "發票不能為空", trigger: "change" },
        ],
        downboundGoodsMt: [
          { required: true, message: "貨物噸數不能為空", trigger: "blur" },
        ],
        downboundGoodsPrice: [
          { required: true, message: "貨物單價不能為空", trigger: "blur" },
        ],
        downboundTotal: [
          { required: true, message: "此趟運費不能為空", trigger: "blur" },
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
    // 輸入表單編號時候加的判斷
    keyInCheckOrderId(value) {
      if (value != null) {
        value = value.replace(/[^\d]/g, ""); // 只能輸入數字
        this.form.downboundId = parseInt(value); // 注意這裡是string，你要數字類型記得自己轉一下
        // console.log(this.form.downboundId);
      }
    },
    // 計算錢錢
    countMoney() {
      let sumPrice =
        this.form.downboundGoodsMt * this.form.downboundGoodsPriceDriver;
      console.log("DriversumPrice", sumPrice);
      // 只保留到小數點2位數 不四捨五入
      let tempVal = parseFloat(sumPrice).toFixed(3);
      let realVal = tempVal.substring(0, tempVal.length - 1);
      this.form.downboundBillTotal = realVal;
    },

    // 計算錢錢
    countMoneyeCompany() {
      let sumPrice = this.form.downboundGoodsMt * this.form.downboundGoodsPrice;
      console.log("CompanysumPrice", sumPrice);
      // 只保留到小數點2位數 不四捨五入
      let tempVal = parseFloat(sumPrice).toFixed(3);
      let realVal = tempVal.substring(0, tempVal.length - 1);
      this.form.downboundTotal = realVal;
    },

    getGoodsList() {
      listGoodsForSelector().then((response) => {
        console.info(response);
        this.goodsList = response;
      });
    },
    getClientList() {
      listClientForSelector().then((response) => {
        console.info(response);
        this.clientList = response;
      });
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
    getPlaceList() {
      listPlaceForSelector().then((response) => {
        console.info("placeList", response);
        this.placeList = response;
      });
    },
    /** 查询南下表單列表 */
    getList() {
      this.loading = true;
      listDownbound(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
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
        downboundCouponNumber: null,
        downboundSoftOrderNumber: null,
        downboundDate: null,
        downboundDriver: null,
        downboundLicensePlateNumber: null,
        downboundCompany: null,
        downboundOutset: null,
        downboundYard: null,
        downboundCash: null,
        downboundBill: null,
        downboundGoods: null,
        downboundGoodsMt: null,
        downboundGoodsCustomerMt: null,
        downboundGoodsCustomerMt: null,
        downboundGoodsPriceDriver: null,
        downboundGoodsPrice: null,
        downboundTotal: null,
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
      this.title = "添加南下表單";
      // 新增預設下拉表單
      this.form.downboundCash = "否";
      this.form.downboundBill = "否";
      // 新增之後給表單的默認值
      // 8000年後失效 因為這個是只要數字的部分 (?)
      // 參考: https://stackoverflow.com/questions/25159330/how-to-convert-an-iso-date-to-the-date-format-yyyy-mm-dd
      // 台北時間+8小時
      this.form.downboundDate = new Date(+new Date() + 8 * 3600 * 1000)
        .toISOString()
        .slice(0, 10);
      // 時間戳記
      this.form.downboundId = this.getdate();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getDownbound(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改南下表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateDownbound(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDownbound(this.form).then((response) => {
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
        .then(function () {
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
          ...this.queryParams,
        },
        `downbound_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
