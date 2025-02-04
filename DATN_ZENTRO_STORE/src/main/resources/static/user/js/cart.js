var app = angular.module("cart-app", [])
app.controller("cart-ctrl", function ($scope, $http) {
    $scope.cart = [];
    $scope.vouchers = [];
    // $scope.productM = {};

    //test
    // $http.get("/san-pham" + maSP).then(r => {
    //     $scope.productM = r.data
    //     console.log($scope.productM.thuongHieu.length)
    //     if (r.data.anh.length > 0) {
    //         for (let i = 1; i < r.data.anh.length; i++) {
    //             $scope.images = $scope.images.concat(r.data.anh[i]);
    //         }
    //     }
    // }).catch(e => {
    //     console.log(e)
    //     alert("Lỗi!")
    // })

    $http.get("/cart/find-all").then(r => {
        console.log(r.data)
        $scope.cart = r.data;
        console.log("soLuong:")
    }).catch(e => console.log(e))

    $scope.updateSl = function (id, soLuong) {
        if (soLuong <= 0) {
            alertify.error("Số lượng phải là số nguyên > 0!!!")
            return
        }
        if (!parseInt(soLuong)) {
            alertify.error("Số lượng phải là số nguyên > 0!!")
            return
        }
        $http.put("/cart/update-sl/" + id + "/" + soLuong).then(function (r){
            console.log(r.data)
            $scope.cart = r.data;
        }).catch(e=>{
            $scope.cart.forEach(c =>{
                if(c.id == id){
                    document.getElementById(c.id).value =  c.soLuong
                }
            })
            alertify.error(e.data.sl)
            console.log(e)
        })
    }
    // $scope.removeProductIncart = function (idCTSP) {
    //     console.log("delete")
    //     alertify.confirm("Xóa sản phẩm khỏi giỏ hàng? ", function () {
    //         $http.delete("/cart/remove/" + idCTSP).then(function (response) {
    //             // alert("Success")
    //             $scope.cart = response.data;
    //             $scope.getTotal();
    //             // let index = $scope.cart.findIndex(c => c.id == idCTSP);
    //             // $scope.cart.slice(index,1)
    //         })
    //     }, function () {})
    // }
    $scope.removeProductIncart = function (idCTSP) {
        console.log("delete");
        alertify.confirm("Xóa sản phẩm khỏi giỏ hàng?", function () {
            $http.delete("/cart/remove/" + idCTSP)
                .then(function (response) {
                    // Thành công
                    $scope.cart = response.data; // Cập nhật lại giỏ hàng
                    $scope.getTotal();          // Tính lại tổng tiền
                })
                .catch(function (error) {
                    console.error("Lỗi khi xóa sản phẩm:", error);
                    alert("Đã xảy ra lỗi khi xóa sản phẩm. Vui lòng thử lại.");
                });
        }, function () {
            // Người dùng chọn "Hủy" trong alertify
            console.log("Người dùng đã hủy xóa.");
        });
    };

    $scope.removeAllProductIncart = function () {
        alertify.confirm("Xóa hết giỏ hàng? ", function () {
            $http.delete("/cart/removeAll").then(function (response) {
                // alert("Success")
                $scope.cart = response.data;
                console.log(response.data())
            })
        }, function () {})
    }
    $scope.getTotal = function () {
        var totalPrice = 0;
        for (let i = 0; i < $scope.cart.length; i++) {
            totalPrice += $scope.cart[i].soLuong * $scope.cart[i].donGiaSauGiam
        }
        return totalPrice;
    }

//    show voucher
    $http.get("/check-out/voucher").then(resp => {
        console.log(resp.data)
        $scope.vouchers = resp.data;
    }).catch(error => {
        console.log(error)
    })

    $scope.showDetails = function (index) {
        $scope.selectedVoucher = $scope.vouchers[index];
    };

    $scope.hideDetails = function () {
        $scope.selectedVoucher = null;
    };

})



