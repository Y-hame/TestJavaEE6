package com.testjavaee6;

import javax.jms.Session;
import javax.servlet.http.HttpSession;
public class Counter {
    private  int count;
    public Counter(){
         count = 0;
    }

    public int getCount(HttpSession session){
        if(session.isNew()){
            count =1;
        }else {
            count ++;
        }
        return count;
    }
}
