<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품 업로드</title>
<link rel="stylesheet" type="text/css" href="../css/addgoods.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="../img/admin_icon.ico">
</head>
<body>
	<div class="wrap">
		<div class="box">
			<h3>상품 업로드</h3>
			<menu>
				<ul>
					<li><a class="adminlink"
						href="${pageContext.request.contextPath}/AD-Page/adHome.spm">홈</a></li>
					<li><a class="adminlink" href="#" onclick="logout();">로그아웃</a></li>
				</ul>
			</menu>

			<hr>
			<form
				action="${pageContext.request.contextPath }/AD-Page/ADDgoodsOk.spm?category="
				method="post" name="listForm" enctype="multipart/form-data">
				<table id="addgoods-list">
					<colgroup>
						<col width="190">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<td>상품 이미지 파일(.png)</td>
							<td>
								<div class="filebox">
									<input class="upload-name" id="upload-name" value="첨부할 파일을 드래그 앤 드롭 하세요"
										accept="image/*" readonly> <label for="file">파일찾기</label> <input
										type="file" id="file" name="file">
								</div>
							</td>
						</tr>
						<tr>
							<td>상품 상세설명<br>이미지 파일(.png)
							</td>
							<td>
								<div class="filebox">
									<input class="upload-name2" id="upload-name2" value="첨부할 파일을 드래그 앤 드롭 하세요"
										accept="image/*" readonly> <label for="file2">파일찾기</label> <input
										type="file" id="file2" name="file2">
								</div>
							</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><select name="catg">
									<option value="">-----------------------------카테고리를
										선택하세요-----------------------------</option>
									<option value="냉장고">냉장고</option>
									<option value="세탁기">세탁기</option>
									<option value="TV">TV</option>
									<option value="에어컨">에어컨</option>
									<option value="컴퓨터">컴퓨터</option>
							</select></td>
						</tr>
						<tr>
							<td>모델명</td>
							<td><input type="text" name="modelcode"></td>
						</tr>
						<tr>
							<td>브랜드명</td>
							<td><input type="text" name="brand"></td>
						</tr>
						<tr>
							<td>상품 크기</td>
							<td><input type="text" name="size"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="price" numberOnly></td>
						</tr>
						<tr>
							<td>기타정보<br>(용량/세탁용량/종류<br>/냉방면적/무게)
							</td>
							<td><input type="text" name="etc"></td>
						</tr>
						<tr>
							<td>재고량</td>
							<td><input type="text" name="stock" numberOnly></td>
						</tr>
					</tbody>
				</table>
				<br>

				<div id="btn_div">
					<input type="button" id="add_btn" value="추가하기"
						onclick="addgoods();">
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	//로그아웃
	function logout() {
		alert('로그아웃되었습니다.');
		location.href = '${pageContext.request.contextPath}/main/sessionInitialization.jsp'
	}
	
	//가격, 재고량 숫자만 기입되게 함
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	//상품 추가 조건
	function addgoods() {
		let f = document.listForm;

		if (f.file.value == '') {
			alert("상품 이미지 파일을 첨부하세요.");
			return false;
		}
		if (f.file2.value == '') {
			alert("상품 상세설명 이미지 파일을 첨부하세요.");
			return false;
		}
		if (f.name.value == '') {
			alert("상품명을 입력하세요.");
			return false;
		}
		if (f.catg.value == '') {
			alert("카테고리를 선택하세요.");
			return false;
		}
		if (f.modelcode.value == '') {
			alert("상품 모델명을 입력하세요.");
			return false;
		}
		if (f.brand.value == '') {
			alert("상품 브랜드명을 입력하세요.");
			return false;
		}
		if (f.size.value == '') {
			alert("상품 크기를 입력하세요.");
			return false;
		}
		if (f.price.value == '') {
			alert("상품 가격을 입력하세요.");
			return false;
		}
		if (f.etc.value == '') {
			alert("상품 기타정보를 입력하세요.");
			return false;
		}
		if (f.stock.value == '') {
			alert("상품 재고량을 입력하세요.");
			return false;
		}

		if (!confirm("해당 상품을 데이터베이스에 업로드하겠습니까?"))
			return false;

		f.action = "${pageContext.request.contextPath }/AD-Page/ADDgoodsOk.spm?category="
				+ f.catg.value;
		f.submit();
	}
	
	//파일 드래그앤 드롭 기능 (참고: http://yoonbumtae.com/?p=3225)
    (function() {
        
        var $file = document.getElementById("file")
        var dropZone = document.querySelector(".upload-name")
        var toggleClass = function(className) {
            
            var list = ["dragenter", "dragleave", "dragover", "drop"]
            for (var i = 0; i < list.length; i++) {
                if (className === list[i]) {
                    dropZone.classList.add("upload-name-" + list[i])
                } else {
                    dropZone.classList.remove("upload-name-" + list[i])
                }
            }
        }
        
        var showFiles = function(files) {
            dropZone.value = ""
            for(var i = 0, len = files.length; i < len; i++) {
                dropZone.value = files[i].name
            }
        }

        var selectFile = function(files) {
            // input file 영역에 드랍된 파일들로 대체
            $file.files = files
            showFiles($file.files)
        }
        
        $file.addEventListener("change", function(e) {
            showFiles(e.target.files)
        })

        // 드래그한 파일이 최초로 진입했을 때
        dropZone.addEventListener("dragenter", function(e) {
            e.stopPropagation()
            e.preventDefault()

            toggleClass("dragenter")
            this.style.backgroundColor = "#D9D9D9"
        })

        // 드래그한 파일이 dropZone 영역을 벗어났을 때
        dropZone.addEventListener("dragleave", function(e) {
            e.stopPropagation()
            e.preventDefault()

            toggleClass("dragleave")
            this.style.backgroundColor = "white"

        })

        // 드래그한 파일이 dropZone 영역에 머물러 있을 때
        dropZone.addEventListener("dragover", function(e) {
            e.stopPropagation()
            e.preventDefault()

            toggleClass("dragover")
            this.style.backgroundColor = "#D9D9D9"
        })

        // 드래그한 파일이 드랍되었을 때
        dropZone.addEventListener("drop", function(e) {
            e.preventDefault()

            toggleClass("drop")
            this.style.backgroundColor = "white"

            var files = e.dataTransfer && e.dataTransfer.files
            console.log(files)
            
            if (files != null) {
                if (files.length < 1) {
                    alert("폴더 업로드 불가")
                    return
                }
                selectFile(files)
            } else {
                alert("ERROR")
            }

        })

    })();
	
    (function() {
        
        var $file = document.getElementById("file2")
        var dropZone = document.querySelector(".upload-name2")
        var toggleClass = function(className) {
            
            var list = ["dragenter", "dragleave", "dragover", "drop"]
            for (var i = 0; i < list.length; i++) {
                if (className === list[i]) {
                    dropZone.classList.add("upload-name2-" + list[i])
                } else {
                    dropZone.classList.remove("upload-name2-" + list[i])
                }
            }
        }
        
        var showFiles = function(files) {
            dropZone.value = ""
            for(var i = 0, len = files.length; i < len; i++) {
                dropZone.value = files[i].name
            }
        }

        var selectFile = function(files) {
            // input file 영역에 드랍된 파일들로 대체
            $file.files = files
            showFiles($file.files)
        }
        
        $file.addEventListener("change", function(e) {
            showFiles(e.target.files)
        })

        // 드래그한 파일이 최초로 진입했을 때
        dropZone.addEventListener("dragenter", function(e) {
            e.stopPropagation()
            e.preventDefault()

            toggleClass("dragenter")
            this.style.backgroundColor = "#D9D9D9"
        })

        // 드래그한 파일이 dropZone 영역을 벗어났을 때
        dropZone.addEventListener("dragleave", function(e) {
            e.stopPropagation()
            e.preventDefault()

            toggleClass("dragleave")
            this.style.backgroundColor = "white"

        })

        // 드래그한 파일이 dropZone 영역에 머물러 있을 때
        dropZone.addEventListener("dragover", function(e) {
            e.stopPropagation()
            e.preventDefault()

            toggleClass("dragover")
            this.style.backgroundColor = "#D9D9D9"
        })

        // 드래그한 파일이 드랍되었을 때
        dropZone.addEventListener("drop", function(e) {
            e.preventDefault()

            toggleClass("drop")
            this.style.backgroundColor = "white"

            var files = e.dataTransfer && e.dataTransfer.files
            console.log(files)
            
            if (files != null) {
                if (files.length < 1) {
                    alert("폴더 업로드 불가")
                    return
                }
                selectFile(files)
            } else {
                alert("ERROR")
            }

        })

    })();	
</script>
</html>