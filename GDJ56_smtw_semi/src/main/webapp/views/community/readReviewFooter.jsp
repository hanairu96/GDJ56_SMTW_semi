<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <style>
        /* 지희버튼 css */
         .customBtn {
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
            }
        .btnStyle {
            line-height: 42px;
            padding: 0;
            border: none;
            background: rgba(238, 130, 238, 0.556);
            background: linear-gradient(0deg,  rgba(238, 130, 238, 0.556) 0%, rgba(238, 130, 238, 0.556) 100%);
        }
        .btnStyle:hover {
            color: rgba(238, 130, 238, 0.556);
            background: transparent;
            box-shadow:none;
        }
        .btnStyle:before,.btnStyle:after{
            content:'';
            position:absolute;
            top:0;
            right:0;
            height:2px;
            width:0;
            background: rgba(238, 130, 238, 0.556);
            box-shadow:
            -1px -1px 5px 0px #fff,
            7px 7px 20px 0px #0003,
            4px 4px 5px 0px #0002;
            transition:400ms ease all;
        }
        .btnStyle:after{
            right:inherit;
            top:inherit;
            left:0;
            bottom:0;
        }
        .btnStyle:hover:before,.btnStyle:hover:after{
            width:100%;
            transition:800ms ease all;
        }
    </style>     
    <style>
        /* 댓글입력 폼 */
        .form {
        display: flex;
        flex-direction: column;
        }
        .form textarea {
        resize: none;
        border: 1px solid #d44be054;
        padding: 15px 20px;
        outline: none;
        }
        .form .submit {
        border: 1px solid #d44be054;
        background-color: #d44be054;
        color: #fff;
        padding: 5px;
        cursor: pointer;
        }
    </style>
    <style>
                /* 레이아웃 - 댓글 */
        .comments {
        border: 1px solid #dbdbdb;
        }
        .comments .comment {
        border-bottom: 1px solid #dbdbdb;
        padding: 20px;
        }
        .comments .comment:last-child {
        border-bottom: none;
        }

        /* 상단 메뉴 */
        .top {
        display: flex;
        flex-direction: row;
        align-items: center;
        }
        .top .username {
        font-weight: bold;
        }
        .top .utility {
        display: flex;
        flex-direction: row;
        margin-left: auto;
        }

        /* 하단 메뉴 */
        .bottom {
        display: flex;
        flex-direction: row;
        align-items: center;
        list-style: none;
        padding: 0;
        margin: 0;
        text-transform: uppercase;
        letter-spacing: -0.5px;
        font-weight: bold;
        font-size: 14px;
        }
        .bottom .divider {
        width: 1px;
        height: 20px;
        background-color: #dbdbdb;
        margin: 0 20px;
        }
        .bottom .menu {
        margin: 0;
        padding: 0;
        color: #bebebe;
        }
        .bottom .menu.show-reply {
        color: #333;
        }
    </style>
    <style>
            /* 레이아웃 - 답글 */
    .replies {
    position: relative;
    background-color: #f2f2f2;
    padding-left: 40px;
    padding-right: 20px;
    padding-bottom: 20px;
    }
    .replies:after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 100%;
    background-color: #ddd;
    }
    .replies .reply {
    padding: 20px 0;
    border-bottom: 1px solid #dbdbdb;
    }
    .replies .reply:last-of-type {
    border-bottom: none;
    }
    </style>
    <style>
        section{
            border: 0px solid tomato;
            font-family: "Hahmlet";
            margin-left: 50px;
            margin-right: 50px;
            /* padding-left: 100px; */
            /* padding-right: 100px; */
            /* 
                만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
                좌우 간격을 조정하세요
                왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
             */
            margin-top: 100px;
            height:2000px; 
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
        section>div{
            border: 0px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
    </style>