<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="120px"
    >
      <el-form-item label="地點編號" prop="placeId">
        <el-input
          v-model="queryParams.placeId"
          placeholder="請輸入地點編號"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="地點名稱" prop="placeName">
        <el-input
          v-model="queryParams.placeName"
          placeholder="請輸入地點名稱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="地點類型" prop="placeType">
        <el-select
          v-model="queryParams.placeType"
          placeholder="請選擇地點類型"
          clearable
          size="small"
        >
          <el-option
            v-for="dict in dict.type.ks_place"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="場地負責人" prop="placePrincipal">
        <el-input
          v-model="queryParams.placePrincipal"
          placeholder="請輸入場地負責人"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="負責人電話" prop="placePrincipalTel">
        <el-input
          v-model="queryParams.placePrincipalTel"
          placeholder="請輸入負責人電話"
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
          v-hasPermi="['ks:place:add']"
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
          v-hasPermi="['ks:place:edit']"
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
          v-hasPermi="['ks:place:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ks:place:export']"
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
      :data="placeList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="流水號" align="center" prop="id" />
      <el-table-column label="地點編號" align="center" prop="placeId" />
      <el-table-column label="地點名稱" align="center" prop="placeName" />
      <el-table-column label="地點類型" align="center" prop="placeType">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.ks_place"
            :value="scope.row.placeType"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="場地負責人"
        align="center"
        prop="placePrincipal"
      />
      <el-table-column
        label="負責人電話"
        align="center"
        prop="placePrincipalTel"
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
            v-hasPermi="['ks:place:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ks:place:remove']"
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

    <!-- 添加或修改地點表單对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="地點編號" prop="placeId">
          <el-input v-model="form.placeId" placeholder="請輸入地點編號" />
        </el-form-item>
        <el-form-item label="地點名稱" prop="placeName">
          <el-input v-model="form.placeName" placeholder="請輸入地點名稱" />
        </el-form-item>
        <el-form-item label="地點類型" prop="placeType">
          <el-select v-model="form.placeType" placeholder="請選擇地點類型">
            <el-option
              v-for="dict in dict.type.ks_place"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="場地負責人" prop="placePrincipal">
          <el-input
            v-model="form.placePrincipal"
            placeholder="請輸入場地負責人"
          />
        </el-form-item>
        <el-form-item label="負責人電話" prop="placePrincipalTel">
          <el-input
            v-model="form.placePrincipalTel"
            placeholder="請輸入負責人電話"
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
  listPlace,
  getPlace,
  delPlace,
  addPlace,
  updatePlace,
} from "@/api/ks/place";

export default {
  name: "Place",
  dicts: ["ks_place"],
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
      // 地點表單表格数据
      placeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        placeId: null,
        placeName: null,
        placeType: null,
        placePrincipal: null,
        placePrincipalTel: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        placeId: [
          { required: true, message: "地點編號不能为空", trigger: "blur" },
        ],
        placeType: [
          { required: true, message: "地點類型不能为空", trigger: "change" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询地點表單列表 */
    getList() {
      this.loading = true;
      listPlace(this.queryParams).then((response) => {
        this.placeList = response.rows;
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
        placeId: null,
        placeName: null,
        placeType: null,
        placePrincipal: null,
        placePrincipalTel: null,
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
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加地點表單";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getPlace(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改地點表單";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updatePlace(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPlace(this.form).then((response) => {
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
        .confirm('是否确认删除地點表單编号为"' + ids + '"的数据项？')
        .then(function () {
          return delPlace(ids);
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
        "ks/place/export",
        {
          ...this.queryParams,
        },
        `place_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
