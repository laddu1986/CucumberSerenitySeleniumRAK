package com.cucumber;

import org.springframework.context.annotation.Scope;

import java.util.HashMap;

/**
 * Created by Laddu on 30/07/2017.
 */

@Scope("cucumber-glue")
public class CucumberCache {

    private HashMap <String, Object> activeClipBard = new HashMap<String, Object>();

    private int fingersInFist;

    public void remember(String key, Object item){
        activeClipBard.put(key,item);
    }

    public <T> T  recall(String key, Class<T> itemClass){
        return itemClass.cast(activeClipBard.get(key));
    }

    public int getFingersInFist() {
//        return fingersInFist;
        return recall("f",Integer.class);
    }

    public void setFingersInFist(int fingersInFist) {
        remember("f",fingersInFist);
//        this.fingersInFist = fingersInFist;
    }
}
