package com.avatye.cashbutton;

import android.app.Activity;
import android.app.Application;

import com.avatye.sdk.cashbutton.CashButtonConfig;
import com.avatye.sdk.cashbutton.CashButtonPosition;
import com.avatye.sdk.cashbutton.core.service.CashNotifyModel;

public class App extends Application {    // 어플리케이션 컴포넌트들 사이에서 공동으로 멤버들을 사용할 수 있게 해주는 편리한 공유 클래스
    @Override
    public void onCreate() {
        super.onCreate();
        /** cash-button initializer */
        CashNotifyModel notifyModel = new CashNotifyModel(this, true, "ADBalloonFlutter", 0, 0);     // 노티바 설정값  (context, 노티바설정유무, 앱명, 노티바 아이콘 리소스 id, 상단 상태바 아이콘 리소스 id)
        CashButtonConfig.initializer(this, CashButtonPosition.END, notifyModel);
    }

    private Activity mCurrentActivity = null;

    public Activity getCurrentActivity() {
        return mCurrentActivity;
    }

    public void setCurrentActivity(Activity mCurrentActivity) {
        this.mCurrentActivity = mCurrentActivity;
    }
}


