<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="top" width=417 height=385>
    <div height="300">
        <h2 style="margin-left: 35%;"><span style="background-color:cornflowerblue; color: aliceblue;">쪽지 보내기</span></h2>
    </div>
    
    <div id="box">
    <p>받는사람 : <input type="text" name="수신자" id="수신자" style="padding: 2px;"></p> <br><br>
    <textarea name="" id="" cols="75" rows="30"></textarea><br>
    <button>보내기</button> 
    </div>
    
</div>
<style>
    #box>textarea{
        
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);

    }
    #box>input{
        position: absolute;
        left: 15%;
    }
    button{
        position: absolute;
        left: 50%;
        top: 93%;
        width: 60px;
        height: 30px;
    }
</style>