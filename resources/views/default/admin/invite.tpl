{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            邀请
            <small>Invite</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
                    <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-info"></i> 成功!</h4>

                    <p id="msg-success-p"></p>
                </div>

            </div>
        </div>
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">添加邀请码</h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">邀请码前缀</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="prefix" placeholder="小于8个字符, 可不填">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">邀请码数量</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="num" type="number" placeholder="要生成的邀请码数量">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button id="invite" type="submit" name="action" value="add" class="btn btn-primary">生成</button>
                    </div>

                </div>
            </div>
            <!-- /.box -->
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-rocket"></i>

                        <h3 class="box-title">邀请</h3>
                    </div>
                    <!-- /.box -->
                    <div class="box-header">
                        <h3 class="box-title">我的邀请码</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>###</th>
                                <th>邀请码(点右键复制链接)</th>
                                <th>状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $codes as $code}
                                <tr>
                                    <td><b>{$code->id}</b></td>
                                    <td>
                                        <a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a>
                                    </td>
                                    <td>可用</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type    : "POST",
                url     : "/admin/invite",
                dataType: "json",
                data    : {
                    prefix: $("#prefix").val(),
                    uid   : $("#uid").val(),
                    num   : $("#num").val()
                },
                success : function (data) {
                    if (data.ret) {
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        //window.setTimeout("location.href='/admin/invite'", 2000);
                    }
                    // window.location.reload();
                },
                error   : function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

{include file='admin/footer.tpl'}