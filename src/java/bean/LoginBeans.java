/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.io.Serializable;

/**
 *
 * @author emam
 */
public class LoginBeans implements Serializable{
    private String userId ;
     
     private String token;
     private String unitId;
     private String expire;
     private String username;
     private String steptype;
     
     public void setStepType(String s){
         this.steptype=s;
     }
     
     public String getStepType(){
         return steptype;
     }
     
     public void setUserId(String userId){
         this.userId=userId;
     }
     
     public String getUserId(){
         return userId;
     }
     
    
     
     public void setTokenId(String token){
         this.token=token;
     }
     
     public String getToken(){
         return token;
     }
     
     public void setUnitId(String unitId){
         this.unitId=unitId;
     }
     
     public String getUnitId(){
         return unitId;
     }
     
     public void setExpire(String expire){
         this.expire=expire;
     }
     
     public String getExpire(){
         return expire;
     }
     
     public void setUsername(String username){
         this.username=username;
     }
     
     public String getUsername(){
         return username;
     }
     
}
