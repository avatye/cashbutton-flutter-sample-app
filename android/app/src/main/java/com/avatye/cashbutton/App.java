package com.avatye.cashbutton;

import android.app.Application;

import com.avatye.sdk.cashbutton.CashButtonConfig;
import com.avatye.sdk.cashbutton.CashButtonPosition;
import com.avatye.sdk.cashbutton.core.service.CashNotifyModel;

public class App extends Application {    // 어플리케이션 컴포넌트들 사이에서 공동으로 멤버들을 사용할 수 있게 해주는 편리한 공유 클래스
    @Override
    public void onCreate() {
        super.onCreate();
        CashNotifyModel notifyModel = new CashNotifyModel(this, true, "ADBalloonFlutter", 0, 0);
        CashButtonConfig.initializer(this, CashButtonPosition.END, notifyModel);
    }
}


