<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          測試公告第一條
          <br />
        </blockquote>

        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>凱盛管理系統</h2>
        <p>
        TTTEEESSSTTTT
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
      
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>JWT</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>常用公告</span>
          </div>
          <div class="body">
            <p>

            </p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>更新公告</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v3.8.1 - 2022-01-01">
              <ol>
                <li>新增Vue3前端代码生成模板</li>
                <li>新增图片预览组件</li>
                <li>新增压缩插件实现打包Gzip</li>
                <li>自定义xss校验注解实现</li>
                <li>自定义文字复制剪贴指令</li>
                <li>代码生成预览支持复制内容</li>
                <li>路由支持单独配置菜单或角色权限</li>
                <li>用户管理部门查询选择节点后分页参数初始</li>
                <li>修复用户分配角色属性错误</li>
                <li>修复打包后字体图标偶现的乱码问题</li>
                <li>修复菜单管理重置表单出现的错误</li>
                <li>修复版本差异导致的懒加载报错问题</li>
                <li>修复Cron组件中周回显问题</li>
                <li>修复定时任务多参数逗号分隔的问题</li>
                <li>修复根据ID查询列表可能出现的主键溢出问题</li>
                <li>修复tomcat配置参数已过期问题</li>
                <li>升级clipboard到最新版本2.0.8</li>
                <li>升级oshi到最新版本v5.8.6</li>
                <li>升级fastjson到最新版1.2.79</li>
                <li>升级spring-boot到最新版本2.5.8</li>
                <li>升级log4j2到2.17.1，防止漏洞风险</li>
                <li>优化下载解析blob异常提示</li>
                <li>优化代码生成字典组重复问题</li>
                <li>优化查询用户的角色组&岗位组代码</li>
                <li>优化定时任务cron表达式小时设置24</li>
                <li>优化用户导入提示溢出则显示滚动条</li>
                <li>优化防重复提交标识组合为(key+url+header)</li>
                <li>优化分页方法设置成通用方便灵活调用</li>
                <li>其他细节优化</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>備忘錄</span>
          </div>
          <div class="body">
            <img
              src="https://i.imgur.com/sPLQWGh.png"
              alt="donate"
              width="100%"
            />
            <span style="display: inline-block; height: 30px; line-height: 30px"
              >$$$$$$$$$$$$$$$$$$$$$</span
            >
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.1",
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

