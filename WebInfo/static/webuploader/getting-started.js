


// 图片上传demo
jQuery(function() {
    var $ = jQuery,
        //$list = $('#fileList'),
        //// 优化retina, 在retina下这个值是2
        //ratio = window.devicePixelRatio || 1,

        // 缩略图大小
        //thumbnailWidth = 100 * ratio,
        //thumbnailHeight = 100 * ratio,

        // Web Uploader实例
        uploader;

    // 初始化Web Uploader
    uploader = WebUploader.create({

        // 自动上传。
        auto: true,

        // swf文件路径
        swf: 'static/webuploader/Uploader.swf',

        server: 'WebApi.ashx',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#upimgfile',
        fileNumLimit:15,

        // 只允许选择文件，可选。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });

    // 当有文件添加进来的时候
    //uploader.on('fileQueued', function () {
    //    debugger;
    //    if ($("#piclist li").length > 2) {
    //        alert("最多只能上传15张图片");
    //        return false;
    //    }


    //});

    // 文件上传过程中创建进度条实时显示。
    //uploader.on( 'uploadProgress', function( file, percentage ) {
    //    var $li = $( '#'+file.id ),
    //        $percent = $li.find('.progress span');

    //    // 避免重复创建
    //    if ( !$percent.length ) {
    //        $percent = $('<p class="progress"><span></span></p>')
    //                .appendTo( $li )
    //                .find('span');
    //    }

    //    $percent.css( 'width', percentage * 100 + '%' );
    //});

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on('uploadSuccess', function (file,data) {
        debugger;

        if (data.Error != null) {
            alert( data.Error);
        } else {
            var tempid = data.img.substring(data.img.lastIndexOf('/') + 1, data.img.indexOf('.'));
            var li = "<li id='" + tempid + "'><img name='p_pics' src='" + data.img + "' /><p><a href=\"javascript:delimg('" + tempid + "')\" > 删除</a></p></li>";
            $("#piclist").append(li);
        }

        //$( '#'+file.id ).addClass('upload-state-done');
    });

    //// 文件上传失败，现实上传出错。
    //uploader.on( 'uploadError', function( file ) {
    //    var $li = $( '#'+file.id ),
    //        $error = $li.find('div.error');

    //    // 避免重复创建
    //    if ( !$error.length ) {
    //        $error = $('<div class="error"></div>').appendTo( $li );
    //    }

    //    $error.text('上传失败');
    //});

    //// 完成上传完了，成功或者失败，先删除进度条。
    //uploader.on( 'uploadComplete', function( file ) {
    //    $( '#'+file.id ).find('.progress').remove();
    //});
});