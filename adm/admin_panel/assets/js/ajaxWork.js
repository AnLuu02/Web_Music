document.querySelectorAll('#mySidebar a').forEach(item => {
    item.addEventListener('click', e => {
        document.querySelector('#mySidebar a.active').classList.remove('active');
        e.target.classList.add('active');
        document.querySelector('.title_page').innerHTML = e.target.textContent;
    })
})

document.querySelectorAll('.card').forEach(item => {
    item.addEventListener('click', function() {
        if (this.getAttribute('id') === "totalUser") {
            document.querySelector('#mySidebar a.active').classList.remove('active');
            document.querySelector('#mySidebar a[key="user"]').classList.add('active');
            document.querySelector('.title_page').innerHTML = "Users";
            showUser();
        }
        if (this.getAttribute('id') === "totalMusic") {
            document.querySelector('#mySidebar a.active').classList.remove('active');
            document.querySelector('#mySidebar a[key="music"]').classList.add('active');
            document.querySelector('.title_page').innerHTML = "Musics";
            showMusics();
        }
        if (this.getAttribute('id') === "totalUploaded") {
            document.querySelector('#mySidebar a.active').classList.remove('active');
            document.querySelector('#mySidebar a[key="uploaded"]').classList.add('active');
            document.querySelector('.title_page').innerHTML = "Uploaded";
            showUploaded();
        }
    })
})

function showMusics() {
    $(document.body).removeClass("modal-open");
    $(".modal-backdrop").remove();
    $('.modal').modal('hide');
    $.ajax({
        url: "./adminView/viewAllMusics.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);

        }
    });
}



function showUser() {
    $.ajax({
        url: "./adminView/viewUser.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function showTrending() {
    $.ajax({
        url: "./adminView/viewTrending.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function showUploaded() {
    $.ajax({
        url: "./adminView/viewAllUploaded.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function showDetails(id) {
    $.ajax({
        url: "./adminView/viewDetails.php",
        method: "post",
        data: { id: id },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

//add product data
function addItems(e) {
    e.preventDefault();
    var m_name = $('#m_name').val();
    var m_artist = $('#m_a_name').val();
    var m_time = $('#m_time').val();
    var m_nation = $('#m_nation').val();
    var m_category = $('#m_category').val();
    var fileUploadIcon = $('#m_fileUploadIcon')[0].files[0];
    var fileUploadMusic = $('#m_fileUploadMusic')[0].files[0];
    var upload = $('#upload').val();

    var fd = new FormData();
    fd.append('m_name', m_name);
    fd.append('m_artist', m_artist);
    fd.append('m_time', m_time);
    fd.append('m_category', m_category);
    fd.append('m_nation', m_nation);
    fd.append('fileUploadIcon', fileUploadIcon);
    fd.append('fileUploadMusic', fileUploadMusic);
    fd.append('upload', upload);

    $.ajax({
        url: "./controller/addItemController.php",
        method: "post",
        data: fd,
        processData: false,
        contentType: false,
        success: function(data) {
            if (data == "success") {
                showMusics();
                alert('Thêm bài hát thành công.');
                $('form').trigger('reset');
                $('#myModal').modal('hide')

            } else {
                showMusics();
                alert('Đã có lỗi xảy ra.');
                $('form').trigger('reset');
                $('#myModal').modal('hide')

            }
        }
    });
}

function getAllDetails(id) {
    $.get(`./controller/getAllDetails.php?u_id=${id}&action=getDetails`, {}, function(res) {
        let data = JSON.parse(res);
        if (data.error === 0) {
            $("#lb h4").html(`PLaylist: ${data.details[0]}`);
            $("#pl h4").html(`Library: ${data.details[1]}`);
            $("#ul h4").html(`Upload: ${data.details[2]}`);
        } else {
            alert(data.message);
        }
    })
}

function oldDataMusic(id) {
    $.get(`./controller/getOldMusic.php?m_id=${id}&action=getMusic`, {}, function(res) {
        let data = JSON.parse(res);
        if (data.error === 0) {
            for (let i of data.dataMusic) {
                $("#m_edit_id").val(i.m_id);
                $('#m_edit_name').val(i.name);
                $('#m_edit_a_name').val(i.artist);
                $('#m_edit_time').val(i.time);
                $('#m_edit_nation').val(i.nation);
                $('#m_edit_category').val(i.category);
                $('#old_edit_Icon').val(i.img);
                $('#old_edit_Video').val(i.src);
            }
        } else {
            alert(data.message);
        }
    })
}
//update product after submit
function updateItems() {

    var m_edit_id = $("#m_edit_id").val();
    var m_edit_name = $('#m_edit_name').val();
    var m_edit_artist = $('#m_edit_a_name').val();
    var m_edit_time = $('#m_edit_time').val();
    var m_edit_nation = $('#m_edit_nation').val();
    var m_edit_category = $('#m_edit_category').val();
    var fileUploadIcon = $('#m_edit_fileUploadIcon')[0].files[0];
    var oldIcon = $('#old_edit_Icon').val();
    var fileUploadMusic = $('#m_edit_fileUploadMusic')[0].files[0];
    var oldVideo = $('#old_edit_Video').val();

    var fd = new FormData();
    fd.append('m_id', m_edit_id);
    fd.append('m_name', m_edit_name);
    fd.append('m_artist', m_edit_artist);
    fd.append('m_time', m_edit_time);
    fd.append('m_category', m_edit_category);
    fd.append('m_nation', m_edit_nation);

    fd.append('fileUploadIcon', fileUploadIcon);
    fd.append('old_edit_Icon', oldIcon);

    fd.append('fileUploadMusic', fileUploadMusic);
    fd.append('old_edit_Video', oldVideo);

    $.ajax({
        url: './controller/updateItemController.php',
        method: 'post',
        data: fd,
        processData: false,
        contentType: false,
        success: function(res) {
            let data = JSON.parse(res);
            if (data.error === 0) {
                showMusics();
                alert(data.message);
                $('form').trigger('reset');
                $('#modalEdit').modal('hide')
            } else {
                showMusics();
                alert(data.message);
                $('form').trigger('reset');
                $('#modalEdit').modal('hide')
            }
        }
    });
}

//delete product data
function itemDelete(id) {
    $("#allowDel").attr('id_del', id);
    $("#allowDel").click(function(e) {
        e.preventDefault();
        $.ajax({
            url: "./controller/deleteItemController.php",
            method: "post",
            data: { "m_id": id },
            success: function(data) {
                if (data == 'success') {
                    if ($(e.target).attr('category') === "uploaded") {
                        showUploaded();
                        alert('Xóa thành công.');
                        $('form').trigger('reset');
                        $('#staticBackdrop').modal('hide')
                    } else {
                        showMusics();
                        alert('Xóa thành công.');
                        $('form').trigger('reset');
                        $('#staticBackdrop').modal('hide')
                    }
                } else {
                    alert('Đã có lỗi xảy ra.');
                    $('form').trigger('reset');
                    $('#staticBackdrop').modal('hide')
                }
            }
        });
    })



}




//delete user
function deleteUser(id) {
    $("#allowDel").attr('id_del', id);
    $("#allowDel").click(function(e) {
        e.preventDefault();
        let id = $(e.target).attr('id_del');
        $.ajax({
            url: "./controller/deleteUser.php",
            method: "post",
            data: { "u_id": id },
            success: function(data) {
                console.log(data);
                if (data == 'success') {
                    alert('Xóa người dùng thành công.');
                    $('#staticBackdrop').modal('hide')
                    $('form').trigger('reset');
                    showUser();
                } else {
                    alert('Đã có lỗi xảy ra.');
                    $('#staticBackdrop').modal('hide')
                    $('form').trigger('reset');
                    showUser();
                }
            }
        });
    })
}

function logout(id) {
    $.ajax({
        url: "../../controller/logout.php",
        method: "post",
        data: { "id": id },
        success: function(data) {
            $(location).attr('href', '../../index.php');
        }
    });
}

// search
document.getElementById('searchAdmin').addEventListener('keyup', e => {
    let searchVal = e.target.value;
    let currentKey = document.querySelector('#mySidebar a.active').getAttribute('key');
    console.log(currentKey);
    if (searchVal !== '') {
        $.ajax({
            url: "./adminView/viewSearch.php",
            method: "POST",
            data: { "value": searchVal, "key": currentKey },
            success: function(data) {
                document.querySelector('.title_page').innerHTML = "Search";
                $('.allContent-section').html(data);
            }
        });
    } else {
        if (currentKey === 'user') {
            showUser();
        } else if (currentKey == 'music') {
            showMusics();
        } else {
            location.href = './index.php';
        }
    }

})