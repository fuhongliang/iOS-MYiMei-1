//
//  APIGoodsServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIGoodsServicesProtocol {
    //MARK:添加商品分类
    func addGoodsCat(name: String, sort: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:删除商品分类
    func deleteGoodsCat(catId: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:编辑商品分类
    func editGoodsCat(catId: Int,name: String, sort: Int, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:上下架商品
    func modifyGoodsStatus(mch_id: Int,goods_id: Int,status: Int, access_token: String, _ success: @escaping(((APIListModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:获取分类
    func getCategory(mch_id: Int, access_token: String, _ success: @escaping(((CategoryResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //MARK:删除商品
    func deleteGoods(mch_id: Int,goods_id: Int, access_token: String, _ success: @escaping(((APIListModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:获取商品列表协议
    func getGoodsList(mch_id: Int,cat_id: Int, access_token: String, _ success: @escaping(((GoodsResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
}

class APIGoodsServices: APIGoodsServicesProtocol {
    
    func editGoodsCat(catId: Int, name: String, sort: Int, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id ?? 0,
            "access_token":String(APIUser.shared.user?.access_token ?? ""),
            "cat_id":catId,
            "name":name,
            "sort":sort,
            "is_debug":"1"
        ]
        APIService.shared.request(.editGoodsCat(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    
    func deleteGoodsCat(catId: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(APIUser.shared.user?.mch_id ?? 0),
            "access_token":String(APIUser.shared.user?.access_token ?? ""),
            "cat_id":catId,
            "is_debug":"1"
        ]
        APIService.shared.request(.deleteGoodsCat(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    
    func addGoodsCat(name: String, sort: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(APIUser.shared.user?.mch_id ?? 0),
            "access_token":String(APIUser.shared.user?.access_token ?? ""),
            "name":name,
            "sort":sort,
            "is_debug":"1"
        ]
        APIService.shared.request(.addGoodsCat(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }

    func modifyGoodsStatus(mch_id: Int, goods_id: Int, status: Int, access_token: String, _ success: @escaping (((APIListModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "goods_id":String(goods_id),
            "status":String(status),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.modifyGoodsStatus(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(APIListModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }

    func deleteGoods(mch_id: Int, goods_id: Int, access_token: String, _ success: @escaping (((APIListModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "goods_id":String(goods_id),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.deleteGoods(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(APIListModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }

    }

    func getGoodsList(mch_id: Int, cat_id: Int, access_token: String, _ success: @escaping (((GoodsResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
             "cat_id":String(cat_id),
            "access_token":access_token,
            "is_debug":"1"
        ]

        APIService.shared.request(.getGoodsList(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(GoodsResponeModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }

    func getCategory(mch_id: Int, access_token: String, _ success: @escaping (((CategoryResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.getCategory(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(CategoryResponeModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
}
