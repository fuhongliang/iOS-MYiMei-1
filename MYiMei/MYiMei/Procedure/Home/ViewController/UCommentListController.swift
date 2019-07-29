//
//  UCommentListController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
import SCLAlertView
import JXSegmentedView

class UCommentListController: UBaseViewController {
    
    
    fileprivate var service = APICommentServices()
    
    private var commentList = CommentsListModel()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    var alert:SCLAlertView? = nil
    let replyBtn = UIButton()
    let cancleBtn = UIButton()
    let inputReplyTF = UITextView(frame: CGRect(x: 0, y: 0, width: 180, height: 35))
    
    var commentType = 0
    var commentId = ""
    
    //用来记录当前是否允许加载新数据（加载的时候会将其设为false，防止重复加载）
    var loadMoreEnable = true
    //记录当前加载到哪一页
    var pageRecord = 1
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.showsVerticalScrollIndicator = false
        tw.delegate = self
        tw.dataSource = self
        
        tw.estimatedRowHeight = 200
        tw.rowHeight = UITableView.automaticDimension
        
        tw.uempty = UEmptyView { [weak self] in self?.getCommentList() }
        tw.register(cellType: UHomeEvaluationCell.self)
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "正在刷新订单数据...")
        tableView.refreshControl?.addTarget(self, action: #selector(refreshCommentData), for: .valueChanged)
        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        getCommentList()
        
    }
    
    func getCommentList(){
        service.getCommentList(type: commentType,page: pageRecord, { (CommentsResponseModel) in
            self.commentList = CommentsResponseModel.data
            self.tableView.reloadData()
            
            if (self.pageRecord != 1) {
                self.commentList.comment.append(contentsOf: CommentsResponseModel.data.comment)
            } else {
                self.commentList = CommentsResponseModel.data
                self.tableView.refreshControl?.endRefreshing()
            }
            
            if(CommentsResponseModel.data.comment.count >= 20){
                self.loadMoreEnable = true
            } else {
                self.loadMoreEnable = false
                self.activity.stopAnimating()
            }
            
            self.tableView.uempty?.allowShow = true
            self.tableView.reloadData()
            self.pageRecord += 1
            
        }) { (APIErrorModel) in
            print(APIErrorModel.msg ?? ".............")
        }
    }
    
    @objc func refreshCommentData() {
        pageRecord = 1
        getCommentList()
    }
    
}

extension UCommentListController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard commentList.comment == nil else {
            return commentList.comment.count
        }
        return 0
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK:cell头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 16 : CGFloat.leastNormalMagnitude
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UHomeEvaluationCell.self)
        
        cell.model = commentList.comment[indexPath.section]
        
        cell.replyComment = {
            self.commentId = String(self.commentList.comment[indexPath.section].id)
            self.configAlertView()
        }
        cell.hideComment = {
            self.commentId = String(self.commentList.comment[indexPath.section].id)
            self.service.delOrHideComment(commentId: self.commentId, delOrhide: 1, delete: 0, {
                showHUDInView(text: "隐藏成功", inView: self.view)
            }, { (APIErrorModel) in
                showHUDInView(text: "隐藏失败", inView: self.view)
            })
        }
        cell.deleteComment = {
            self.commentId = String(self.commentList.comment[indexPath.section].id)
            self.service.delOrHideComment(commentId: self.commentId, delOrhide: 1, delete: 1, {
                showHUDInView(text: "删除成功", inView: self.view)
            }, { (APIErrorModel) in
                showHUDInView(text: "删除失败", inView: self.view)
            })
        }
        return cell
    }
    
    //MARK:每个cell即将显示时回调  在这里处理section的圆角
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let cornerRadius: CGFloat = 6.0
        cell.backgroundColor = UIColor.clear

        let layer = CAShapeLayer()
        let backgroundLayer = CAShapeLayer()
        let pathRef = CGMutablePath()
        let bounds = cell.bounds;

        pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)

        layer.path = pathRef
        backgroundLayer.path = pathRef
        layer.fillColor = UIColor.white.cgColor

        let roundView = UIView(frame: bounds)
        roundView.layer.insertSublayer(layer, at: 0)
        roundView.backgroundColor = UIColor.clear
        cell.backgroundView = roundView

    }
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {

        //当下拉到底部，执行loadMore()
        if (loadMoreEnable && section == commentList.comment.count-1) {
            getCommentList()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (commentList.comment.count != 1 && section == commentList.comment.count-1){
            return 35
        }
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (commentList.comment.count != 1 && section == commentList.comment.count-1){
            return loadMoreView
        }
        return nil
    }
    
    func configLoadMoreView() {
        loadMoreView.frame = CGRect(x:0, y:self.tableView.contentSize.height, width:self.tableView.bounds.size.width, height:45)
        loadMoreView.backgroundColor = UIColor.background
        loadMoreView.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        //添加环形进度条
        activity.color = UIColor.black
        activity.startAnimating()
        
        loadMoreView.addSubview(activity)
        activity.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.centerX.equalToSuperview()
        }
        activity.hidesWhenStopped = true
    }
    
    func configAlertView(){
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            hideWhenBackgroundViewIsTapped:true,
            buttonsLayout: .horizontal
        )
        
        // Initialize SCLAlertView using custom Appearance
        alert = SCLAlertView(appearance: style)
        // Creat the subview
        alert?.viewWillAppear(true)
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 160))
        
        //运费价格输入框
        inputReplyTF.text = ""
        inputReplyTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputReplyTF.layer.borderWidth = 1
        inputReplyTF.layer.cornerRadius = 2
        subview.addSubview(inputReplyTF)
        inputReplyTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.height.equalTo(160)
            ConstraintMaker.width.equalToSuperview().inset(15)
            ConstraintMaker.top.equalToSuperview()
        })
        
        _ = alert?.addButton("取消", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#1C98F6"), target:self, selector:#selector(cancle))
        _ = alert?.addButton("确定", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#07D781"), target:self, selector:#selector(replyComment))
        
        alert?.customSubview = subview
        
        alert?.showEdit("回复", subTitle: "",animationStyle:.noAnimation)
        
    }
    
    //回复
    @objc func replyComment(){
        let content = inputReplyTF.text ?? ""
        //调回复接口
        service.replyComment(commentId: commentId, replyContent: content, {
            showHUDInView(text: "回复成功", inView: self.view)
            self.alert?.hideView()
            self.refreshCommentData()
        }) { (APIErrorModel) in
            showHUDInView(text: "回复失败", inView: self.view)
        }
    }
    
    //取消
    @objc func cancle(){
        alert?.hideView()
    }
    
}

extension UCommentListController : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
